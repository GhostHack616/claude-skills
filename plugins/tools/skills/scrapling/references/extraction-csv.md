# Extraction structurée vers CSV

Pour passer d'une URL à un fichier CSV propre : annuaire d'entreprises, liste de contacts, prix, offres d'emploi, index d'articles. Le fetch suit le SKILL.md (choix du Fetcher, échelle d'escalade, garde-fous). Ce fichier couvre le reste : cadrage, pagination, nettoyage, export, résumé.

Répondre dans la langue de l'utilisateur.

## 1. Cadrer avant de lancer
Regarder ce que la conversation donne déjà. Demander seulement ce qui manque, en un seul message.

| À confirmer | Détail |
|---|---|
| URL(s) cible(s) | Une page, une liste de pages, ou un domaine à parcourir ? Plusieurs pages : quel motif (`/page/1`, `/page/2`, `?p=1`) ? Un domaine : jusqu'où (la page d'accueil, tous les articles, toutes les fiches) ? |
| Champs à extraire | La liste exacte. Exemples : nom d'entreprise, site, email, téléphone, URL LinkedIn. Ou : produit, prix, description, disponibilité. Ou : intitulé de poste, lieu, salaire, lien. Ou : titre, auteur, date, URL, extrait. |
| Nom du fichier | Défaut `scraped-data.csv`. Ne demander que si l'utilisateur semble y tenir. |

URL et champs déjà clairs : passer directement à l'étape 2.

## 2. Explorer la page
Avant d'écrire le script :
- repérer les éléments HTML qui portent la donnée ;
- chercher le motif qui se répète (éléments de liste, lignes de tableau, cartes) ;
- chercher la pagination (bouton "suivant", numéros de page, défilement infini) ;
- chercher les signaux anti-bot (Cloudflare, CAPTCHA, mur de login).

Puis annoncer en une ligne ce qu'on a trouvé, avant d'extraire :
> "47 éléments sur cette page, en blocs `<div class='company-card'>`. Je peux sortir : nom, email, site, ville. Pagination détectée : 8 pages. Je lance."

## 3. Choisir la stratégie
| Cas | Stratégie |
|---|---|
| La page charge ses données par une API interne | **Endpoint JSON d'abord.** Chercher dans le source les appels (`fetch(`, `axios.get(`, requêtes XHR), appeler l'endpoint directement, parser le JSON. Beaucoup plus propre que le HTML. C'est le barreau 1 de l'échelle d'escalade. |
| Page statique, liste simple, page unique | Fetcher ou CLI quick path. |
| Site paginé, HTML structuré avec classes CSS | Script Python depuis `templates/basic_fetch.py`, avec une boucle de pagination (ci-dessous). |
| Toutes les pages d'un domaine | Passer par le sitemap : tester `/sitemap.xml`, `/sitemap_index.xml`, `/sitemap-0.xml`, et lire les URLs dans les balises `<loc>`. Pour convertir un site entier en markdown : skill `apify-fetch`. |
| Cloudflare / WAF | `templates/stealth_cloudflare.py` (barreau 3). |

## 4. Pagination
Deux formes. Dans les deux cas : **1 seconde de pause entre les pages**, et on s'arrête dès qu'une page ne renvoie plus d'éléments.

Motif d'URL :
```python
import time
from scrapling.fetchers import Fetcher

BASE_URL = "https://example.com/listings?page={page}"
results = []
page_num = 1
while True:
    page = Fetcher.get(BASE_URL.format(page=page_num), impersonate='chrome', timeout=30)
    items = page.css(".item-class")  # adapter le sélecteur
    if not items:
        break
    for item in items:
        results.append({
            "name": item.css(".name::text").get() or "",
            "url": item.css("a::attr(href)").get() or "",
        })
    page_num += 1
    time.sleep(1)  # pause polie entre les requêtes
```

Bouton "suivant" :
```python
from urllib.parse import urljoin

url = START_URL
while url:
    page = Fetcher.get(url, impersonate='chrome', timeout=30)
    # extraire les éléments...
    next_href = page.css("a[rel='next']::attr(href), .pagination-next a::attr(href)").get()
    url = urljoin(url, next_href) if next_href else None
    time.sleep(1)
```

Les appels suivent `templates/basic_fetch.py`. Si la signature diffère selon la version de Scrapling, la doc upstream fait foi (`references/upstream.md`).

Sélecteurs de départ, à adapter au site :
| Type de page | Bloc répété | Champs |
|---|---|---|
| Annuaire / liste (entreprises, personnes, offres) | `.listing-card` | nom, lien (`a`), lieu |
| Index d'articles / blog | `article` | titre (`h2`), date (`time[datetime]`), lien, auteur |
| Liste de produits | `.product-item` | nom, prix, lien, image (`img[src]`) |

## 5. Rate limit (429)
- Attendre 5 secondes, réessayer une fois.
- Encore 429 : attendre 30 secondes, réessayer une fois.
- Toujours bloqué : prévenir l'utilisateur et s'arrêter. Ne pas insister.

## 6. Nettoyer
- Retirer toutes les balises HTML des valeurs texte.
- Retirer les espaces en début et fin de chaque champ.
- URLs : les rendre absolues, en `https://` (ajouter le domaine si le chemin est relatif).
- Emails : en minuscules, sans espaces.
- Téléphones : les garder tels quels (les formats varient selon les pays).
- Champ manquant : chaîne vide `""`. Jamais `null`, `None` ou `N/A`.
- Champs numériques (prix, quantité) : retirer devise et unité, garder le nombre.

**Dédoublonnage, avant d'écrire le CSV :**
- retirer les lignes strictement identiques ;
- s'il existe un identifiant unique (URL, email, ID), dédoublonner dessus ;
- annoncer : "X doublons retirés, Y lignes uniques écrites."

**Contrôle qualité :**
- compter les valeurs vides par champ. Plus de 30 % de vide : champ signalé "creux" ;
- caractères illisibles (problème d'encodage) : refaire le fetch en `utf-8` ;
- valeurs tronquées (texte qui finit par `…`) : le signaler.

## 7. Écrire le CSV
```python
import csv

output_path = "scraped-data.csv"

with open(output_path, "w", newline="", encoding="utf-8-sig") as f:
    # utf-8-sig ajoute le BOM pour qu'Excel lise bien les accents
    writer = csv.DictWriter(f, fieldnames=list(results[0].keys()))
    writer.writeheader()
    writer.writerows(results)

print(f"{len(results)} lignes écrites dans {output_path}")
```

Règles de format :
- Encodage `utf-8-sig` (BOM, compatible Excel).
- Séparateur : virgule par défaut, **point-virgule si l'utilisateur est français ou européen**.
- Mettre entre guillemets les champs texte qui peuvent contenir le séparateur.
- Première ligne : les en-têtes, en `snake_case`, minuscules, sans espaces.
- Pas de colonne d'index, sauf demande explicite.

| Nom brut | En-tête CSV |
|---|---|
| Company Name | `company_name` |
| Email Address | `email` |
| Phone Number | `phone` |
| LinkedIn URL | `linkedin_url` |
| Job Title | `job_title` |
| Date Published | `published_date` |

## 8. Rendre la main
Donner le chemin du fichier, puis un résumé court :
```
Scrape terminé.

URL(s) : [liste]
Lignes extraites : X
Doublons retirés : Y
Colonnes : [liste]
Champs creux (plus de 30 % de vide) : [liste ou "aucun"]

[Avertissements, par exemple : "La page 3 a renvoyé un 403, ses données peuvent manquer."]
```

## Règles
- Ne jamais inventer une donnée : un champ introuvable reste vide.
- CSV sans données privées dans un repo public : ne pas le commiter sans accord.
- Les garde-fous du SKILL.md s'appliquent (accès autorisé, `robots.txt`, pas de contournement de CAPTCHA ni de login).

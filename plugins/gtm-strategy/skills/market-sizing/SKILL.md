---
name: market-sizing
description: >-
  À utiliser pour chiffrer un marché (TAM, SAM, SOM) en bottom-up d'abord, avec
  le top-down comme simple contrôle, quand on demande "taille de marché",
  "combien pèse ce marché", "marché adressable", "SAM", "SOM" ou "chiffre le
  marché". Pour le parcours complet (ICP + chiffrage + comptes), c'est la
  skill tam qui orchestre.
---
# Taille de marché (TAM / SAM / SOM)

But : un chiffre défendable pour décider, pas un chiffre gonflé pour une slide.

## Entrée
- Le produit, le marché visé, la zone géographique.
- Lire d'abord le contexte dispo (fichiers, CRM en place, notes). Poser une question seulement si le produit ou le marché manque complètement.

## Sortie
Un fichier `market-sizing-{marché}.md` avec : définition du marché, TAM/SAM/SOM avec tous les calculs, hypothèses avec niveau de confiance, sources, ce que ça change.
Chaque chiffre montre son calcul. Pas de conclusion sans calcul.

## Les trois chiffres
| Chiffre | Définition | À quoi il sert |
|---|---|---|
| TAM | Tout le revenu possible si on prenait 100 % du marché | Plafond théorique, pour cadrer la catégorie |
| SAM | La part du TAM qu'on peut vraiment atteindre avec l'offre et les canaux actuels | L'opportunité réelle |
| SOM | La part du SAM qu'on peut vraiment prendre sur 3 à 5 ans | La cible de travail |

On planifie avec le SAM et le SOM. Le TAM sert seulement à cadrer.

## Étape 0 : faut-il calculer maintenant ?
Faire ce test avant tout calcul.
- **Pas d'ICP clair.** Le bottom-up repose sur les filtres de l'ICP (taille, secteur, zone). Avec un ICP flou, le chiffre a l'air précis et il est faux. Faire d'abord la skill `icp-builder`, puis revenir ici.
- **Personne ne décidera rien avec.** Si aucun plan (recrutement, objectifs, budget) ne dépend du SOM, faire seulement le calcul dont la question a besoin.
- **La catégorie n'existe pas encore.** Ne pas chiffrer un marché qu'il faut inventer pour le décrire. Le dire, et s'arrêter.
- **Le bon chiffre existe déjà.** S'il y a des deals gagnés et un ICP stable, le SOM le plus utile est souvent : pipe des 12 prochains mois × taux de gain actuel. Faire ce calcul léger avant l'exercice complet.

Si un de ces cas s'applique, le dire en une ligne et proposer la suite.

## Méthode 1 : bottom-up (à faire en premier)
```
TAM = nombre de clients potentiels × panier moyen annuel
SAM = TAM × part atteignable (filtres ci-dessous)
SOM = dérivé de la capacité commerciale (voir plus bas)
```

### 1. Compter les clients potentiels
Sources possibles (en citer au moins une, avec la date) :
- annuaires et bases d'entreprises filtrables par taille, secteur, zone (LinkedIn Sales Navigator, Apollo, etc.) ;
- statistiques publiques par code d'activité (NAF/NACE en Europe, SIC/NAICS aux US) ;
- pages catégories de comparateurs de logiciels (nombre d'éditeurs = indice de maturité du marché) ;
- volume d'offres d'emploi sur un rôle précis (signal que l'entreprise a le besoin).

Si un ICP existe déjà (sortie de `icp-builder`), reprendre ses fourchettes (secteurs, tailles, zones). Ne pas compter les profils de l'ICP négatif.

### 2. Fixer le panier moyen
- Si on a des clients : le panier réel, tiré des deals gagnés du CRM.
- Sinon : les prix publics des concurrents, ajustés au positionnement.
- Toujours donner trois valeurs : prudente / base / haute.

Note CRM (optionnel, noms de champs à vérifier sur le compte) :
- HubSpot : deals avec `hs_is_closed_won = true`, montant dans `amount_in_home_currency`, date dans `closedate`.
- Pipedrive : deals au statut `won`, champ `value`, date `won_time`.
- Sinon : un export CSV des deals gagnés suffit.

### 3. Appliquer les filtres
| Filtre | Ce qu'il retire |
|---|---|
| Zone | Les pays où on n'opère pas |
| Taille | Hors fourchette ICP |
| Techno | Ceux qui n'ont pas les outils dont l'offre a besoin |
| Budget | Ceux qui ne peuvent pas payer le panier |
| Propension réelle | Ceux qui n'ont pas vraiment le problème, ou ne cherchent pas à le régler |

**La propension réelle est le filtre où l'on se ment le plus.** Le vrai concurrent est souvent un tableur, l'outil déjà en place ou ne rien faire. Pour chaque segment, regarder ce qu'il fait aujourd'hui :
- il paie déjà un concurrent : entrée SAM forte ;
- il bricole (tableur, process manuel) : entrée moyenne ;
- il n'a pas encore vu le problème : entrée faible.
Ne pas les compter comme également atteignables.

## Méthode 2 : top-down (contrôle seulement)
1. Trouver une étude de marché sur la catégorie la plus proche (rapport public, fédération pro, résumé d'étude trouvé sur le web).
2. Réduire : zone, segment (taille, secteur, usage), part de la catégorie que l'offre couvre vraiment.
3. Comparer au bottom-up.

Limites : études souvent vieilles de 18 à 24 mois, catégories trop larges, chiffres optimistes. Les études payantes (Gartner, IDC, Forrester) sont optionnelles : vendues en abonnement annuel, pas à l'unité.

## Réconcilier les deux
- Ne jamais faire la moyenne des deux chiffres.
- **Un grand écart est un diagnostic.** Le plus souvent : catégorie trop large côté top-down, ou mauvais comptage / mauvais panier côté bottom-up. Repère indicatif (règle de terrain, pas une étude) : au-delà d'un écart d'environ 2 à 3×, s'arrêter et chercher la cause avant de publier.
- Le bottom-up porte le résultat. Le top-down sert de garde-fou.

## Hypothèses : obligatoires
Lister chaque hypothèse avec son niveau de confiance.
| Confiance | Critère |
|---|---|
| Haute | Donnée directe : comptage réel, chiffre publié, données CRM |
| Moyenne | Estimation raisonnable appuyée sur une donnée |
| Basse | Aucune donnée : le signaler et montrer la sensibilité |

**Sensibilité :** pour chaque hypothèse basse, recalculer avec la valeur ×2 et ÷2. La conclusion tient-elle ?

**Règle d'arrêt :** si doubler ou diviser par deux une seule hypothèse basse change la conclusion (on y va / on n'y va pas), c'est cette hypothèse la vraie question. Ne pas publier : aller chercher la donnée (vrai comptage, vrais prix concurrents, deals réels) d'abord.

## SOM : le dériver, ne pas le choisir
- Interdit : "SAM × 2 %" sans calcul derrière.
- Calcul : `SOM annuel = nb de commerciaux × deals réalistes par commercial et par an × panier moyen`.
- Puis vérifier quel % du SAM ça représente.
- Si ce SOM demande une équipe que le plan ne peut pas recruter dans la période, le SOM est le chiffre de capacité, pas le pourcentage.
- Repère indicatif (règle de terrain, pas une étude) : une part de marché au-delà d'environ 5 % sur 5 ans est presque toujours fausse pour un nouvel entrant.

## Ce que ça change (à écrire dans le livrable)
1. Plafond de revenu réaliste à 5 ans avec les canaux actuels.
2. Le segment le plus accessible en premier (tête de pont).
3. Ce qu'il faudrait changer pour agrandir le SAM : nouvelle zone, nouveau segment, nouvelle offre.
4. Le marché grandit-il ou rétrécit-il ? Un petit marché en croissance peut valoir mieux qu'un gros en déclin.

## Erreurs fréquentes
- Partir du TAM : il cadre, il ne planifie pas.
- Reprendre un chiffre d'étude sans savoir ce qu'il contient.
- Confondre valeur et volume : le même montant peut être beaucoup de petits clients ou quelques très gros. Implications opposées.
- Ne pas montrer le calcul.
- Choisir un taux de capture au lieu de le dériver de la capacité.

## Règles
- Ne jamais inventer un chiffre. Chaque nombre a une source ou est marqué comme hypothèse avec sa confiance.
- Toujours : calculs visibles, sources datées, niveaux de confiance.
- Lecture seule : rien de modifié dans le CRM ou les outils.

---

## Annexe : sources
Du moins cher au plus cher. Toujours noter la source et la date.

**Gratuit ou peu cher**
- LinkedIn Sales Navigator : nombre d'entreprises par secteur, taille, zone.
- Statistiques publiques : nombre d'entreprises par code d'activité (NAF/NACE en Europe via Eurostat ou l'institut national, SIC/NAICS aux US).
- Crunchbase : levées de fonds, nombre d'entreprises dans une catégorie.
- Comparateurs de logiciels (G2, Capterra) : nombre d'éditeurs et d'avis, comme signal de maturité.
- Statista : études agrégées (une partie gratuite).
- Recherche web + archives (Wayback Machine) : résumés publics d'études de marché.

**Payant (optionnel)**
- Gartner, IDC, Forrester : abonnement annuel. Vérifier d'abord un accès via une bibliothèque, une école ou un partenaire.
- PitchBook, CB Insights : investissements comme indice d'activité du marché.
- SimilarWeb, Semrush : estimations de trafic pour les marchés en ligne.

**Données internes**
- CRM en place (HubSpot, Pipedrive, ou export CSV) : panier réel et nombre de deals gagnés.

Les données internes servent à fixer le panier et le taux de gain. Elles ne remplacent pas le comptage des clients potentiels, qui vient des sources externes.

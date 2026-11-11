---
name: icp-builder
description: >-
  Construit ou revoit le profil client idéal (ICP) d'une entreprise : ICP sur 4
  dimensions, ICP négatif et grille de score sur 100. Deux modes choisis tout
  seuls : à partir des deals gagnés du CRM (ou d'un export CSV), ou en mode
  hypothèse quand il n'y a encore aucune donnée (nouveau client, nouvelle
  offre). À utiliser quand on demande "ICP", "client idéal", "qui cibler",
  "définir l'ICP", "revoir notre ICP", "on vend à tout le monde", "meilleurs
  clients pour X", "define ICP", "who should we target", "best customers for
  X", "outbound targeting", "narrow audience", "segment customers" ou "build
  me an outbound ICP". À lancer avant toute liste et toute rédaction. Ne fait
  pas la personne à contacter (skill persona-builder), ni les tiers et la
  liste de comptes (skill abm), ni les filtres de recherche (skill
  list-builder).
---
# ICP : le profil client idéal

Un ICP fait d'envies est une liste de souhaits. Un ICP tiré des deals gagnés est un filtre de ciblage.
Sans deals, on part d'hypothèses étroites, marquées comme telles, à remplacer dès que les données arrivent.

## Entrée
Lire d'abord ce qui existe, avant toute question :
- un fichier `icp-*.md` déjà présent ;
- `offre-*.md` (sortie de `offer-builder`), le contexte de l'entreprise, le site ;
- le CRM en place ou un export CSV des deals gagnés et perdus.

Poser 1 à 3 questions au maximum, seulement si une info manque et change le résultat (produit et problème réglé, 2 ou 3 meilleurs clients actuels, ordre de prix, contraintes de zone ou de secteur). Sinon déduire et marquer "hypothèse".

## Choisir le mode (sans demander)
| Situation | Mode |
|---|---|
| Un `icp-*.md` existe déjà | **Revue.** Le lire, ne pas le refaire. Proposer seulement ce qui doit bouger (nouvelles données, test de validation, critères de revalidation), puis aller au bloc Suite. |
| Deals gagnés disponibles (minimum 20) | **Deals gagnés.** Étapes 1 à 6. |
| Moins de 20 deals | **Hypothèse**, en se servant des quelques deals comme indices, pas comme preuve. |
| Ni CRM ni deals (nouveau client) | **Hypothèse.** |

Dire en une ligne le mode retenu et pourquoi.

## Sortie
Un fichier `icp-{entreprise}.md` avec : ICP sur 4 dimensions, ICP négatif, grille de score sur 100, test de validation. En mode hypothèse : les 2 fiches ICP retenues, chaque élément marqué "hypothèse".
Les tiers et la liste de comptes sont faits par `abm`, qui reprend la grille telle quelle.
Livrer dès le premier passage : un ICP partiel sur 20 deals vaut mieux qu'un ICP vide qui attend des données parfaites.

## Ce qu'un vrai ICP dit
- Qui achète, **reste et rachète** (pas seulement qui signe).
- Ce qui se passait dans l'entreprise au moment de l'achat.
- À quoi ressemble un futur bon client avant qu'il nous connaisse.

La dimension "situation" est celle qu'on oublie le plus. Un compte peut coller parfaitement sur le papier et ne pas acheter aujourd'hui, puis devenir le client idéal le jour où il change de dirigeant ou lève des fonds.

# Mode hypothèse (aucune donnée)
Gabarits, exemples et tests : `references/mode-hypothese.md`.
1. **Générer 3 à 5 hypothèses d'ICP, étroites.** Assez précises pour bâtir une liste demain. Chacune : profil d'entreprise, outils, déclencheurs, acheteur. S'appuyer sur la recherche web : concurrents, clients cités publiquement, offres d'emploi.
2. **Noter et classer.** 1 à 5 sur douleur, budget, atteignabilité, timing (sur 20). Ce score classe les hypothèses, il ne note pas les comptes.
3. **Fiche complète pour les 2 meilleures seulement** : douleur centrale, réponse de l'offre, angle de message, preuve, filtres pour la liste, et une première phrase d'ICP négatif.
4. **Test "trop large".** Resserrer avec stade + déclencheur + rôle. Jamais "toutes les startups".
5. **Barre de qualité.** 500 à 5 000 contacts trouvables demain sur LinkedIn ou Apollo. Des millions : trop large. Quelques dizaines : trop étroit.
6. **Ranger dans le fichier** selon les 4 dimensions de l'étape 3 ci-dessous et reprendre la grille de l'étape 5 avec ses poids de départ. Tout est marqué "hypothèse", avec la confiance.

# Mode deals gagnés

## Étape 1 : exploiter les deals gagnés
Procédure complète et champs CRM : `references/deals-gagnes.md`.
- Deals gagnés des 18 à 24 derniers mois. Minimum 20 deals, idéal 50 et plus.
- Pour chaque deal : profil d'entreprise, outils utilisés, forme du deal (panier, durée de cycle, nb de personnes impliquées, source, rôle du champion), ce qu'ils faisaient avant nous, et le résultat aujourd'hui (parti, actif, en croissance).
- Mettre de côté les deals hors norme : réseau perso du fondateur, prix exceptionnel. Ils peuvent servir d'anecdote, pas de donnée.

## Étape 2 : trouver le motif
Faire un tableau croisé :
- lignes : secteur ;
- colonnes : tranche d'effectif ;
- valeurs : nb de deals, panier moyen, durée moyenne de cycle, taux de départ.

**Garder la case où panier, rétention et réachat sont tous au plus haut.** C'est le Tier 1. Le reste est Tier 2 ou moins.

**Le meilleur, pas le plus gros.**
- Meilleur = valeur client la plus haute, coût d'acquisition le plus bas, démarrage rapide, satisfaction et recommandations.
- Le plus gros deal parti au bout de 6 mois est une donnée d'ICP négatif.
- Ne pas laisser un seul gros logo définir la case gagnante.

**Deux pics éloignés = deux ICP.** Si le tableau sort deux profils très différents (par exemple petits comptes rapides et gros comptes à cycle long), ne pas les mélanger. Un ICP fait de la moyenne des deux décrit un client qui n'existe pas. Écrire deux ICP avec la même méthode.

Les traits qui ressortent le plus souvent : le secteur, la taille au moment de l'achat, la présence d'un rôle précis (le champion), la maturité des outils, le déclencheur.

## Étape 3 : l'ICP en 4 dimensions

### 1. Profil d'entreprise
| Critère | Tier 1 (cœur) | Tier 2 (possible) | Exclu |
|---|---|---|---|
| Secteur | issu des deals gagnés | secteurs voisins | secteurs qui partent |
| Effectif | fourchette du pic | autour du pic | trop petit / trop gros |
| CA | fourchette du pic | voisin | hors fourchette |
| Financement | stade du pic | voisin | exclu |
| Zone | zone du pic | voisine | exclue |

Ce tableau est un menu, pas une barrière. Exiger que toutes les lignes collent en même temps réduit la liste à presque rien. On resserre avec la grille de score, pas avec le tableau.

### 2. Outils (techno)
- Signaux positifs : les outils qui montrent la maturité et la compatibilité.
- Signaux négatifs : les combinaisons qui annoncent un cycle long, pas de budget ou un départ rapide (par exemple : tout sur tableur).

### 3. Comportement d'achat
- Quels contenus ils consultent avant le premier contact.
- Le chemin type du premier contact à la signature (entrant via quoi, sortant sur quel déclencheur).
- **Le comité d'achat :** souvent plus proche de 5 rôles que de 2 : décideur budgétaire, champion, utilisateur final, évaluateur technique (sécurité, intégration), achats/juridique. Noter lesquels étaient présents ou absents sur les deals gagnés.
- Les objections qui reviennent, et ce qui les lève.
- Source : parler aux 5 à 10 derniers clients. Quel problème précis les a fait chercher ? Quelles alternatives ont-ils regardées ? Quelle preuve les a convaincus ? Leurs mots valent plus que n'importe quel document interne.

### 4. Situation (déclencheurs)
Regrouper les deals gagnés par ce qui a lancé l'achat :
- nouveau dirigeant (direction commerciale, marketing, revenus) ;
- levée de fonds récente (fenêtre d'environ 90 jours après) ;
- forte croissance des effectifs (plus de 20 % en 6 mois) ;
- projet stratégique (nouveau marché, nouvelle offre, lancement d'une prospection sortante) ;
- seuil de douleur franchi (échec avec l'outil actuel, objectifs ratés, gros deals perdus).

**Règle des 60 % :** si au moins 60 % des deals gagnés partagent le même déclencheur, il devient central dans le ciblage. Il dit **quand** appeler, pas seulement qui. Le surveiller ensuite (veille web, alertes d'offres d'emploi, actualités).

## Étape 4 : l'ICP négatif (à qui ne pas vendre)
**Commencer par une phrase simple qu'un commercial peut dire à voix haute**, par exemple "on ne vend pas aux entreprises sans personne dédiée au sujet". Puis les critères.

Le construire à partir :
- des clients partis : ce qu'ils ont en commun ;
- des deals perdus qui se répètent : le profil qui perd contre un concurrent ou contre "pas de décision" ;
- des deals à gros effort et petit panier : aussi longs que les meilleurs pour une fraction du panier.

Motifs fréquents :
- trop petit : pas de budget dédié, pas de vraie douleur ;
- trop gros : achats, juridique, cycle très long ;
- mauvaise maturité : attend une fonction qui n'existe pas, ou dépasse l'offre tout de suite ;
- mauvais secteur : contraintes métier ou réglementaires qu'on ne couvre pas ;
- mauvais champion : enthousiaste mais sans pouvoir sur le budget.

## Étape 5 : grille de score sur 100
Poids de départ, à ajuster selon ce qui corrèle avec les deals gagnés :
| Dimension | Poids | Score haut si |
|---|---|---|
| Profil d'entreprise | 30 | Colle au Tier 1 sur secteur, effectif, stade |
| Outils | 20 | A les 2-3 outils qui corrèlent avec les deals gagnés |
| Déclencheur actif | 15 | Un déclencheur est en cours |
| Signaux d'intérêt | 15 | Consulte nos contenus, la page prix, ou ceux des concurrents |
| Adéquation économique | 10 | Panier prévu cohérent, mise en place réaliste |
| Filtre ICP négatif | 10 | Points retirés pour chaque critère exclu |

Seuils (repris tels quels par `abm` pour faire les tiers) :
- 75 à 100 : Tier 1, priorité immédiate, travail à la main par un commercial.
- 50 à 74 : Tier 2, séquences automatiques, surveiller l'arrivée d'un déclencheur.
- moins de 50 : Tier 3, automatique + nurturing, aucun travail à la main.

## Étape 6 : test de validation
Procédure : `references/validation.md`.
- Avant de publier : passer le test de validation. Si un point échoue, retour à l'étape 2.

# Commun aux deux modes

## Erreurs fréquentes
- Partir d'une slide de positionnement au lieu des deals gagnés, quand ils existent.
- Réduire l'ICP au profil d'entreprise : le profil filtre, les trois autres dimensions décident.
- Oublier l'ICP négatif : c'est la moitié du filtre.
- Laisser un deal hors norme définir le pic.
- Publier l'ICP une fois et ne jamais le retester.

## Règles
- Mode deals gagnés : chaque élément de l'ICP se rattache à un motif vu dans les deals. Sinon il sort.
- Mode hypothèse : chaque élément porte la mention "hypothèse" et sa confiance. Jamais présenté comme un fait.
- Une ambition (monter en gamme, nouveau segment) est une hypothèse à part, marquée comme telle, vérifiée chaque trimestre. Jamais mélangée à l'ICP.
- Toujours livrer ICP + ICP négatif ensemble.
- Revalider chaque trimestre, ou plus tôt si un signal l'impose (voir `references/validation.md`).
- Ne jamais inventer un chiffre : chaque nombre vient des données ou est marqué comme hypothèse avec sa confiance.
- Lecture seule : rien de modifié dans le CRM sans validation.

## Suite
Proposer la suite et **attendre l'accord** avant d'enchaîner. Ne rien lancer tout seul.
1. "On définit la personne à contacter ?" : `persona-builder`.
2. "On chiffre le marché ?" : `market-sizing` (ou `tam` pour le parcours complet). "On étudie le marché et la concurrence ?" : `market-research`.
3. "On fait les tiers et la liste de comptes ?" : `abm`.
4. "On passe aux filtres de recherche ?" : `list-builder`.

Si l'offre n'est pas claire (pas de `offre-*.md`, promesse floue), le dire et proposer `offer-builder` d'abord.

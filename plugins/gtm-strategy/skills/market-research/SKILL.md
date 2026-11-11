---
name: market-research
description: >-
  Étudie un marché et sa concurrence pour la prospection. Deux sorties,
  demandables ensemble ou séparément : (1) l'étude de marché : douleurs
  sourcées, impact business, tendances, segmentation et EDP (les chiffres
  "existentiels" qui font passer une solution d'utile à indispensable), (2) la
  carte de la concurrence : jeu concurrentiel sur 3 niveaux, fiches
  concurrents, différenciation, réponses types et battlecard pour les SDR. À
  utiliser quand on demande "étude de marché", "analyse le marché de X", "les
  douleurs de ce secteur", "qui sont nos concurrents", "analyse
  concurrentielle", "comment on se compare à X", "research the X market",
  "find EDPs for X", "outbound play for X", "who are our competitors",
  "competitive analysis", "find alternatives to X", "battlecard" ou "how to
  beat X". Ne chiffre pas la
  taille du marché (skill market-sizing, ou tam pour le parcours complet).
  N'analyse pas les clients de l'entreprise elle-même (skill offer-builder)
  ni un compte cible précis (skill trigger-finder).
---
# Étude de marché et carte de la concurrence

But : des faits sourcés qu'un commercial peut mettre dans un message aujourd'hui. Pas un rapport de plus.
Un **EDP** (existential data point) est un chiffre ou un seuil qui crée une vraie urgence : il fait passer la solution de "bien à avoir" à "indispensable".

## Entrée
Lire d'abord ce qui existe, avant toute question :
- un fichier `market-research-*.md` déjà présent : le lire, ne pas le refaire, proposer seulement une mise à jour ;
- `offre-*.md`, `icp-*.md`, `persona-*.md`, `market-sizing-*.md` ou `tam-*.md` ;
- le site de l'entreprise, les concurrents déjà cités dans le contexte.

Poser 1 à 3 questions au maximum, en un seul message, seulement si l'info manque et change le résultat :
- la catégorie exacte à étudier (par exemple "plateformes d'engagement commercial") ;
- le segment visé (taille, secteur), si aucun ICP n'existe ;
- un angle ou une hypothèse à vérifier, ou un concurrent précis contre lequel se positionner.

Par défaut : étude complète. Faire un survol rapide seulement si c'est demandé.

## Sortie
Un fichier `market-research-{marché}.md`. Gabarits : `references/gabarit-etude.md` et `references/gabarit-concurrence.md`.
| Demande | Ce qu'on livre |
|---|---|
| "Étudie le marché", "trouve les EDP", "les douleurs du secteur" | Partie 1 (avec un résumé du jeu concurrentiel) |
| "Nos concurrents", "battlecard", "comment battre X" | Partie 2 seule |
| Les deux, ou demande large | Parties 1 et 2 |

Annoncer le plan de recherche en 2 ou 3 lignes, puis commencer.

## Méthode de recherche (les deux parties)
Recherche web poussée : au moins 2 ou 3 recherches ciblées par section. Privilégier :
- rapports d'analystes et comparateurs (Gartner, Forrester, G2, Capterra) ;
- actualités récentes de levées et de rachats ;
- Reddit, communautés Slack, posts LinkedIn où les praticiens parlent franchement ;
- cas clients et calculateurs de retour sur les sites des éditeurs ;
- offres d'emploi (elles trahissent les douleurs et les priorités).

**Précis et sourcé.** "Beaucoup d'entreprises ont du mal avec X" est refusé. Écrire "selon [source], X % des entreprises déclarent Y". Si la donnée n'existe pas, le dire.

## Partie 1 : étude de marché
Rapport en 8 sections, puis EDP et segments :
1. **Résumé.** Ouvrir sur le constat le plus surprenant ou contre-intuitif. Finir sur les 1 ou 2 EDP les plus forts.
2. **Vue d'ensemble du marché.** Moteurs de croissance précis, freins à l'adoption, place dans l'écosystème. **Pas de calcul de taille ici** : reprendre les chiffres de `market-sizing-*.md` ou `tam-*.md` s'ils existent, sinon citer au plus un chiffre publié avec sa source et sa date, et renvoyer à `market-sizing`.
3. **Douleurs et difficultés** (la matière première des EDP). 3 à 5 douleurs sans la solution, avec preuves : ce qui casse, à quelle fréquence, ce que ça coûte, temps perdu chiffré, citations de praticiens.
4. **Impact business et retour.** Indicateurs suivis, gains rapportés (sourcés), délai avant résultat, coût de l'inaction, 2 ou 3 cas concrets chiffrés.
5. **Réglementation et risques.** Pressions réglementaires, sécurité et confidentialité, conformité par secteur, risque de réputation.
6. **Tendances.** Horizon 2 à 3 ans, technologies qui bousculent le marché, attentes des acheteurs.
7. **Segmentation des clients.** Profils d'acheteurs, différences d'adoption, champion type, déclencheurs d'achat, durée de cycle et personnes impliquées.
8. **Facteurs de réussite.** Indispensable ou secondaire, intégrations requises, facteurs d'organisation qui annoncent le succès ou l'échec.

Puis :
- **5 à 7 EDP, par ordre de priorité.** Pour chacun : le chiffre, pourquoi il est existentiel, comment s'en servir dans un message, la source et le niveau de confiance.
- **3 à 5 hypothèses de segments par douleur.** Pour chacun : profil, douleur centrale, EDP qui porte le plus, accroche d'ouverture en une phrase.
- **Sources**, regroupées par section, avec URL.

## Partie 2 : carte de la concurrence
**Le jeu concurrentiel sur 3 niveaux :**
| Niveau | Qui |
|---|---|
| 1. Directs | Même catégorie, même acheteur, prix proche. Les noms auxquels le prospect va comparer. |
| 2. Indirects | Autre façon de régler le même problème : "on l'a fait en interne", "on combine des outils moins chers". |
| 3. Statu quo | Ne rien faire, tableur, process manuel, vieil outil. Souvent le premier concurrent. **Ne jamais l'oublier.** |

Où chercher : rubrique "Alternatives" de G2, comparatifs Capterra, recherches "[produit] vs" et "alternative à [produit]", ProductHunt, offres d'emploi qui citent des outils.

Pour chaque concurrent direct : une fiche (positionnement, ICP visé, prix, forces dites honnêtement, faiblesses tirées des avis, promesse phare, pourquoi on le choisit, pourquoi on nous choisit, angle quand le prospect l'utilise).

Puis : tableau de synthèse, carte de différenciation (où on gagne, **où on perd**), réponses types aux trois situations ("on utilise X", "on a regardé X et on l'a choisi", "jamais entendu parler de la catégorie"), et la battlecard SDR (à mettre en avant, à éviter, preuves).

## Barre de qualité (avant de livrer)
Si une réponse est non, chercher encore.
- Au moins un constat surprenant ou contre-intuitif.
- Tous les chiffres ont une source.
- Un commercial peut utiliser les EDP dans un email à froid aujourd'hui.
- Les segments sont assez différents pour appeler des messages différents.
- Les forces des concurrents sont décrites honnêtement, le statu quo est présent.
- Chaque différenciation repose sur une vraie raison, pas sur "on est meilleurs".
- Un SDR peut répondre à "on utilise X" en moins de 30 secondes.

## Règles
- Ne jamais inventer un chiffre, une part de marché ni une citation. Pas de source : c'est une hypothèse, marquée avec sa confiance (haute, moyenne, basse).
- Chaque source est datée. Signaler les études de plus de 18 à 24 mois.
- Ne pas recalculer la taille du marché : c'est `market-sizing`.
- Rien de publié ni d'envoyé sans validation.

## Suite
Proposer la suite et **attendre l'accord** avant d'enchaîner. Ne rien lancer tout seul.
1. "On chiffre le marché ?" : `market-sizing` (ou `tam` pour ICP + chiffrage + comptes).
2. "On resserre le ciblage sur le meilleur segment ?" : `icp-builder`, puis `persona-builder`.
3. "On transforme un EDP en séquence ?" : `outbound-campaign-architect`, puis `cold-email-writer` et `linkedin-outreach`.
4. "On surveille les signaux de ce marché ?" : `trigger-finder`.

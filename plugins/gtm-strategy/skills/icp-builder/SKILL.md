---
name: icp-builder
description: >-
  À utiliser pour construire ou revoir un profil client idéal (ICP) à partir
  des deals gagnés du CRM (ou d'un export CSV), avec l'ICP négatif et une
  grille de score sur 100, quand on demande "ICP", "client idéal", "qui
  cibler", "revoir notre ICP" ou "on vend à tout le monde". Ne fait pas la
  liste de comptes ni les tiers : c'est la skill abm.
---
# ICP à partir des deals gagnés

Un ICP fait d'envies est une liste de souhaits. Un ICP tiré des deals gagnés est un filtre de ciblage.

## Entrée
- Les deals gagnés (CRM en place ou export CSV), le contexte de l'entreprise, l'ICP actuel s'il existe.
- Lire d'abord ce qui est dispo. Poser une seule question si aucune donnée n'existe.
- **Pas encore de deals gagnés :** faire un ICP de départ à partir de recherches web (concurrents, clients cités publiquement, offres d'emploi), marqué "hypothèse". Il sera remplacé dès qu'il y aura des deals.

## Sortie
Un fichier `icp-{entreprise}.md` avec : ICP sur 4 dimensions, ICP négatif, grille de score sur 100, test de validation.
Les tiers et la liste de comptes sont faits par `abm`, qui reprend cette grille telle quelle.
Livrer dès le premier passage : un ICP partiel sur 20 deals vaut mieux qu'un ICP vide qui attend des données parfaites.

## Ce qu'un vrai ICP dit
- Qui achète, **reste et rachète** (pas seulement qui signe).
- Ce qui se passait dans l'entreprise au moment de l'achat.
- À quoi ressemble un futur bon client avant qu'il nous connaisse.

La dimension "situation" est celle qu'on oublie le plus. Un compte peut coller parfaitement sur le papier et ne pas acheter aujourd'hui, puis devenir le client idéal le jour où il change de dirigeant ou lève des fonds.

## Étape 1 : exploiter les deals gagnés
Procédure complète et champs CRM : annexe « deals gagnés » plus bas.
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
Procédure : annexe « validation » plus bas.
- Avant de publier : passer le test de validation. Si un point échoue, retour à l'étape 2.
- Pour passer de l'ICP à une liste de comptes par tier : lancer `abm`.

## Erreurs fréquentes
- Partir d'une slide de positionnement au lieu des deals gagnés.
- Réduire l'ICP au profil d'entreprise : le profil filtre, les trois autres dimensions décident.
- Oublier l'ICP négatif : c'est la moitié du filtre.
- Laisser un deal hors norme définir le pic.
- Publier l'ICP une fois et ne jamais le retester.

## Règles
- Chaque élément de l'ICP doit se rattacher à un motif vu dans les deals. Sinon il sort.
- Une ambition (monter en gamme, nouveau segment) est une hypothèse à part, marquée comme telle, vérifiée chaque trimestre. Jamais mélangée à l'ICP.
- Toujours livrer ICP + ICP négatif ensemble.
- Revalider chaque trimestre, ou plus tôt si un signal l'impose (voir l'annexe).
- Ne jamais inventer un chiffre : chaque nombre vient des données ou est marqué comme hypothèse avec sa confiance.
- Lecture seule : rien de modifié dans le CRM sans validation.

---

## Annexe : deals gagnés

**Périmètre**
- Deals gagnés des 18 à 24 derniers mois. Minimum 20, idéal 50 et plus.
- Prendre aussi les deals perdus de la même période : ils nourrissent l'ICP négatif.

**Où trouver les données :** le CRM en place, ou un export CSV si pas d'accès direct.

HubSpot (optionnel, noms à vérifier sur le compte, un admin peut les avoir renommés) :
- Deal : `hs_is_closed_won`, `hs_is_closed_lost`, `dealstage`, `closedate`, `days_to_close` (durée de cycle déjà calculée), `amount_in_home_currency` (panier), `closed_won_reason`, `closed_lost_reason`, `num_associated_contacts` (indice de taille du comité d'achat).
- Entreprise : `industry`, `numberofemployees`, `annualrevenue`, `hs_ideal_customer_profile`, `hs_is_target_account`.
- Le stade de financement n'est pas un champ standard : à compléter par recherche web.

Pipedrive (optionnel, noms à vérifier sur le compte) :
- Deal : statut `won` / `lost`, `value`, `won_time`, `lost_reason`.
- Organisation : secteur et effectif sont souvent des champs personnalisés. Vérifier leur nom avant de lire.

**Attention aux raisons de gain ou de perte :** c'est le commercial qui les tape. Il adoucit souvent une perte et transforme un coup de chance en motif. S'en servir pour trier les deals avant les entretiens clients, pas comme un fait.

**Ce qu'on note pour chaque deal**
- Profil : secteur précis (pas "logiciel", mais "logiciel d'aide à la vente B2B"), effectif et tranche de CA au moment de l'achat, zone, stade de financement, croissance (rythme de recrutement comme indice).
- Outils : CRM, outils marketing, outils de prospection, outils de données et d'enrichissement, intégrations qui ont rendu l'offre utile ou inutile.
- Forme du deal : panier, durée de cycle, nombre de personnes impliquées, source (entrant ou sortant), rôle du champion, rôle du décideur budgétaire, ce qu'ils faisaient avant nous (concurrent nommé, tableur, outil en place, ou rien : le statu quo est le "concurrent" le plus fréquent).
- Résultat : parti, actif ou en croissance, revenu additionnel, recommandation (témoignage, parrainage, satisfaction).

---

## Annexe : validation

**Test de validation (avant de publier)**
1. Appliquer l'ICP au pipe ouvert. Les comptes les mieux notés convertissent-ils mieux ?
2. L'appliquer aux deals perdus du dernier trimestre. Les comptes mal notés y sont-ils surreprésentés ?
3. Demander à 3 commerciaux : "Est-ce que ça décrit les deals les plus faciles à signer ?" Si non, chercher ce que les données ont raté et l'ajouter aux dimensions 3 ou 4. Les données disent ce qui s'est passé, les commerciaux disent pourquoi.
4. Scorer aussi les renouvellements et les clients en croissance. Un compte qui note haut à l'achat et bas en rétention va dans l'ICP négatif.

Si tout tient : publier. Si un point échoue : retour à l'étape 2.

**Quand revalider**
- Tous les 20 à 30 nouveaux deals gagnés, ou chaque trimestre, au premier des deux.
- Tout de suite si le taux de gain du Tier 1 baisse deux mois de suite, ou si un même nouveau déclencheur apparaît sur 3 deals gagnés d'affilée sans être dans la dimension 4.

---
name: tam
description: >-
  Parcours complet de ciblage : à utiliser quand on demande "fais-moi un TAM",
  "TAM SAM SOM", "TAM complet", "dimensionne le marché et donne-moi les
  comptes", ou tout brief qui veut à la fois un chiffre de marché, un ICP et
  une liste de comptes. Enchaîne icp-builder → market-sizing → abm et sort un
  seul livrable. Pour un seul des trois morceaux, appeler directement la skill
  concernée. Pour le parcours client entier jusqu'à la campagne : gtm-kickoff.
---
# TAM : le parcours complet

Chef d'orchestre. Il appelle `icp-builder`, puis `market-sizing`, puis `abm` (optionnel), et assemble un seul livrable.
L'ordre compte : le bottom-up de `market-sizing` repose sur les fourchettes de l'ICP. Sans ICP d'abord, on calcule deux fois.

## 1. Contexte
Rassembler avant de calculer :
- le produit ou l'offre, le marché visé, la zone ;
- les données dispo : CRM en place (HubSpot, Pipedrive) ou export CSV des deals gagnés et perdus ; outil de prospection (par exemple Lemlist) ;
- le but : décider, prioriser, préparer une liste de comptes ?

Lire d'abord ce qui existe. Poser **au maximum une question**, seulement si le produit ou le marché manque.

## 2. ICP d'abord
Lancer `icp-builder` :
- avec des deals gagnés (idéalement 20 ou plus) : ICP sur 4 dimensions, ICP négatif, grille de score sur 100 ;
- sans deals gagnés : ICP de départ marqué "hypothèse", confiance basse. Le dire en tête du livrable.

## 3. Taille de marché
Lancer `market-sizing` avec les fourchettes de l'ICP :
- le test "faut-il calculer ?" d'abord ;
- bottom-up en premier (compter avec les filtres de l'ICP, retirer l'ICP négatif, panier réel des deals gagnés), top-down en contrôle ;
- SOM dérivé de la capacité commerciale.

## 4. Comptes par tier (optionnel)
Seulement si on veut une liste cible : lancer `abm` avec la grille de score de l'étape 2. C'est `abm` qui fait les tiers 1/2/3 et la liste, calés sur la capacité commerciale.

## 5. Livrable
Un seul fichier `tam-{marché}.md` :
1. **Définition du marché** : offre, cible, zone, ce qui est inclus et exclu.
2. **ICP + ICP négatif** : ou "hypothèse" si pas de deals.
3. **TAM / SAM / SOM avec calculs** : chaque étape écrite, bottom-up et top-down, écart expliqué.
4. **Hypothèses + confiance** : haute / moyenne / basse, sensibilité ×2 / ÷2 sur les basses.
5. **Comptes par tier** : si demandé.
6. **Sources** : chaque source avec sa date.
7. **Ce que ça change** : tête de pont, plafond réaliste, prochaine action.

## Règles
- Ne jamais inventer un chiffre. Sans source, c'est une hypothèse avec sa confiance.
- Toujours : calculs visibles, sources, niveaux de confiance.
- Si une hypothèse basse fait basculer la conclusion, le dire en tête et proposer d'aller chercher la donnée.
- Lecture seule : rien d'envoyé, rien de modifié dans le CRM ou les outils sans validation.

## Suite
Proposer la suite et attendre l'accord :
- passer à la liste de leads : `list-builder` (plugin `lemlist`) ;
- creuser le marché ou la concurrence : `market-research` ;
- dérouler tout le parcours client jusqu'à la campagne : `gtm-kickoff`.

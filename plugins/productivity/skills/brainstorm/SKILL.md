---
name: brainstorm
description: Vrai brainstorm structuré qui transforme une idée floue en design ou plan d'action validé. Mélange de grill-me (interrogatoire serré, une question à la fois, hypothèses challengées) et du brainstorming de superpowers (exploration du contexte, 2-3 approches avec trade-offs, design présenté section par section, doc final). Marche pour une idée produit/code ET pour une idée business, growth, offre, campagne. Utiliser sur "brainstorm", "j'ai une idée", "on réfléchit à", "aide-moi à creuser", "challenge cette idée", "on conçoit", avant toute création de feature ou lancement d'un nouveau projet.
---

# Brainstorm

Transformer une idée en design validé par un dialogue exigeant. Deux moteurs combinés : le **grill** (questions serrées qui challengent) et la **structure** (contexte → approches → design → doc).

<HARD-GATE>
Aucune implémentation, aucun code, aucun livrable final, aucune action externe tant que le design/plan n'a pas été présenté ET validé par l'utilisateur. Même si le sujet paraît simple. "Simple" est l'endroit où les hypothèses non examinées coûtent le plus cher.
</HARD-GATE>

## Étape 1 : explorer le contexte AVANT de questionner
- Sujet code/produit : lire le repo, les docs, les commits récents.
- Sujet business/growth (offre, campagne, positionnement) : lire ce qui existe (profil, stats, Notion, fichiers du repo). Ne jamais poser une question dont la réponse est déjà dans les fichiers : aller la chercher (règle grill-me).
- **Scope check immédiat** : si l'idée recouvre plusieurs sous-projets indépendants, le dire tout de suite et découper AVANT de creuser les détails. On brainstorme le premier sous-projet, pas la nébuleuse.

## Étape 2 : le grill (cœur du skill)
Interroger sans relâche jusqu'à compréhension partagée, en descendant chaque branche de l'arbre de décision, dépendance par dépendance.

Règles :
- **Une seule question par message.** Jamais de rafale.
- **Chaque question vient avec ta réponse recommandée** (et pourquoi). L'utilisateur valide ou corrige, ça va plus vite.
- **QCM de préférence** quand les options sont énumérables, ouvert sinon.
- **Challenger, pas collecter.** Si une réponse repose sur une hypothèse fragile (chiffre supposé, "tout le monde fait ça", besoin non vérifié), le dire et creuser. Jouer l'avocat du diable sur les points faibles. Un brainstorm qui ne fait que noter les réponses est un compte-rendu, pas un brainstorm.
- Cibler : objectif réel, contraintes, critères de succès, ce qu'on refuse de faire.
- S'arrêter quand les branches sont résolues, pas avant, pas après.

## Étape 3 : proposer 2-3 approches
- Toujours 2-3 options avec leurs trade-offs, jamais une seule voie.
- Commencer par l'option recommandée et expliquer pourquoi.
- **YAGNI impitoyable** : virer de chaque option tout ce qui ne sert pas l'objectif validé à l'étape 2.

## Étape 4 : présenter le design / plan, section par section
- Présenter par sections proportionnées à leur complexité (2 phrases si simple, un paragraphe si nuancé).
- Valider chaque section avant de passer à la suivante. Revenir en arrière sans friction si quelque chose cloche.
- Sujet code : architecture, composants, flux de données, erreurs, tests.
- Sujet business : cible, promesse, canal, mécanique, mesure du succès, risques.

## Étape 5 : écrire le doc et le faire relire
1. Écrire le design/plan validé dans un fichier du repo courant (ex: `docs/brainstorms/YYYY-MM-DD-<sujet>.md`), et le commit si le repo s'y prête.
2. **Self-review à froid** avant de le donner : placeholders ou "TBD" restants ? contradictions internes ? ambiguïtés (une exigence lisible de deux façons) ? scope encore trop large ? Corriger inline.
3. Demander à l'utilisateur de relire le doc. Ne passer à l'implémentation (ou au lancement) qu'après son feu vert explicite.

## Principes
- Une question à la fois, toujours avec recommandation.
- Explorer les fichiers plutôt que demander.
- Challenger les hypothèses faibles, sans complaisance.
- 2-3 approches avant de trancher, YAGNI sur tout.
- Validation incrémentale : jamais un pavé final à prendre ou à laisser.
- Le livrable du brainstorm est le doc validé, pas l'implémentation.

---
*Hybride de grill-me (Matt Pocock, MIT) et du skill brainstorming de superpowers (obra/superpowers, adapté : sans visual companion ni chaîne writing-plans, élargi aux sujets business/growth).*

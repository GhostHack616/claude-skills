---
name: gtm-kickoff
description: >-
  Chef d'orchestre du parcours GTM complet d'un client, de l'offre à la
  campagne envoyée. Regarde ce qui existe déjà (offre, ICP, persona, liste,
  campagne), dit où on en est, propose l'étape suivante et enchaîne les skills
  une par une après accord. À utiliser quand on dit "je démarre un client",
  "nouveau client", "on lance un client", "kickoff", "onboarding client",
  "par où je commence", "on en est où sur ce client", "enchaîne tout",
  "client kickoff", "start a new client". Ne pas utiliser pour une étape
  isolée : appeler directement la skill concernée (icp-builder, list-builder,
  cold-email-writer, etc.). Pour un chiffrage de marché seul : tam.
---
# GTM kickoff : le parcours complet, étape par étape

Chef d'orchestre. Il ne produit rien lui-même : il regarde où en est le client, lance la bonne skill, attend l'accord, puis passe à la suivante.

## 1. Faire l'état des lieux (avant toute question)
Chercher dans le repo, le CRM et l'outil de prospection ce qui existe déjà.

| Étape | Skill | C'est fait si on trouve |
|---|---|---|
| 1. Offre | `offer-builder` | `offre-*.md`, ou une offre claire dans le contexte |
| 2. ICP | `icp-builder` | `icp-*.md` |
| 3. Persona | `persona-builder` | `persona-*.md` |
| 4. Marché (optionnel) | `tam`, `market-sizing`, `market-research` | `tam-*.md`, `market-sizing-*.md`, `market-research-*.md` |
| 5. Comptes par tier | `abm` | `abm-*.md` |
| 6. Liste | `list-builder` (+ `trigger-finder`, `niche-data-finder`) | une liste de leads dans l'outil de prospection, ou un export |
| 7. Structure de campagne | `outbound-campaign-architect` | une séquence définie (canaux, étapes, délais) |
| 8. Messages | `cold-email-writer`, `linkedin-outreach`, `cold-call-script` | les messages écrits |
| 9. Relecture | `copy-review` | les messages notés et corrigés |
| 10. Mise en ligne | `copy-lemlist` | la campagne remplie dans Lemlist |
| 11. Après l'envoi | `reply-handler`, `outbound-analyst`, `pipeline-analysis` | campagne en cours |

Rendre l'état des lieux en un tableau court : étape, statut (fait / partiel / à faire), fichier trouvé.

## 2. Choisir le point de départ
- **Nouveau client, rien n'existe :** partir de l'étape 1.
- **Client déjà engagé :** partir de la première étape « à faire ». Ne jamais refaire une étape faite. Proposer une revue seulement si le fichier a plus de 3 mois ou si l'utilisateur le demande.
- **L'utilisateur nomme une étape :** y aller directement. Si une étape d'avant manque et change le résultat (pas d'ICP avant la liste, pas de liste avant les messages), le dire en une ligne et proposer de la faire d'abord. S'il refuse, continuer avec une hypothèse marquée comme telle.

Poser **au maximum une question**, seulement si on ne sait ni qui est le client ni ce qu'il vend.

## 3. Enchaîner
Pour chaque étape :
1. Annoncer en une ligne ce qu'on lance et pourquoi.
2. Lancer la skill. Elle lit les sorties des étapes d'avant.
3. Donner le résultat en 3 lignes maximum, avec le chemin du fichier.
4. **Proposer l'étape suivante et attendre l'accord.** Jamais deux étapes d'affilée sans un « ok ».

L'utilisateur peut dire « enchaîne jusqu'à l'étape N » : dans ce cas ne s'arrêter qu'aux points de contrôle ci-dessous.

## Points de contrôle (toujours s'arrêter)
- Après l'ICP : c'est lui qui conditionne tout le reste.
- Avant toute écriture dans le CRM ou dans l'outil de prospection.
- Avant tout envoi. `copy-lemlist` montre deux brouillons avant de déployer.

## Raccourcis utiles
- Besoin d'un chiffre de marché pour décider : `tam` (il enchaîne `icp-builder` → `market-sizing` → `abm`).
- Petit panier, gros volume : sauter l'étape 5, aller de l'ICP à la liste.
- Gros panier, peu de comptes : l'étape 5 (`abm`) passe avant la liste, et le Tier 1 s'écrit à la main.
- Pub payante en plus de l'outbound : les skills du plugin `paid-ads` reprennent le même ICP (`audience-architecture`, `ad-creative-brief`).

## Règles
- Ne rien inventer : si une étape repose sur une hypothèse, elle reste marquée « hypothèse » dans toutes les étapes suivantes.
- Un fichier par étape, dans le repo du client. Ne pas tout fusionner dans un seul document.
- Lecture seule tant que l'utilisateur n'a pas validé : rien d'envoyé, rien de modifié dans le CRM ou l'outil de prospection.
- Si une skill de la chaîne n'est pas installée dans le repo courant, le dire et donner la commande d'installation, au lieu d'improviser son contenu.

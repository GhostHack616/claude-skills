---
name: trigger-finder
description: >-
  Lit les signaux d'achat (levée, recrutements, changement d'outil, changement
  de poste, activité LinkedIn, fusion-acquisition) et les traduit en douleur
  probable, angle et bon moment de contact. Deux modes : stratégique (pour un
  ICP, quels déclencheurs surveiller et quel angle pour chacun) et tactique (un
  compte ou un signal précis : douleurs classées, stratégie d'approche, niveau
  de confiance). À utiliser quand on parle de "signaux", "déclencheurs",
  "intention d'achat", "bon moment pour contacter", "ils viennent de lever",
  "ils recrutent", "quelles sont les douleurs de [société]", "pourquoi [société]
  achèterait", "recherche de compte", "triggers", "buying intent", "when should
  I reach out", "they just raised", "they just hired", "pain points for
  [company]", "account research", "qualify this lead". Régler les signaux dans
  Lemlist : list-builder. Profil LinkedIn d'une personne : linkedin-outreach.
  Écrire le message : cold-email-writer. Déclencheurs tirés des deals gagnés :
  icp-builder.
---
# Trigger Finder : du signal à la douleur, à l'angle et au moment

But : contacter un compte au moment où il a le plus de chances d'acheter, avec l'angle le plus pertinent.

Deux idées tiennent toute la skill :
- **Un déclencheur signale un changement.** Le changement crée de nouveaux problèmes, de nouveaux budgets, une urgence. Un compte fermé le mois dernier peut être ouvert ce mois-ci.
- **Les douleurs sont prévisibles.** Elles suivent le stade, les signaux de croissance, les outils, le secteur. Tout l'art est de savoir quel signal révèle quelle douleur, et ce que ça change pour le message.

## Entrée
- Lire d'abord ce qui existe : `icp-*.md`, `persona-*.md`, `abm-*.md`, l'offre, le contexte de la conversation.
- Il faut : le produit et le problème qu'il règle (une phrase), la cible (ICP ou compte précis), les déclencheurs déjà utilisés ou déjà connus.
- Demander seulement ce qui manque, en un seul message, 3 questions au plus.

## Étape 1 : choisir le mode
| Mode | L'utilisateur donne | Exemples |
|---|---|---|
| A. Stratégique | Une cible ou un produit, sans compte précis | "Je cible les VP Sales en Série B", "quels signaux surveiller ?" |
| B. Tactique | Un compte, un signal ou un événement précis | "Notion vient de lever", "ils recrutent 5 SDR", "quelles sont les douleurs de [société] ?" |

Si c'est ambigu, une seule question : "Tu veux une stratégie de déclencheurs pour un segment, ou réagir à un signal sur un compte ?"

## Mode A : playbook de déclencheurs (pour un ICP)
1. **Cadrage, un paragraphe :** pourquoi l'approche par déclencheurs marche pour cet ICP, et à quoi ressemble sa fenêtre d'achat (quand ces entreprises ont vraiment budget et urgence).
2. **5 à 7 fiches déclencheur**, les plus fortes pour cet ICP, piochées dans `references/declencheurs.md` :

| Champ | Contenu |
|---|---|
| Signal | Ce qui s'est passé, ce qu'il faut chercher |
| Pourquoi ça compte pour cet ICP | La logique métier, propre à l'ICP. Pas une phrase valable pour tout le monde. |
| Fenêtre | Combien de temps après le signal avant que le moment passe |
| Qui contacter | Le persona qui devient le plus pertinent après ce signal |
| Angle | Le "et alors" qui rend le message opportun. Pas un message complet. |
| Dans Lemlist | Oui (quel signal) ou non |
| Détection externe | Si pas dans Lemlist : alertes LinkedIn, Google Alerts, Crunchbase, G2, etc. |

3. **Top 3 :** les 3 déclencheurs prioritaires, une phrase de justification chacun.
4. **Combinaison :** comment empiler deux signaux dans une même séquence. Levée + recrutement de SDR cités ensemble dans l'ouverture : le message paraît très documenté.

## Mode B : fiche compte ou signal
1. **Profil du compte** (LinkedIn, site, Crunchbase, recherche web) : secteur précis, effectif, stade, ce qu'ils vendent et à qui, arrivées récentes, postes ouverts, levée, actualités.
2. **Détecter les signaux** : recrutement, financement, outils, autres. Table signal → douleur dans `references/signaux-douleurs.md`.
3. **Relier chaque signal à une douleur, puis noter chaque douleur de 1 à 5 :**

| Critère | Poids |
|---|---|
| Gravité (à quel point ça fait mal) | 30 % |
| Solidité de la preuve | 25 % |
| Adéquation avec l'offre | 25 % |
| Urgence | 20 % |

**Score au-dessus de 3,5 : ouvrir le message avec cette douleur.**

4. **Sortie**, modèle complet dans `references/signaux-douleurs.md` :
   - **Signal détecté** et **pourquoi ce moment compte** (2 à 3 phrases : ce qui a changé, pourquoi ils sont plus ouverts maintenant qu'il y a 3 mois) ;
   - **fenêtre** : combien de temps elle reste ouverte, ce qu'on perd à attendre ;
   - **qui contacter** et pourquoi ;
   - **douleurs classées** (3 au plus) : description concrète, preuve, impact métier, impact personnel pour le rôle, urgence, réponse de l'offre, angle ;
   - **à ne pas faire** avec ce signal ;
   - **stratégie d'approche** : angle principal + 3 questions de découverte (faire émerger la douleur, chiffrer l'impact, révéler l'urgence) ;
   - **niveau de confiance** par douleur ;
   - **automatiser** : quel signal Lemlist régler pour capter ce cas à l'avenir, et comment le surveiller à l'échelle.

## Niveau de confiance
| Confiance | Critère |
|---|---|
| Haute | Preuve directe : signal observé et daté |
| Moyenne | Inférence forte : motif de stade ou de secteur |
| Basse | Supposition. À marquer comme hypothèse à tester en découverte. |

## Règles
- **Chaque douleur se rattache à un signal observable.** Sinon elle sort.
- Pas de douleur générique ("besoin d'efficacité") : une description précise.
- **Ne pas ouvrir par des félicitations.** C'est générique et ça montre qu'on ne sait qu'une chose sur eux.
- Séparer le signal intéressant du signal existentiel. Les meilleurs annoncent un changement si fort que ne rien faire serait une erreur.
- Proposer le réglage Lemlist chaque fois qu'il existe : le but est un dispositif répétable, pas un coup isolé.
- Ne jamais inventer un chiffre ni un fait sur le compte. Impact chiffré seulement avec une donnée réelle, sinon le décrire.
- Un commercial qui lit la sortie doit savoir quoi dire et pourquoi maintenant.

## Suite
Proposer la suite et attendre l'accord :
1. Mode A : régler ces signaux dans une recherche avec `list-builder`. Si un déclencheur revient sur la majorité des deals gagnés, le remonter dans `icp-builder`.
2. Mode B : écrire le message avec `cold-email-writer`, `linkedin-outreach` (si on a le profil du contact) ou `cold-call-script`.
3. Plusieurs comptes à classer : `abm` pour les tiers.

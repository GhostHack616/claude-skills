# Du signal à la douleur (mode tactique)

## Douleurs typiques par stade
| Stade | Effectif | Douleurs typiques |
|---|---|---|
| Pre-seed / Seed | 1 à 25 | Tout est manuel, trop de casquettes, pas de process |
| Série A | 25 à 75 | Monter la machine commerciale, première équipe de vente, process chaotiques |
| Série B | 75 à 200 | Manques d'efficacité, données en silos, besoin de meilleurs outils et d'ops |
| Série C et plus | 200 à 500 | Opérations complexes, sécurité et conformité, vente grands comptes |
| Mature | 500 et plus | Dette technique, intégrations, conduite du changement |

Repères indicatifs : les tranches d'effectif par stade varient d'une source à l'autre.

## Signal → douleur probable

**Recrutement (page emplois LinkedIn)**
| Signal | Douleur probable |
|---|---|
| Recrute des SDR / BDR | Monte l'outbound, besoin d'un outil de séquences |
| Recrute un RevOps | Process de vente chaotique, besoin de systèmes |
| Recrute en Customer Success | Risque de churn, support à passer à l'échelle |
| Recrutement rapide (10 postes ouverts et plus) | Douleurs de croissance, difficultés d'onboarding |
| Nouveau VP ou C-level | Mandat de changement, fenêtre d'évaluation d'outils (90 premiers jours) |

**Financement**
| Signal | Douleur probable |
|---|---|
| Vient de lever | Pression pour grandir et déployer le capital vite |
| 12 à 18 mois depuis la levée | Prochain tour en approche, besoin de métriques |
| Passage Série A → B | L'efficacité remplace la croissance à tout prix |

**Outils**
| Signal | Douleur probable |
|---|---|
| A Salesforce mais pas d'outil de séquences | Prospection manuelle |
| HubSpot en version de base | Dépasse l'outil, besoin de plus d'automatisation |
| Pas d'outil d'enrichissement | Recherche manuelle, temps perdu |
| Outils anciens | Douleur d'intégration, mauvaise ergonomie |

**Autres**
| Signal | Douleur probable |
|---|---|
| Nouveau bureau, expansion géographique | Coordination, localisation |
| Lancement de produit | Mise sur le marché d'une nouvelle offre, message à trouver |
| Presse, jalons franchis | Croissance rapide, douleurs de passage à l'échelle |

## Grille de score d'une douleur
Noter de 1 à 5 sur chaque critère, puis pondérer.
| Critère | Poids |
|---|---|
| Gravité (à quel point ça fait mal) | 30 % |
| Solidité de la preuve (confiance que c'est réel) | 25 % |
| Adéquation avec l'offre (à quel point on la règle) | 25 % |
| Urgence (besoin de régler maintenant) | 20 % |

Score au-dessus de 3,5 : ouvrir le message avec cette douleur.

## Modèle de sortie
```
# Analyse du compte : [Société]

Contexte : [secteur | effectif | stade | ce qu'ils font]

Signal détecté : [le déclencheur, reformulé clairement]
Pourquoi ce moment compte : [2 à 3 phrases : ce qui a changé, quel problème ou quelle
occasion ça crée, pourquoi maintenant plutôt qu'il y a 3 mois]
Fenêtre : [durée, et ce qu'on perd à attendre]
Qui contacter : [persona(s) et pourquoi]

Signaux relevés :
- [Signal 1] → indique [douleur]
- [Signal 2] → suggère [douleur]
- [Signal 3] → confirme [douleur]

## Douleurs prioritaires

### Douleur 1 : [nom] (score X/5)
La douleur : [description concrète]
Preuve : [signal(s)]
Impact métier : [coût, revenu perdu, inefficacité ; chiffré seulement avec une donnée réelle]
Impact personnel pour [rôle] : [effet sur son poste, son bonus, sa carrière]
Urgence : [pourquoi maintenant]
Réponse de l'offre : [capacité précise]
Angle : "I noticed [signal]. Most [similar companies] struggle with [pain]. We help [outcome]. Worth a chat?"

### Douleur 2 : [nom] (score X/5)
[même structure, abrégée]

### Douleur 3 : [nom] (score X/5)
[même structure, abrégée]

## À ne pas faire
[erreurs classiques avec ce signal, ex. ouvrir par des félicitations]

## Stratégie d'approche
Angle principal : [douleur 1 : ouverture + accroche de valeur + preuve]
Questions de découverte :
1. [pour faire émerger la douleur 1]
2. [pour chiffrer l'impact]
3. [pour révéler l'urgence]

## Niveau de confiance
- Haute : [douleurs avec preuve directe]
- Moyenne : [inférence forte, motif de stade ou de secteur]
- Basse : [supposition, hypothèse à tester en découverte]

## Automatiser
Signal Lemlist à régler : [lequel]
Surveiller à l'échelle : [outils, alertes, recherches]
```
L'angle est un point de départ, à écrire dans la langue du prospect. Le message complet se fait avec `cold-email-writer`, `linkedin-outreach` ou `cold-call-script`.

## Contrôle qualité
- Chaque douleur est-elle reliée à un signal observable ?
- Les douleurs sont-elles précises, pas génériques ?
- Le classement est-il clair ?
- Y a-t-il un angle pour chaque douleur, pas seulement une analyse ?
- Le certain et le supposé sont-ils séparés ?
- La fenêtre est-elle réaliste et actionnable ?

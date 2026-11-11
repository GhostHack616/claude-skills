---
name: abm
description: >-
  À utiliser pour transformer un ICP en liste de comptes cibles par tier
  (1/2/3), avec score de fit sur 100, score d'engagement et règles de passage
  d'un tier à l'autre, quand on demande "ABM", "comptes cibles", "liste de
  comptes", "tiers de comptes", "stratégie par compte" ou "liste de comptes
  nommés". Demande un ICP en entrée (skill icp-builder si absent).
---
# ABM (version légère) : tiers de comptes et score d'engagement

But : savoir quels comptes travailler à la main, lesquels automatiser, et quand agir.
Pas de plan de campagne lourd : on s'arrête aux tiers, au score et aux règles.

## Entrée
- L'ICP et sa grille de score sur 100 (sortie de `icp-builder`), le panier moyen, le nombre de comptes visés, la capacité commerciale (nb de personnes qui prospectent).
- Lire d'abord le contexte dispo. Pas d'ICP du tout : lancer `icp-builder` d'abord. Poser une question seulement si le panier manque complètement.

## Sortie
Un fichier `abm-{segment}.md` avec : critères par tier, liste de comptes par tier (si les données le permettent), grille de sélection, score d'engagement et seuils, règles de passage.

## Étape 1 : les 3 tiers
Tailles indicatives tirées des pratiques courantes, à caler ensuite sur la capacité réelle :
| Tier | Approche | Taille indicative | Pour qui |
|---|---|---|---|
| 1 | 1 pour 1, à la main | 10 à 50 comptes | Meilleur ICP + déclencheur actif |
| 2 | 1 pour quelques-uns, par secteur | 50 à 200 comptes | Bon ICP, moins urgent |
| 3 | Automatique | 200 à 1000+ comptes | ICP correct, priorité basse |

**Pas de déclencheur = pas de Tier 1.** Coller au profil donne une place sur la liste. Un événement réel, récent et vérifiable (nouveau dirigeant, levée, recrutements, projet annoncé) donne le travail à la main.

**Caler les tiers sur la capacité :** `taille Tier 1 ≤ nb de commerciaux × comptes qu'un commercial peut vraiment personnaliser`. Un Tier 1 trop gros pour l'équipe est un plan que personne n'exécute.

## Étape 2 : construire et scorer la liste
1. Partir des fourchettes de l'ICP (secteur, effectif, zone, outils).
2. Sortir les comptes candidats :
   - le CRM en place : comptes déjà connus jamais signés ;
   - bases d'entreprises (LinkedIn Sales Navigator, Apollo) ;
   - Crunchbase pour financement et croissance, BuiltWith pour les outils visibles sur le site (techno publique seulement) ;
   - recherche web : actualités, levées, offres d'emploi ;
   - données produit si elles existent (essais, comptes gratuits).
   Les outils d'intention payants sont optionnels, et souvent redondants entre eux : en prendre un seul.
3. Retirer tout ce qui tombe dans l'ICP négatif.
4. Scorer chaque compte sur 100 **avec la grille d'`icp-builder`** (profil 30, outils 20, déclencheur actif 15, signaux d'intérêt 15, adéquation économique 10, filtre ICP négatif 10). Une seule grille pour l'ICP et l'ABM : pas de deuxième barème.
5. Ranger par tier : 75+ → Tier 1 (si déclencheur actif, sinon Tier 2), 50 à 74 → Tier 2, moins de 50 → Tier 3.

Les poids sont ceux de départ d'`icp-builder`, à remplacer dès que les deals gagnés montrent ce qui prédit vraiment une signature. Si un critère hors grille compte (valeur stratégique : logo, référence, réseau), l'ajouter dans la grille d'`icp-builder`, pas ici.

Dans le CRM ou l'outil de prospection : noter le tier et le score dans un champ ou une note (par exemple `T1 - 82 pts`).

**Une liste sans "pour qui ce n'est pas" n'est pas une liste cible.** Si les critères Tier 1 laissent passer presque tout le pipe, les resserrer.

## Étape 3 : score d'engagement par compte
On additionne au niveau du compte, pas du contact.
| Signal | Points |
|---|---|
| Visite du site (toute page) | 1 |
| Email ouvert | 2 |
| Clic sur une pub | 3 |
| Page produit / fonctionnalités | 5 |
| Téléchargement de contenu | 5 |
| Clic dans un email | 5 |
| Page prix | 10 |
| Page prix vue par un dirigeant (*) | 20 |
| Inscription à un essai | 40 |
| Demande de démo | 50 |

Barème indicatif à recaler sur ses propres données.
(*) Suppose un outil qui identifie les comptes visiteurs (dé-anonymisation IP, par exemple Clearbit Reveal, Leadfeeder, RB2B). Sans cet outil, ignorer cette ligne : on ne sait pas qui visite.

Seuils sur les 30 derniers jours :
- **Chaud (50+) :** contact commercial dans la semaine.
- **Tiède (20 à 49) :** nurturing + alerte au commercial.
- **Froid (moins de 20) :** automatique seulement.

**Le score sert à router le travail, pas à faire joli.** Un compte chaud qui n'est pas contacté dans la semaine n'apprend rien au modèle. Si franchir un seuil ne change jamais ce que fait quelqu'un, arrêter de tenir le score.

Où le tenir : un champ ou une note dans le CRM en place, ou un tableur. Dans l'outil de prospection (par exemple Lemlist), taguer le tier.

## Étape 4 : règles de passage
- **Monter :** un compte Tier 2 avec un déclencheur ou un score chaud passe en Tier 1.
- **Descendre avant de dépenser plus :** un compte Tier 1 qui n'a pas bougé après un cycle complet repasse en Tier 2. Le temps va aux comptes qui montrent un signal.
- **Sortir :** un compte Tier 2/3 qui ne réagit jamais sort de la liste, sinon elle coûte de plus en plus cher.

## Règles d'exécution
- **Une seule demande par message**, quel que soit le canal (email, LinkedIn, appel).
- **Délivrabilité d'abord :** avant de monter le volume du Tier 3, vérifier l'authentification du domaine et le préchauffage. Gmail et Yahoo refusent les envois en masse non conformes (authentification manquante, taux de plainte au-delà d'environ 0,3 %, pas de désinscription en un clic).
- **Séparer les domaines d'envoi :** ne pas envoyer le volume Tier 3 depuis le même domaine que le Tier 1.
- **Personnaliser vraiment :** insérer le nom de l'entreprise dans un modèle n'est pas de la personnalisation.
- Optionnel : pubs ciblées par compte, contenus sur mesure, événements. Seulement si le panier justifie plus d'une heure de travail par compte.

## Erreurs fréquentes
- Faire les tiers sur le seul profil d'entreprise.
- Un Tier 1 dimensionné sur l'ambition plutôt que sur la capacité.
- Aucune sortie pour les comptes qui ne réagissent jamais.
- Un score d'engagement sans lien avec les actions commerciales.

## Règles
- Aucun envoi, aucune modification dans le CRM ou l'outil de prospection sans validation.
- Ne jamais inventer un chiffre : les tailles, poids et points ci-dessus sont des repères indicatifs, à remplacer par ses propres données.

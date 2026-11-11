---
name: persona-builder
description: >-
  Définit et classe les personas acheteurs, c'est-à-dire la personne précise à
  contacter dans les comptes de l'ICP. Deux modes choisis tout seuls : mode
  hypothèse (2 à 4 personas tirés de l'offre et de l'ICP, notés, fiches des 2
  meilleurs) ou mode transcripts (analyse d'appels de vente : objectifs,
  douleurs, objections, verbatims, signaux d'achat). À utiliser quand on
  demande "persona", "qui contacter", "quel poste cibler", "qui décide",
  "analyse mes appels", "ce que disent mes acheteurs", "who should I email",
  "define buyer persona", "what role to target", "who is the decision maker",
  "should I target VPs or Directors", "analyze my calls", "extract insights
  from transcripts" ou quand on fournit des transcripts (CSV, Gong, Modjo,
  Claap, Chorus, Fireflies, texte collé). À lancer après l'ICP : l'entreprise
  cible se définit avec icp-builder, l'analyse d'un profil LinkedIn précis
  avec linkedin-outreach, les filtres de recherche avec list-builder.
---
# Persona : la personne qui achète

L'ICP dit quelle entreprise ("SaaS en série A"). Le persona dit quelle personne dans cette entreprise ("VP Sales, équipe de 5, rend compte au CEO, jugé sur le pipe").
Un persona est un **rôle précis**, pas un service. "SDR Manager dans un SaaS en série A, équipe de 3 à 8, rend compte au VP Sales", pas "l'équipe commerciale".

## Entrée
Lire d'abord ce qui existe, avant toute question :
- un fichier `persona-*.md` déjà présent ;
- `icp-*.md` et `offre-*.md` ;
- des transcripts d'appels : outil d'enregistrement connecté, export CSV, texte collé, PDF ou DOCX.

Poser 1 à 3 questions au maximum, en un seul message, seulement si l'info manque et change le résultat : ce que fait le produit et le problème réglé, l'ordre de prix, qui s'en sert au quotidien et qui signe. Sinon déduire et marquer "hypothèse".

## Choisir le mode (sans demander)
| Situation | Mode |
|---|---|
| Un `persona-*.md` existe déjà | **Revue.** Le lire, ne pas le refaire. Proposer seulement ce qui doit bouger. |
| Des transcripts sont fournis ou accessibles | **Transcripts.** |
| Aucun transcript | **Hypothèse.** |
| Pas d'ICP du tout | Le dire et proposer `icp-builder` d'abord. |

Dire en une ligne le mode retenu et pourquoi.

## Sortie
Un fichier `persona-{entreprise}.md`. En mode hypothèse : 2 fiches persona, tout est marqué "hypothèse". En mode transcripts : le rapport complet, avec le nombre de transcripts et la confiance en tête.

# Mode hypothèse
Gabarit de fiche et barème détaillé : `references/fiche-persona.md`.

## Étape 1 : le prix donne le niveau
Repère tiré de la source, à ajuster au marché :
| Prix annuel | Niveau de l'acheteur |
|---|---|
| moins de 5 000 $ | contributeur individuel ou manager |
| 5 000 à 50 000 $ | directeur |
| 50 000 à 250 000 $ | VP |
| 250 000 $ et plus | direction générale ou comité d'achat |

## Étape 2 : 2 à 4 hypothèses de persona
Pour chacune : titres exacts, niveau et taille d'équipe, à qui il rend compte, **douleurs personnelles** (ses frustrations du quotidien, ce qui lui vaut des reproches, ce qui bloque sa promotion : pas les douleurs de l'entreprise), indicateurs sur lesquels **lui** est jugé, rôle dans la décision (décideur budgétaire, champion, influenceur, bloqueur), canaux préférés.

## Étape 3 : noter et garder les 2 meilleurs
Note de 1 à 5 sur douleur, pouvoir de décision, atteignabilité, timing (sur 20).

## Étape 4 : fiche complète pour les 2 meilleurs
Titres, niveau, hiérarchie, douleurs personnelles, indicateurs, rôle dans la décision, déclencheur d'achat, accroche, preuve qui parle à ce rôle, canal et moment, ton, filtres pour la liste.

## Étape 5 : test d'étroitesse
Peut-on bâtir une liste de 500 à 5 000 contacts pour ce persona ?
- Trop peu : élargir les variantes de titres ou assouplir le niveau.
- Trop : ajouter une contrainte de taille ou de stade d'entreprise.
- Bon : passer à la liste.

# Mode transcripts
Schéma d'ingestion et les 10 dimensions à extraire : `references/extraction-transcripts.md`.
Gabarit du rapport, règles sur les verbatims, confiance : `references/rapport-transcripts.md`.

## Étape 1 : cadrer (une seule passe)
Demander seulement ce qui manque : les personas visés (ou "à déduire" des titres), le format (rapport écrit par défaut, tableau de bord interactif si demandé), un angle à privilégier (objections, concurrence, manques produit, messages). Par défaut : toutes les dimensions.

## Étape 2 : ingérer
Ramener toutes les sources au même schéma. Si seul un résumé d'appel est disponible : l'analyser et le marquer en confiance plus basse.

## Étape 3 : préparer chaque transcript
1. Repérer qui est le commercial et qui est le prospect. Plusieurs prospects : le décideur principal selon son rôle.
2. Profil du prospect : nom, titre, entreprise, taille, secteur, niveau, fonction.
3. Regrouper en personas par fonction + niveau. Un prospect qui ne rentre dans aucun persona visé va dans "Autres".

## Étape 4 : extraire, par persona
Objectifs, douleurs (fonctionnelle, émotionnelle, sociale), déclencheurs, objections (avec la façon dont le commercial y a répondu), demandes produit, concurrence, processus d'achat, vocabulaire, signaux d'achat, signaux d'alerte.
**Citer mot pour mot. Ne jamais reformuler ni inventer une citation.**

## Étape 5 : synthèse entre personas
- **Douleurs universelles :** présentes dans 70 % des transcripts ou plus, quel que soit le persona. Ce sont les piliers du message.
- Douleurs propres à un persona : pour les séquences et discours sur mesure.
- Objections et demandes produit classées par fréquence (% des appels).
- Profils d'entreprise qui vont avec les cycles rapides, les cycles longs, la meilleure adéquation. À reverser dans `icp-builder`.
- Trous de message : sujets soulevés par le prospect et laissés sans réponse, écarts de vocabulaire.

## Étape 6 : recommandations (toujours)
- 3 à 5 actions pour cette semaine : messages à changer, réponses aux objections à ajouter, questions de découverte, demandes à remonter au produit.
- Supports à créer : discours par persona, fiches objections, angles de calcul de retour, angles de cas clients, douleur à mettre en tête de séquence par persona.
- Confiance et limites : nombre de transcripts par persona, trous dans les données, prochains appels à mener.

# Commun aux deux modes

## Règles
- Douleurs **personnelles** du rôle, pas celles de l'entreprise.
- Mode hypothèse : tout est marqué "hypothèse". Mode transcripts : tout repose sur une citation exacte.
- Ne jamais inventer un chiffre, une citation ni une preuve. Les pourcentages viennent d'un comptage réel des appels.
- Toujours afficher le nombre de transcripts et la confiance en tête du rapport.
- Répondre dans la langue de l'utilisateur. Laisser les verbatims dans leur langue d'origine.
- Lecture seule sur l'outil d'enregistrement et le CRM. Anonymiser le nom de l'entreprise si demandé.

## Suite
Proposer la suite et **attendre l'accord** avant d'enchaîner. Ne rien lancer tout seul.
1. "On fait les tiers et la liste de comptes ?" : `abm`.
2. "On passe aux filtres de recherche ?" : `list-builder` (et `trigger-finder` pour les signaux à surveiller).
3. "On construit la séquence ?" : `outbound-campaign-architect`, puis `cold-email-writer`, `linkedin-outreach` ou `cold-call-script`.
4. Si l'analyse des appels contredit l'ICP ou l'offre : proposer une revue avec `icp-builder` ou `offer-builder`.

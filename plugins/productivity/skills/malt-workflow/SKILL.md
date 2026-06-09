---
name: malt-workflow
description: Workflow Malt complet de bout en bout pour Romain (freelance GTM / growth). À lancer quand l'utilisateur veut traiter une offre / opportunité Malt. Le skill va chercher l'offre LUI-MÊME dans la boîte mail (connecteur Gmail, notification Malt), l'utilisateur n'a rien à coller. Il analyse l'entreprise, lit le profil pro (preuves, positionnement, ICP) dans le repo, juge le fit, puis : si l'offre est PERTINENTE, produit (1) la réponse Malt vendeuse (objectif = décrocher l'entretien) et (2) un email de renfort direct au décideur (objet "Votre futur {poste}"). Si l'offre est HORS CIBLE, produit quand même une réponse (jamais de refus sec) PLUS un "dossier Malt" qui analyse les mots-clés de l'offre pour diagnostiquer où le profil Malt a mal rancé. Utiliser sur "traite ma dernière offre Malt", "workflow Malt", "j'ai reçu une offre Malt", "regarde mes offres Malt", "réponse + email Malt".
---

# Malt Workflow

Traitement complet d'une offre Malt, de l'analyse jusqu'aux livrables prêts à envoyer. Le skill se cale sur l'activité réelle de Romain (profil + stats dans RepoPro) et s'optimise offre après offre via un journal win-loss.

S'appuie sur deux skills déjà installés dans le repo RomainPro :
- **`malt-response`** pour la logique de réponse vendeuse (à charger / appliquer).
- **`write-like-me`** + son `voice-profile.md` pour la voix (obligatoire sur toute sortie).

Si l'un des deux n'est pas chargé dans la session, le signaler en une ligne et appliquer au minimum les règles voix de base (vouvoiement, aéré, zéro tiret cadratin, zéro superlatif, aucun chiffre inventé) plutôt que de produire du générique.

## Objectif
Doubler les chances de décrocher l'entretien sur chaque offre Malt qui en vaut la peine, et transformer chaque offre hors cible en donnée d'optimisation du profil Malt. On ne livre jamais un refus sec.

## Entrées
Le skill va chercher l'offre lui-même. L'utilisateur n'a rien à coller.
1. **L'offre Malt** : le skill la lit directement dans la boîte mail via le connecteur Gmail (Malt envoie une notification à chaque opportunité). Par défaut : la plus récente. Si l'utilisateur dit "les deux dernières", en traiter deux.
2. **Le mail du décideur** (optionnel) : fourni par l'utilisateur quand il l'a scrapé lui-même via LinkedIn après avoir répondu sur Malt. Si absent, préparer quand même l'email de renfort avec un placeholder `{mail décideur}`, prêt à envoyer.

Ne JAMAIS chercher le mail du décideur soi-même : l'utilisateur s'en charge (nom + prénom obtenus sur Malt, ajout LinkedIn, scrape). Le skill récupère l'offre et produit le contenu.

## Étape 1 : récupérer l'offre + analyser l'entreprise + charger le profil
1. **Récupère l'offre dans Gmail.** Cherche les mails de Malt (expéditeur en `@malt.com`). Ne retenir que les **notifications d'opportunité / nouvelle mission** : écarter les autres mails Malt (factures, paiements, messages de la plateforme, relances admin, newsletters). Ouvrir le thread, extraire le contenu de l'offre. Par défaut la plus récente.
2. **Annoncer en une ligne l'offre retenue** (entreprise + intitulé + date) avant de dérouler, pour que l'utilisateur puisse rediriger si ce n'est pas la bonne. Ne pas bloquer en attente : il déclenche vite, enchaîner sauf objection.
3. Lis l'offre : rôle exact recherché, besoin de fond, secteur, contexte, mots-clés.
4. **Identifie le nom du poste recherché** tel qu'il sert dans l'offre (ex: "Growth Manager", "Traffic Manager", "Consultant acquisition B2B"). Il servira d'objet à l'email de renfort.
5. Analyse l'entreprise (taille, secteur, modèle, stade, enjeu d'acquisition probable). Utilise ce qui est dans l'offre ; un WebSearch léger si besoin et si le réseau le permet.
6. **Charge le profil.** Le profil de Romain, c'est **tout le repo RomainPro** : lire en priorité `comment-je-me-vends.md`, `mes-preuves.md`, `capture-a-chaud.md`, le "Profil Professionnel", et tout doc de positionnement / cas client présent. Notion ("Profil Professionnel Romain") en secours si le repo ne suffit pas. C'est la source des **vraies** preuves, chiffres, positionnement, ICP, TJM. N'invente jamais un chiffre.
7. **Charge les stats / l'activité** depuis `RepoPro/stats/` (s'ils existent) : `malt-plateforme.md` (taux de réponse, conversion par secteur, note), `historique-missions.md` (sweet spot réel, TJM par type), `win-loss.md` (le journal des offres déjà traitées, gagnées/perdues et pourquoi). Plus les résultats clients dans `mes-preuves.md`. Ces stats servent à juger sur la **réalité** de Romain, pas sur la théorie. Si les fichiers n'existent pas encore, le signaler une fois et continuer sur le profil seul (templates dans `references/repopro-stats-templates/`).

## Étape 2 : juger le fit
ICP cible : scale-up, SaaS B2B, fintech, plateforme tech qui veut scaler son acquisition sans recruter une équipe growth/sales ops.
Rôle cœur : acquisition B2B multicanale, GTM engineering, automatisation (n8n/Make), outbound (cold email + LinkedIn), paid (Meta/Google), agents IA, CRM ops.

Classe : **dans le mille** / **bon rôle, secteur adjacent** / **rôle partiel** / **hors cœur**.

**Pondère avec les stats** (si dispo) : un secteur où Romain convertit bien (malt-plateforme / win-loss) renforce le fit ; un type d'offre qu'il reçoit mais ne convertit jamais le nuance, même si la théorie dit "dans le mille". Le jugement final croise ICP théorique ET historique réel. Signale en une ligne ce que les stats apportent au verdict.

→ **Pertinent** (les trois premiers) : va à l'Étape 3A.
→ **Hors cible** (hors cœur) : va à l'Étape 3B. On répond quand même.

## Étape 3A : offre PERTINENTE -> deux livrables

### Livrable 1 : la réponse Malt
Applique entièrement `malt-response` (Règle d'or + structure gagnante) :
remercier d'avoir été sélectionné, reformuler le vrai enjeu, crédibilité par une preuve proche du besoin + un chiffre défendable, teaser consultatif (sans promettre d'angles pré-travaillés), CTA vers 30 min. Vendeuse, aérée, voix de Romain, zéro tiret cadratin. Objectif = décrocher l'entretien (étape 1 du closing).

**Choix de la preuve via les stats** : prendre la preuve / le cas client qui a le mieux converti sur ce type d'offre (mes-preuves + win-loss), pas au hasard. Si un angle a déjà gagné sur une offre similaire (win-loss), réutiliser cette logique.

### Livrable 2 : l'email de renfort direct
Second canal pour appuyer la candidature déjà déposée sur Malt. Voir le gabarit complet dans `references/email-template.md`.
- **Objet** : `Votre futur {nom du poste recherché par l'offre}`.
- **Ouverture** : "Bonjour, je me permets de vous recontacter via ce canal pour appuyer ma candidature comme répondu via Malt" (formulation ajustable selon le contenu de la réponse Malt).
- **Corps** : court, une preuve forte alignée sur l'offre, rappel de la dispo, CTA léger. Cohérent avec la réponse Malt (ne pas se contredire, ne pas tout répéter).
- Si le mail du décideur n'est pas fourni : laisser `{mail décideur}` en placeholder et le signaler.

## Étape 3B : offre HORS CIBLE -> réponse + dossier Malt

### Livrable 1 : la réponse (jamais de refus)
On répond quand même, sans "non" sec et sans "je ne suis pas le bon profil". On reformule la limite en force + solution, on garde la porte ouverte (cf. `malt-response` Étape 3, critère hors scope). Court, propre, voix de Romain.

### Livrable 2 : le dossier Malt (diagnostic de ranking)
Quand une offre arrive hors cœur, c'est un signal que le profil Malt **rance trop large** (cf. note "profil lu trop large"). On capitalise. Voir le gabarit dans `references/dossier-malt.md`. Il contient :
1. **Les mots-clés de l'offre** extraits (rôle, compétences, secteur, outils).
2. **Le mapping mots-clés -> profil** : lesquels matchent vraiment le cœur de Romain, lesquels sont du bruit qui le fait remonter à tort.
3. **Diagnostic de mis-ranking** : quel terme / compétence trop générique de son profil Malt a probablement déclenché ce mauvais matching.
4. **Recommandations d'évolution du profil** : ce qu'il faut resserrer, retirer ou préciser sur Malt pour mieux cibler l'ICP.

Le dossier s'enrichit offre après offre (capitalise, ne repars pas de zéro si un dossier existe déjà dans le repo). Croise le diagnostic avec `win-loss.md` : si le même type d'offre hors cible revient et n'est jamais converti, c'est une confirmation forte du mis-ranking, à remonter dans la reco profil.

## Étape 4 : boucler (optimisation continue)
Quelle que soit l'issue (pertinent ou hors cible), **ajouter une ligne dans `RepoPro/stats/win-loss.md`** : date, entreprise, rôle, secteur, fit jugé, angle utilisé, RDV/gagnée en attente. C'est ce journal qui fait que le skill s'améliore offre après offre. Mettre à jour la section "Patterns observés" du fichier si un signal net se dégage. Ne rien écrire de privé dans le repo public claude-skills : ces données restent dans RepoPro.

## Sortie
- **Pertinent** : la réponse Malt + l'email de renfort (objet + corps), prêts à coller. Plus une ligne sur le niveau de fit retenu (et ce que les stats y ont changé).
- **Hors cible** : la réponse + le dossier Malt (analyse mots-clés + diagnostic ranking + reco profil).
- **Toujours** : une ligne ajoutée au journal win-loss. Voix de Romain, aéré, zéro tiret cadratin, zéro superlatif creux, aucun chiffre inventé.

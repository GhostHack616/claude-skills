---
name: malt-workflow
description: Workflow Malt complet pour Romain (freelance GTM / growth), à deux modes. MODE OFFRE : quand une opportunité Malt arrive, le skill va la chercher LUI-MÊME dans Gmail, analyse l'entreprise, lit profil + stats (RepoPro), juge le fit, puis produit soit la réponse Malt vendeuse + un email de renfort direct (objet "Votre futur {poste}") si pertinent, soit une réponse + un dossier de ranking si hors cible. MODE PROFIL : quand Romain n'a pas de propal depuis un moment (disette) ou veut optimiser son compte, le skill audite son profil Malt (titre, mots-clés, description, TJM) face à ce qui marche / ne marche pas, et sort un plan de modif concret (quels mots-clés ajouter/retirer, quelle description, quel TJM). Utiliser sur "traite ma dernière offre Malt", "workflow Malt", "j'ai reçu une offre Malt", "réponse + email Malt", "optimise mon profil Malt", "j'ai pas de propal depuis X", "pourquoi je reçois plus d'offres", "audit mon profil Malt", "mes mots-clés Malt".
---

# Malt Workflow

Deux niveaux dans le même skill. Choisir le mode selon la demande :
- **Mode offre** (micro) : une opportunité Malt arrive, on la traite (réponse + email, ou réponse + dossier). C'est le défaut quand on parle d'une offre précise.
- **Mode profil** (macro) : pas d'offre à traiter. On audite et on optimise le compte Malt lui-même. Déclenché sur demande, ou en cas de **disette** (plus d'opportunités depuis un moment), ou "pourquoi je reçois moins d'offres".

Le skill se cale sur l'activité réelle de Romain (profil + stats dans RepoPro) et s'améliore dans le temps (journal win-loss + journal des changements de profil).

S'appuie sur deux skills déjà installés dans RepoPro :
- **`malt-response`** pour la logique de réponse vendeuse.
- **`write-like-me`** + son `voice-profile.md` pour la voix (obligatoire sur toute sortie, y compris une description de profil réécrite).

Si l'un des deux n'est pas chargé, le signaler en une ligne et appliquer au minimum les règles voix de base (vouvoiement, aéré, zéro tiret cadratin, zéro superlatif, aucun chiffre inventé).

---

# MODE OFFRE

## Objectif
Doubler les chances de décrocher l'entretien sur chaque offre qui en vaut la peine, et transformer chaque offre hors cible en donnée d'optimisation du profil. On ne livre jamais un refus sec.

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
7. **Charge les stats / l'activité** depuis `RepoPro/stats/` (s'ils existent) : `malt-plateforme.md` (taux de réponse, conversion par secteur, note), `historique-missions.md` (sweet spot réel, TJM par type), `win-loss.md` (le journal des offres déjà traitées, gagnées/perdues et pourquoi), `malt-profil-actuel.md` (le contenu du compte Malt). Plus les résultats clients dans `mes-preuves.md`. Ces stats servent à juger sur la **réalité** de Romain, pas sur la théorie. Si les fichiers n'existent pas encore, le signaler une fois et continuer sur le profil seul (templates dans `references/repopro-stats-templates/`).

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

## Sortie (mode offre)
- **Pertinent** : la réponse Malt + l'email de renfort (objet + corps), prêts à coller. Plus une ligne sur le niveau de fit retenu (et ce que les stats y ont changé).
- **Hors cible** : la réponse + le dossier Malt (analyse mots-clés + diagnostic ranking + reco profil).
- **Toujours** : une ligne ajoutée au journal win-loss. Voix de Romain, aéré, zéro tiret cadratin, zéro superlatif creux, aucun chiffre inventé.

---

# MODE PROFIL (audit & optimisation du compte Malt)

## Quand le déclencher
- Sur demande ("audite mon profil Malt", "optimise mes mots-clés").
- **Disette** : Romain signale qu'il n'a pas eu de propal depuis X (1 semaine, 1 mois), ou les dates dans `win-loss.md` / `malt-plateforme.md` montrent un trou anormal vs son rythme habituel. Le problème n'est alors pas la réponse aux offres : c'est le profil qui ne génère plus assez d'opportunités, ou les mauvaises.

## Étape P1 : charger la matière
Lire `RepoPro/stats/malt-profil-actuel.md` (titre, mots-clés, description, TJM, journal des changements), `malt-plateforme.md` (volume et pertinence des offres dans le temps), `win-loss.md` + les dossiers Malt accumulés (ce qui matche / ce qui est du bruit), et le profil pro (ICP cible, positionnement). Si `malt-profil-actuel.md` n'existe pas, demander à Romain de coller le contenu de son compte Malt (titre, tags, description, TJM).

## Étape P2 : diagnostiquer
Croiser trois choses : ce que **dit** le profil (mots-clés, titre, description), ce que Romain **veut** (ICP cible), ce qu'il **reçoit** vraiment (offres pertinentes vs bruit, volume).

Poser le bon diagnostic parmi :
- **Profil trop large** : beaucoup d'offres mais hors cible (cf. note "profil lu trop large"). Des mots-clés génériques le font remonter sur tout. → resserrer.
- **Profil trop étroit / invisible** : peu ou pas d'offres du tout (disette). Mots-clés trop de niche, titre flou, ou description qui ne ressort pas sur les recherches clients. → élargir les bons signaux, pas le bruit.
- **Profil bien ciblé mais ne convertit pas** : bonnes offres reçues mais peu de réponses sélectionnées → le souci est la description / la preuve / le TJM, pas le ciblage.
- **TJM filtrant** : le TJM affiché écarte des clients avant même le contact. À regarder vs l'historique missions.
- **Effet saisonnier / marché** : avant de tout changer, vérifier que la disette n'est pas juste une période creuse (comparer au même moment les mois précédents si la donnée existe).

Nommer LE diagnostic principal, preuve à l'appui (volume, ratio pertinent/bruit, mots-clés en cause). Ne pas tout changer en même temps.

## Étape P3 : plan de modif concret
Sortir un plan priorisé, prêt à appliquer sur Malt :
- **Mots-clés / tags** : lesquels retirer (le bruit identifié dans les dossiers), lesquels ajouter (ceux de l'ICP cible, alignés sur le vocabulaire des offres qu'on VEUT). Liste exacte.
- **Titre / headline** : proposition réécrite, alignée ICP (réécrite via `write-like-me`, zéro superlatif).
- **Description** : réécriture ou ajustements ciblés (via `write-like-me`), orientée preuve + ICP.
- **TJM** : garder / ajuster, avec la raison (vs historique missions).
- **Une seule grande modif à la fois** quand c'est possible, pour pouvoir mesurer l'effet.

## Étape P4 : tracer pour mesurer
Inscrire la modif dans le journal de `malt-profil-actuel.md` (date, ce qui change, pourquoi, effet attendu). À la prochaine session profil, regarder l'effet observé (volume / pertinence après la modif) avant de proposer autre chose. C'est ce qui évite de tourner en rond et fait apprendre l'optimisation.

## Sortie (mode profil)
- Le diagnostic principal en clair, preuve à l'appui.
- Le plan de modif priorisé (mots-clés exacts, titre, description, TJM).
- La ligne ajoutée au journal des changements de profil.
- Voix de Romain sur tout texte de profil produit.

# Mode transcripts : ingestion et extraction

## 1. Sources acceptées
Tout ramener au même schéma avant d'analyser.

**A. Outil d'enregistrement d'appels connecté (Claap, Modjo, Gong, Chorus, Fireflies)**
1. Lister les espaces ou les enregistrements récents.
2. Récupérer les transcripts des appels utiles (filtre par période ou par étiquette si fourni).
3. Extraire : noms et rôles des intervenants, texte complet, date, durée, deal ou entreprise liés.

**B. Export CSV** (noms de colonnes souples, à normaliser)
`call_id` ou `id`, `date`, `duration`, `prospect_name`, `prospect_title` ou `job_title`, `company`, `transcript` (texte complet) ou `summary`, `rep_name` ou `sales_rep`, `deal_stage` (optionnel), `outcome` (optionnel : rendez-vous pris, absent, gagné, perdu).
- La colonne transcript contient une URL : aller chercher le contenu.
- Seulement un résumé : l'analyser et le marquer en confiance plus basse.

**C. Texte collé**
Découper les tours de parole avec les motifs courants : `[Nom] :`, `Rep:`, `Prospect:`, horodatages `[00:00]`.

**D. Document (PDF, DOCX)**
Extraire le texte, puis traiter comme du texte collé.

## 2. Préparer chaque transcript
- **Qui parle :** le commercial se repère à sa présentation ("je suis de…"), aux questions posées, aux explications produit, aux mentions de prix.
- **Profil du prospect :** nom, titre, entreprise, taille (si citée), secteur, niveau (direction générale, VP, directeur, manager, contributeur individuel), fonction (ventes, RevOps, marketing, produit, finance, IT, fondateur).
- **Regroupement en personas**, par fonction + niveau. Exemples :
  - "Direction commerciale" : VP Sales, Head of Sales, directeur commercial, CRO.
  - "Manager commercial" : Sales Manager, Team Lead, SDR Manager.
  - "RevOps / GTM Ops" : RevOps Manager, GTM Engineer, Sales Ops.
  - "Fondateur / dirigeant" : CEO, cofondateur, DG.
  - "Contributeur individuel" : AE, SDR, BDR, Account Manager.

## 3. Les 10 dimensions à extraire, par persona
Pour chaque dimension : des verbatims exacts.

| # | Dimension | Ce qu'on cherche |
|---|---|---|
| 1 | Objectifs | Objectifs business et personnels, indicateurs sur lesquels il est jugé, horizon (trimestre, année, long terme). Citations où il décrit le succès. |
| 2 | Douleurs | Ce qui est cassé aujourd'hui, l'impact (revenu, temps, moral, départs), les bricolages en place et pourquoi ils ne suffisent pas, les mots chargés d'émotion. Étiqueter : **fonctionnelle** (process, outil), **émotionnelle** (ressenti), **sociale** (regard des autres). |
| 3 | Déclencheurs | Pourquoi maintenant : événement récent (recrutement, deal perdu, pression du board, victoire d'un concurrent), calendrier (fin de trimestre, nouvel exercice), alternative qui a échoué, signal entrant (post lu, démo vue, recommandation). |
| 4 | Objections | Par type : prix / budget, timing, confiance / preuve, adhésion interne, technique / intégration, concurrence, complexité / risque. Pour chacune : verbatim, réponse du commercial, note **Efficace / Neutre / Ratée**. |
| 5 | Demandes produit | Demandes explicites ("est-ce que vous avez…") et manques implicites (douleur sans réponse, bricolage). Étiqueter **Demandée** ou **Implicite**. Compter le nombre d'appels. |
| 6 | Concurrence | Concurrents cités, débat "faire soi-même ou acheter", outils déjà essayés et pourquoi ils ont échoué, ce qu'ils aiment dans la solution actuelle (coût de changement). |
| 7 | Processus d'achat | Qui d'autre décide (champion, décideur budgétaire, bloqueur, IT), étapes (juridique, sécurité, achats), délai, budget et cycle budgétaire, critères d'évaluation. |
| 8 | Vocabulaire | Jargon du persona, ses mots pour décrire la douleur (jamais les mots du produit), ses images, le nom qu'il donne au problème. Alimente directement les messages. |
| 9 | Signaux d'achat | Questions sur la mise en place et le calendrier, mention du budget, demande d'un dossier de rentabilité, champion interne cité, mots d'urgence. |
| 10 | Signaux d'alerte | Douleur vague ("on regarde juste"), pas d'urgence, décideur absent, budget non alloué, cas d'usage à côté. |

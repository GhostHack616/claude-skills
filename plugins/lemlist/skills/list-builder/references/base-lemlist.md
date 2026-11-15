# Base Lemlist — fiche outils à lire AVANT de toucher une base (Lemlist, Pipedrive, sources officielles)

Écrite après un chantier qui a coûté 4 jours au lieu de quelques heures. Chaque ligne = une erreur qu'on ne refait pas.

## 1. Lemlist — champs natifs : les utiliser AVANT de créer un champ custom
`GET /api/fields` liste les champs natifs (`source: default`) et custom. **Ne créer un champ custom que si aucun natif ne fait l'affaire.**

| Besoin | Champ natif |
|---|---|
| Ville du contact | contact `location` |
| Ville / siège de l'entreprise | société `location`, `headquarters` |
| Taille | société `size`, `employeeCount` |
| Secteur | société `industry`, `subIndustry` |
| Site web | société `domain` |
| Poste | contact `jobTitle` |
| Téléphone | contact `phone` |
| Désinscrit / ne pas contacter | contact `unsubEmail`, `unsubPhone`, `unsubLinkedin`, `doNotContact` (booléens) |
| LinkedIn | contact `linkedinUrl` (URL publique, jamais `ACwAA…`) |

Custom légitimes (pas d'équivalent natif) : score maison, déjà client, contact principal, département, dernier contact multi-outils, etc.

## 2. Lemlist — signaux à lire sur chaque contact existant
- **Rebond** : `leadStatus` = « Email bounced » (rebond réel en campagne) ; `emailDeliverability` = `undeliverable` (vérif Lemlist). Les deux, séparément.
- **Désinscription** : DEUX endroits — le drapeau du contact (`unsubscribed` / `doNotContact` / `unsubEmail`, visibles **seulement par l'API** `GET /contacts?idsOrEmails=`) ET le statut de campagne (`leadStatus` « Unsubscribed… » / « Désinscrit… », visible dans l'export). Lire les deux.
- **Déjà en campagne** : `isActiveInCampaigns` (`Yes`/`No`), campagnes en cours ou en pause.
- Avant de **réimporter** un contact connu : lire ces statuts et comprendre pourquoi il avait été écarté.

## 3. Lemlist — API : comportements vérifiés
- **Export** : `GET /contacts/export` (sans `listId`) = **toute la base** en CSV avec champs custom ; avec `listId` = une liste. C'est la seule source fiable pour compter et contrôler.
- `GET /contacts?listId=` : max 500 par page et **pagination instable** (pages qui se recouvrent) → ne jamais s'en servir pour compter ; pour les ids, croiser export + `idsOrEmails` (100 par appel) + leads de campagne (`GET /campaigns/{id}/leads`).
- Upsert `POST /contacts?updateStrategy=overwrite|fillEmptyOnly` ; clés : `email`, `linkedinUrl`, `contactId` (contacts sans email ni LinkedIn → `contactId`). `""` efface un champ… **sauf `linkedinUrl`** (ne se vide que dans l'interface).
- **Nom affiché (`fullName`) périmé** : vider `firstName`/`lastName` ne vide PAS le nom affiché, et l'API refuse `fullName`. Astuce : écrire un nom propre (ex. « Mairie de » + « Cannes ») puis vider prénom/nom → le nom affiché reste propre, les variables restent vides. Ne jamais importer de faux noms au départ.
- Sociétés : upsert par domaine (`POST /companies?updateStrategy=`), `fillEmptyOnly` ne renomme jamais ; société sans domaine → `domain: "gmail.com"` ; fusion `POST /companies/merge` irréversible.
- Listes : création `POST /contacts/lists {name}` ; ajout/retrait `POST /contacts/lists/{id}/entities[?action=remove] {contactIds}` (1000 max) ; **suppression de liste : interface seulement**.
- Variables utilisées par une campagne : lire `GET /campaigns/{id}/sequences` avant de modifier noms/sociétés de ses leads.
- Limite : ~20 requêtes / 2 s.

## 4. Pipedrive — pièges
- Noms de personnes souvent mélangés (« Prénom Nom, poste, Agence X ») → séparer à l'import, laisser vide si ambigu.
- Personnes **rattachées à la mauvaise organisation** → ne jamais déduire « client » du domaine email d'une personne ; client = organisation avec **deal gagné**, retrouvée par email exact, site de l'org, domaine partagé par l'org, ou nom identique.
- Segment / site web des orgs = champs custom (lire les clés via l'API).

## 5. Sources officielles gratuites (pas besoin d'Apify)
- Communes + population : `geo.api.gouv.fr/communes?fields=nom,code,population,codeDepartement` (un seul appel = référence TAM).
- Coordonnées des administrations : annuaire service-public, **téléchargement complet** (data.gouv.fr, `all_latest.tar.bz2`) plutôt que l'API une par une (lente, instable).
- Entreprises (ville, taille, NAF) : `recherche-entreprises.api.gouv.fr` (7 req/s). **Ne garder un résultat que si nom ET ville correspondent avec un seul candidat**, sinon vide. Taille « NN » = sans salarié.
- Intercommunalités : BANATIC (données parfois anciennes).

## 6. Vérification d'emails
- Vérificateur Apify (`bounceverify`, ~0,0008 $/email) correct, mais classe à tort « domaine inexistant » les domaines avec MX sans site web → recontrôler au DNS (`dns.google/resolve?type=MX`).
- Orange / Wanadoo et serveurs « catch-all » : non testables → `incertain` / `risqué`, envoyer par petits lots.
- Plafonner chaque run Apify (`maxTotalChargeUsd`) au-dessus du coût d'un événement, sinon il est facturé sans résultat.

## 7. Méthode d'une vertical (cible : quelques heures, pas des jours)
0. **Inventaire outils** (cette fiche + `GET /fields` + listes/campagnes/statuts existants) → plan d'une page : sources, champs natifs utilisés, champs custom nécessaires, règles. **Validé une fois avant toute écriture.**
1. Rassembler : export complet Lemlist + Pipedrive, une seule liste par vertical.
2. Nettoyer : exclusions, rebonds, désinscriptions (deux signaux), déjà client (deals gagnés), doublons.
3. Remplir : champs natifs d'abord, sources officielles avec règle de correspondance stricte.
4. Score : seulement sur des champs remplis à > 70 % ; simuler la répartition avant d'appliquer.
5. Contrôle automatique sur export frais (étape 5 du skill) → 0 écart, sortie brute.
6. Doc générée depuis le contrôle, une seule relecture par un second agent.

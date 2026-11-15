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
| Prénom, nom, poste d'une personne (y compris un décideur trouvé à part) | contact `firstName`, `lastName`, `jobTitle` |
| Téléphone | contact `phone` |
| Désinscrit | désinscription native : `POST /v2/unsubscribes/contacts/{contactId}` (pose le drapeau `unsubscribed`). **Jamais une valeur dans un champ custom.** Les drapeaux (`unsubscribed`, `doNotContact`…) ne s'écrivent pas par l'upsert |
| LinkedIn | contact `linkedinUrl` (URL publique, jamais `ACwAA…`) |

Custom légitimes (pas d'équivalent natif) : score maison, déjà client, contact principal, département, dernier contact multi-outils, résultat d'un vérificateur d'emails externe, etc.

**Variables de campagne** : tout champ rempli devient une variable (`{{location}}`, `{{companyName}}`, `{{firstName}}`…). Ranger = décider, pour chaque variable qu'on écrira dans un message, quel champ la porte et vérifier qu'il est propre (pas de « Ville, Région, Pays », pas de slogan dans le nom de société, pas de prénom d'une autre personne sur une adresse générique). Une variable vide dans un message → toujours un repli.

## 2. Lemlist — signaux à lire sur chaque contact existant
- **Rebond** : `leadStatus` = « Email bounced » (rebond réel en campagne) ; `emailDeliverability` = `undeliverable` (vérif Lemlist). Les deux, séparément.
- **Désinscription** : DEUX endroits — le drapeau du contact (`unsubscribed` / `doNotContact` / `unsubEmail`, visibles **seulement par l'API** `GET /contacts?idsOrEmails=`) ET le statut de campagne (`leadStatus` « Unsubscribed… » / « Désinscrit… », visible dans l'export). Lire les deux.
- **Déjà en campagne** : `isActiveInCampaigns` (`Yes`/`No`), campagnes en cours ou en pause.
- Avant de **réimporter** un contact connu : lire ces statuts et comprendre pourquoi il avait été écarté.

## 3. Lemlist — API : comportements vérifiés
- **Export** : `GET /contacts/export` (sans `listId`) = **toute la base** en CSV avec champs custom ; avec `listId` = une liste. C'est la seule source fiable pour compter et contrôler.
- `GET /contacts?listId=` : max 500 par page et **pagination instable** (pages qui se recouvrent) → ne jamais s'en servir pour compter ; pour les ids, croiser export + `idsOrEmails` (100 par appel) + leads de campagne (`GET /campaigns/{id}/leads`).
- Upsert `POST /contacts?updateStrategy=overwrite|fillEmptyOnly|overwriteIgnoreEmpty` (**défaut = `overwriteIgnoreEmpty`** : une chaîne vide n'efface rien) ; clés : `email`, `linkedinUrl`, `contactId` (mise à jour seule, ne crée jamais ; contacts sans email ni LinkedIn → `contactId`). Avec `overwrite`, `""` efface un champ et une clé absente ne touche rien… **sauf `linkedinUrl`** (ne se vide que dans l'interface).
- Non modifiables par l'upsert : `fullName`, `emailDeliverability`, statut du contact ou de la société, `doNotContact`. Écrire `location` remplit tout seul `timezone` (effet de bord normal, à prévoir dans le contrôle).
- Un champ custom de type date ressort en date-heure dans l'export (`2026-09-08` → `2026-09-08T00:00:00.000Z`) : comparer les 10 premiers caractères.
- **Supprimer un champ custom** : `DELETE /fields/{entity}/{name}` (ex. `fields/contact/monChamp`) → ses valeurs disparaissent de **toutes** les fiches du compte, sans retour arrière. (Doc Lemlist : refusé en 409 si le champ sert à choisir l'expéditeur d'une campagne.)
- **Rattraper un champ custom qui double un natif** (ordre obligatoire) : 1) sauvegarde complète du compte hors de l'outil ; 2) recopie custom → natif ; 3) égalité vérifiée ligne par ligne sur un export frais ; 4) vérifier qu'aucune séquence de campagne ni automatisation n'utilise le champ ; 5) suppression ; 6) nouvel export comparé colonne par colonne à celui d'avant (seules les colonnes supprimées doivent différer).
- **Nom affiché (`fullName`) périmé** : vider `firstName`/`lastName` ne vide PAS le nom affiché, et l'API refuse `fullName`. Astuce : écrire un nom propre (ex. « Mairie de » + « Cannes ») puis vider prénom/nom → le nom affiché reste propre, les variables restent vides. Ne jamais importer de faux noms au départ.
- Sociétés : upsert par domaine (`POST /companies?updateStrategy=`), `fillEmptyOnly` ne renomme jamais ; société sans domaine → `domain: "gmail.com"` ; fusion `POST /companies/merge` irréversible.
- **Renommer une société** : `POST /companies?updateStrategy=overwrite` avec `{companyId, name}` ; l'id revient dans `data._id` (pas à la racine de la réponse). Lire la fiche avant (`GET /companies?idsOrDomains=<id>`) et n'écrire que si le nom actuel est celui attendu. Erreur `COMPANY_IDENTIFIER_CONFLICT` (« An identifier (domain, linkedinUrl or salesnavUrl) already belongs to another company ») = la fiche partage un identifiant avec une autre fiche société : plusieurs fiches sur le même domaine (visible avant d'écrire avec `GET /companies?idsOrDomains=<domaine>`), ou nom visé déjà porté par une fiche sans domaine. Ce sont des sociétés en double → ne pas réessayer, sauter et lister ; la correction est une fusion, irréversible, à faire valider à part. Deux sociétés de domaines différents peuvent porter le même nom. Le `companyId` d'un contact se lit dans `GET /contacts?listId=` ; il n'est ni dans l'export, ni dans `idsOrEmails`, ni dans `GET /contacts/{id}`.
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
0. **Inventaire outils** (cette fiche + `GET /fields` + listes/campagnes/statuts existants) → plan d'une page : sources, **tableau « besoin → champ natif »** d'abord, puis seulement les champs custom sans équivalent natif, règles. **Validé une fois avant toute écriture.**
1. Rassembler : export complet Lemlist + Pipedrive, une seule liste par vertical.
2. Nettoyer : exclusions, rebonds, désinscriptions (deux signaux), déjà client (deals gagnés), doublons.
3. Remplir : champs natifs d'abord, sources officielles avec règle de correspondance stricte.
4. Score : seulement sur des champs remplis à > 70 % ; simuler la répartition avant d'appliquer.
5. Contrôle automatique sur export frais (étape 5 du skill `tam`) → 0 écart, sortie brute. Toute écriture en masse : 3 fiches test relues par l'API d'abord, reprise possible (journal des fiches faites), puis comparaison avant / après de **tout le compte** (rien de créé, rien de perdu, seules les colonnes prévues changent).
6. Doc générée depuis le contrôle, une seule relecture par un second agent.

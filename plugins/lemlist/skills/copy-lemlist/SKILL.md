---
name: copy-lemlist
description: >
  Écrit, remplit et vérifie le copywriting complet d'une campagne Lemlist multicanal
  (mails A/B, messages LinkedIn, notes d'invitation, tâches manuelles) directement par
  l'API : lit les leads d'abord, recherche les pain points et le vocabulaire de la cible,
  grille Romain sur les angles A/B, puis écrit avec un maximum de variables à repli et
  un copy qui protège la délivrabilité. Utiliser dès que Romain dit « remplis le
  workflow », « bosse sur le copywriting de la campagne », « écris les mails de la
  séquence », « la B est vide », ou quand une campagne Lemlist a des steps vides.
  Cible par défaut : dirigeants de TPE/PME françaises. Ne touche jamais aux leads.
---

# Copy Lemlist : de la liste aux mails, par l'API

Méthode seulement. Aucune donnée client ici : les claims, signatures, objets retenus
et benchmarks d'un client vivent dans son repo (Qileo : blocs 06, 07, 11 et
`brainstorms/2026-09-02-*.md`). Combine les skills de ce plugin
(copywriting-first-touch, copywriting-follow-up, linkedin-sequence, cta-designer,
copywriting-refiner) et write-like-me (plugin productivity). En cas de conflit, ce
fichier gagne. Bibliothèques jointes, à lire avant d'écrire : `references/hooks.md`,
`references/cta.md`, `references/objets.md`.

## Étape 1 : savoir à qui on écrit (obligatoire, avant tout)
Le copy se règle sur les leads, jamais sur une idée qu'on se fait de la cible.

**Cas A, la campagne a des leads.** Les lire par l'API
(`GET /campaigns/{cid}/export/leads?state=all&format=json`, lecture seule) et
produire en un écran : titres regroupés et part de décideurs ; secteurs en 10 à 14
familles avec leur part ; taille d'entreprise ; part d'emails, de prénoms, d'URL
LinkedIn ; hors cible probables (stagiaires, élus, enseignants, analystes, entités non
concernées par le sujet) ; conclusion en une ligne.
Règle : aucun segment au-dessus de 30 % → **généraliste**, vocabulaire vrai pour 100 %
des destinataires. Un segment dominant → le nommer, proposer une accroche dédiée.
Proposer le tri des hors cible, **ne jamais le faire soi-même**. Ranger l'analyse dans
le repo client (`brainstorms/`) et une ligne datée dans son journal.

**Cas B, pas de leads.** Ne rien écrire. Poser en un seul message : qui reçoit (métier,
statut, taille) ; source de la base et colonnes disponibles, part d'emails ; un ou
plusieurs secteurs ; le problème adressé en une phrase et la preuve citable ; émetteur,
signature, tutoiement ou vouvoiement ; CTA et destination (URL ou placeholder) ; ton
accepté. Reformuler la cible en deux lignes, faire valider, puis passer à l'étape 2.

## Étape 2 : recherche cible et angles (automatique, avant d'écrire)
Une fois la cible connue, avant la moindre phrase :
1. **Pain points** : WebSearch (FR puis EN) sur la cible et le sujet : forums, études
   récentes avec chiffres, presse pro, posts LinkedIn de la cible elle-même. Sortir
   5 à 8 douleurs formulées avec les mots de la cible, chacune sourcée.
2. **Vocabulaire** : 20 à 30 mots et expressions que la cible emploie (et ceux qu'elle
   n'emploie jamais). Les mots du client ou du produit ne comptent pas.
3. **Faits et claims** : ce qui est vrai, daté, sourcé (loi, calendrier, chiffres
   officiels). Séparer « sûr » / « à reformuler » / « à éviter ». Sur un sujet régulé,
   sources officielles uniquement.
4. **Solution du client** : pour chaque douleur, en une phrase, comment l'offre y
   répond, et la preuve qu'on a le droit de citer (repo client). Si aucune preuve
   validée, on n'en cite pas.
5. **Fiche d'angles** : 4 à 6 angles possibles (obligation / cadre, conséquence
   concrète, calendrier, chiffre, coût du statu quo, pair à pair…), chacun avec son
   hook, son objet, son CTA et le mot-clé qui le porte.
6. **Grill Romain sur les angles** (méthode grill-me, une question à la fois, réponse
   recommandée) : quel angle en A, lequel en B, tutoiement ou vouvoiement, niveau de
   ton, preuve autorisée, lien au mail 1 ou 2. On n'écrit qu'après ses réponses.
Livrable de l'étape : la fiche d'angles rangée dans le repo client, validée.

## 0. Périmètre (non négociable)
- « Workflow » = la séquence (steps, conditions, contenus). **Jamais les leads** :
  ni variables, ni tags, ni import, ni suppression, sans demande explicite.
- Écriture par l'API avec la clé de l'env de session (`LEMLIST_API_KEY`), jamais le
  connecteur MCP. Recettes et pièges : repo client (Qileo : bloc 06).
- Une route qui semble manquer : lire `https://developer.lemlist.com/llms.txt` avant
  de dire « impossible ».

## 1. Lire l'arbre de la campagne
1. `GET /campaigns/{cid}/sequences`, reconstituer le chemin de chaque step depuis les
   `conditions`. Un multicanal = ~40 sous-séquences pour ~20 contenus.
2. Lister TOUS les contenus : A, B (`GET .../steps/{stepId}/ab-test`), notes
   d'invitation, messages LinkedIn, titres et consignes des tâches manuelles. Une
   branche entière peut être vide sans se voir.
3. Déduire le rôle de chaque contenu (E1, relances, break-up, E1 après LinkedIn, LI1,
   LI2, invite, tâches) et vérifier les sorties (`sendToAnotherCampaign`).

## 2. Structure de séquence recommandée (benchmark 2026)
- **Pas de condition « a ouvert »** (Apple Mail précharge le pixel, scanners
  d'entreprise). Branches automatiques fiables : « a répondu » (stop) et, à la rigueur,
  « a cliqué » vers une campagne chaude. Le reste se lit sur la LP par UTM. Si Romain
  garde un arbre ouvert / non ouvert, l'écrire en le disant.
- **4 mails maximum** : J0, J+3, J+7, J+14 (break-up). Au-delà, plaintes ×3. Les 3
  premiers dans le même fil, le break-up en nouveau fil.
- **Mail 1 sans lien** de préférence ; lien au mail 2. Si lien au mail 1 : tracking
  Lemlist coupé, lien nu. Décision Romain.
- **LinkedIn** : invitation sans note ; message 1 sous 24 h, 150 à 250 caractères, une
  question, aucun lien, une phrase d'opposition RGPD ; message 2 à J+3 avec le lien ;
  retrait des invitations en attente à J+10 ; 20 invitations/jour/compte.
- **Volume mail** : 10/boîte/jour la semaine 1, puis 20, 30, 40. Bounce > 3 % = pause.

## 3. Variables : le maximum, avec repli, jamais bloquant
- Utiliser toutes les variables utiles présentes dans la base (prénom, entreprise,
  secteur, ville, poste, variables custom), au moins une par mail au-delà du prénom.
  Une base sans variable ne bloque jamais : le mail doit rester vrai et complet sans elle.
- Syntaxe Lemlist avec repli, systématique : `{{firstName|Bonjour}}`,
  `{{companyName|votre entreprise}}`, `{{city|votre ville}}`. Le repli est un mot qui
  tient la phrase, jamais vide, jamais « there ».
- Salutation en Liquid dans les mails (documenté par Lemlist) :
  `{% if firstName %}Bonjour {{firstName}},{% else %}Bonjour,{% endif %}`.
  Sur LinkedIn et dans les tâches, uniquement la syntaxe pipe.
- Variable dans l'objet : entreprise ou contexte plutôt que prénom (données
  contradictoires sur le prénom), toujours avec repli.
- Spin syntax Lemlist (`{% spin %}{% variation %}…{% endspin %}`) sur 1 ou 2 phrases
  par mail pour réduire l'empreinte template.
- Contrôle avant envoi : aperçu Lemlist sur un lead sans prénom et sur un lead sans
  entreprise. Aucune accolade visible, aucune phrase bancale.

## 4. Règles de copy (audience dirigeants)
**Interdits** : tiret cadratin ; pattern « ce n'est pas X, c'est Y » ; mail d'une
ligne ; break-up « je ferme le dossier » ; ouvrir par une question ou par « je » ;
rendez-vous au 1er contact ; mots spam FR dans objet et 1er paragraphe (gratuit, sans
frais, offre, promo, urgent, taux, carte bancaire, investissement, augmentez, dès
maintenant) ; emoji, bouton, logo, image, disclaimer, pièce jointe, raccourcisseur,
faux « Re: » ; pitch produit avant le mail 3 ; flatterie non vérifiable ; mot valable
pour un seul secteur dans un copy généraliste ; variable sans repli.

**Chaque mail (50 à 100 mots, relances comprises)** : salutation à repli ; première
phrase sur le monde du lecteur, en affirmation, ton posé ; le fond en 2 à 3 phrases
(critère exact, conséquence concrète, geste à faire), un seul angle, jamais deux fois
le même ; un seul CTA en dernière ligne, ancre formulée comme un résultat ; signature
texte 3 lignes (Prénom Nom / fonction, entreprise). Niveau de lecture simple.

**Rôles** : E1 pose la tension ; E2 (J+3, même fil) lève LE doute avec le critère
précis ; E3 (J+7, même fil) conséquence concrète, cas ou chiffre officiel ; E4 (J+14,
nouveau fil) break-up honnête, sortie binaire, sans reproche ; E1 après LinkedIn =
une phrase de contexte puis E1. A/B = deux angles, pas deux formulations.

**Objets** : 2 à 5 mots, moins de 40 caractères, majuscule initiale, jamais de
« Re: » artificiel, zéro mot spam. Mécanisme le mieux mesuré : la référence interne
ou concrète (le mail ressemble à celui d'un fournisseur ou du comptable). Un objet
curieux tient sa promesse dans le corps. Putaclic modéré accepté (« Votre facture
n'est pas passée… »), jamais mensonger. Effort : pas ouvert → l'objet fait le travail
(nouveau fil) ; ouvert sans clic → le corps fait le travail. Détail et exemples :
`references/objets.md`.

**Hooks et CTA** : `references/hooks.md` et `references/cta.md` (mécanismes,
exemples FR, anti-patterns, checklists).

**LinkedIn** : invitation sans note (si note imposée : ≤ 200 caractères, sans lien) ;
message 1 sans lien, une question, phrase d'opposition ; message 2 avec le lien ;
tâche manuelle = titre à repli + consigne (vocal enregistré par l'émetteur, appel,
message perso), jamais de vocal IA sur des dirigeants.

## 5. Délivrabilité dans le copy
- Texte brut ou HTML minimal identique à un mail écrit à la main. Un seul lien, texte,
  vers le domaine de la LP, UTM courts, jamais de raccourcisseur ni de bouton.
- Pas de mot spam en accumulation, pas de majuscules d'emphase, un point
  d'exclamation maximum, pas d'image, signature sans logo ni disclaimer.
- Mention d'opposition en une phrase dans la séquence (B2B France : opt-out, source
  des données, moyen simple de refuser). Lien de désinscription Lemlist en pied si
  Romain le demande.
- Placeholder de lien tant que la LP n'existe pas : `#LIEN_<CAMP>` + UTM
  `?utm_source=lemlist&utm_medium=email|linkedin&utm_campaign=<camp>&utm_content=<role>-<a|b>`.
  Un seul remplacement le jour J. Mesure au clic et à la conversion LP, pas à l'ouverture.

## 6. Écrire par l'API
- A : `PATCH /sequences/{seqId}/steps/{stepId}` avec `type` obligatoire (`email` :
  `subject` + `message` ; `linkedinSend`, `linkedinInvite` : `message` ; `manual` :
  `title` + `message`). Un champ vide envoyé est ignoré (impossible de vider un objet ou
  une note par l'API : le dire, c'est l'interface).
- B : `PATCH .../steps/{stepId}/ab-test` avec `subject` + `message` (ne touche jamais
  la A ; marche aussi sur `linkedinSend`).
- 20 requêtes / 2 s : pause 0,3 s entre écritures. Script type : dictionnaire
  rôle → (A, B), mapping des steps par objet courant, écriture, relecture.

## 7. Avant tout déploiement : deux drafts à Romain
Ne jamais écrire les 30 à 40 versions d'un coup. Montrer d'abord le mail 1 en A et en
B (objet, corps, CTA, signature, variables rendues sur un lead réel), obtenir le « go »,
puis dérouler la séquence complète, puis la relecture §8.

## 8. Vérification obligatoire avant de rendre la main
Relire toute la campagne par l'API (A et B) : aucun contenu vide ; aucun tiret ni
« pas X, c'est Y » ; repli sur chaque variable ; placeholder ou URL dans chaque mail
et message LinkedIn 2+, aucun lien staging ; aucun lien dans le message LinkedIn 1 ;
50 à 100 mots par mail ; signature complète ; objets en casse de phrase, sans « re: »,
sans mot spam ; claims dans la liste sûre ; sorties « clic » vers la bonne campagne ;
vocabulaire vrai pour tous les destinataires. Puis demander un envoi test.

## 9. Capture
Décisions, rejets, objets retenus → journal daté du repo client, commit + push sur
main le jour même. Une règle de goût rejetée par Romain remonte dans le CLAUDE.md du
client et, si elle est générale, ici.

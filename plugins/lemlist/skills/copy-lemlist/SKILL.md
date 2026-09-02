---
name: copy-lemlist
description: >
  Écrit, remplit et vérifie le copywriting complet d'une campagne Lemlist multicanal
  (mails A/B, messages LinkedIn, notes d'invitation, tâches manuelles) directement par
  l'API, avec repli prénom, lien CTA à accroche et UTM par step, en s'appuyant sur le
  benchmark outbound 2026 (repo client Qileo, `brainstorms/2026-09-02-benchmark-*.md`). Utiliser dès que Romain dit « remplis le workflow »,
  « bosse sur le copywriting de la campagne », « écris les mails de la séquence »,
  « la B est vide », ou quand une campagne Lemlist a des steps vides.
  Cible par défaut : dirigeants de TPE/PME françaises. Ne touche jamais aux leads.
---

# Copy Lemlist : remplir une campagne par l'API, au niveau dirigeant

Né de la campagne FE de Qileo (sept. 2026). Combine les skills génériques de ce plugin
(copywriting-first-touch, copywriting-follow-up, linkedin-sequence, cta-designer,
copywriting-refiner) et write-like-me (plugin productivity), le benchmark sourcé du
02/09/2026 (repo Qileo, `brainstorms/2026-09-02-benchmark-*.md`, 4 parties) et les
rejets de Romain. En cas de conflit, ce fichier gagne. Lire les 4 benchmarks avant toute
réécriture lourde. Les captures (bloc 11, CLAUDE.md) désignent le repo du client courant.

## Étape 1, avant tout : savoir à qui on écrit
Le copy se règle sur les leads, jamais sur une idée qu'on se fait de la cible.

**Cas A : la campagne a des leads.** Les lire par l'API (`GET /campaigns/{cid}/export/leads?state=all&format=json`, lecture seule) et produire en un écran :
- titres regroupés (dirigeants vs salariés vs indépendants vs hors cible), part de dirigeants ;
- secteurs regroupés en 10 à 14 familles, avec la part de chacun ;
- taille d'entreprise ; part d'emails, de prénoms, d'URL LinkedIn ;
- hors cible probables (stagiaires, élus, enseignants, analystes, associations non assujetties…) ;
- conclusion en une ligne : base homogène (copy ciblé) ou base mixte (copy généraliste).
Règle de décision : aucun segment au-dessus de 30 % → **généraliste**, vocabulaire commun
à tous (« fournisseur », « loyer, logiciels, télécom, expert-comptable »). Un segment
dominant → le nommer et proposer une accroche dédiée. Proposer le tri des hors cible,
**ne jamais le faire soi-même** (voir §0). Ranger l'analyse dans `brainstorms/` et une
ligne en bloc 11.

**Cas B : pas de leads (campagne vide, ou base pas encore importée).** Ne rien écrire.
Poser en un seul message les questions qui remplacent la lecture de la liste :
1. Qui reçoit : métier, statut (dirigeant, salarié, indépendant), taille d'entreprise ?
2. D'où vient la base (Sales Navigator, scraping, CRM, achat) et quelles colonnes existent
   (prénom, entreprise, secteur, email, LinkedIn) ? Part d'emails ?
3. Un ou plusieurs secteurs ? Si plusieurs, le copy reste généraliste sauf demande contraire.
4. Le problème que le message adresse, en une phrase, et la preuve qu'on a le droit de citer.
5. L'émetteur, sa signature, tutoiement ou vouvoiement.
6. Le CTA (lien, réponse, rendez-vous) et la destination (URL ou placeholder).
7. Le niveau de ton accepté (sobre, direct, putaclic modéré).
Puis reformuler la cible en deux lignes et faire valider avant d'écrire.

**Dans les deux cas** : le vocabulaire des mails doit être vrai pour 100 % des
destinataires. Un mot qui ne vaut que pour un secteur (« grossiste », « chantier »,
« patients ») est interdit dans un copy généraliste, y compris derrière du Liquid, sauf
demande explicite de Romain.

## 0. Périmètre (non négociable)
- « Workflow » = la séquence (steps, conditions, contenus). **Jamais les leads** :
  ni variables, ni tags, ni import, ni suppression, sans demande explicite.
- Écriture par l'API avec `LEMLIST_API_KEY` de l'env, jamais le connecteur MCP.
  Recettes et pièges : repo Qileo, bloc 06 (« Lemlist par API »).
- Une route qui semble manquer : lire `https://developer.lemlist.com/llms.txt` avant
  de dire « impossible ».
- Claims réglementaires (fintech, santé, juridique) : uniquement sourcés (pour la facture
  électronique : benchmark partie 4 du repo Qileo, impots.gouv, service-public, Légifrance).

## 1. Avant d'écrire : lire l'arbre
1. `GET /campaigns/{cid}/sequences`, reconstituer le chemin de chaque step depuis les
   `conditions`. Un multicanal = ~40 sous-séquences pour 20 contenus.
2. Lister TOUS les contenus : A, B (`GET .../steps/{stepId}/ab-test`), notes
   d'invitation, messages LinkedIn, titres et consignes des tâches manuelles. Une
   branche entière peut être vide sans se voir.
3. Déduire le rôle : E1, E2 (relance), E3, E4 break-up, E1-LinkedIn, LI1, LI2, invite,
   tâches.
4. Vérifier les sorties (`sendToAnotherCampaign` → bonne campagne).
5. Lire la liste des leads par l'API (export) : titres, taille, secteur, géo, part
   d'emails. Le copy se règle sur qui lit vraiment (FE : 76 % de présidents de SAS
   de 2 à 10 salariés, sans service compta, qui lisent sur mobile).
   Voir « Étape 1 » : la décision généraliste / ciblé se prend là, sur les chiffres.

## 2. Ce qu'on demande à Romain (une fois, en un message)
- Cible et angle. Émetteur et signature. Preuves autorisées. Niveau de putaclic
  acceptable. Tutoiement ou vouvoiement (peut être un axe A/B).
- Lien de destination ou placeholder (§6). Claims à faire valider par le client.

## 3. Structure de séquence recommandée (benchmark 2026)
- **Pas de condition « a ouvert »** : Apple Mail (51 % des clients) précharge le pixel,
  les scanners d'entreprise ouvrent et cliquent. Instantly et Lemlist disent de retirer
  ce déclencheur. Seule branche automatique fiable : « a répondu » (stop) et, à la
  rigueur, « a cliqué » vers une campagne chaude. Le reste se lit dans les analytics
  de la LP par UTM. Si Romain veut garder l'arbre ouvert/non ouvert, l'écrire en
  sachant que le tri est faux pour la moitié des destinataires.
- **4 mails maximum** : J0, J+3, J+7, J+14 (break-up). Au-delà, plaintes ×3.
  Les 3 premiers dans le même fil, le break-up en nouveau fil.
- **Mail 1 sans lien** de préférence (consensus opérateurs) ; le lien arrive au mail 2.
  Si lien dès le mail 1 : tracking Lemlist coupé, lien nu.
- **LinkedIn** : invitation **sans note** (plus d'acceptations, et Lemlist bloque
  l'étape au-delà de 3 notes/mois sur compte non Premium) ; message 1 sous 24 h,
  150 à 250 caractères, une question, **aucun lien**, une phrase d'opposition RGPD ;
  message 2 à J+3 (le plus productif de la séquence), le lien ici ou au message 3 ;
  retrait des invitations en attente à J+10 ; 20 invitations/jour/compte.
- **Volume mail** : 10/boîte/jour la semaine 1, puis 20, 30, 40. Bounce > 3 % sur
  une boîte = pause.

## 4. Règles de copy (audience dirigeants)
**Interdits absolus**
- Tiret cadratin ou demi-cadratin. Le pattern « ce n'est pas X, c'est Y ».
- Mail d'une ligne (« Le test tranche ça, Karl » = rejeté). Break-up « je ferme le
  dossier » (il n'y a pas de dossier, rejeté).
- Ouvrir par une question, ouvrir par « je », demander un rendez-vous au 1er contact.
- Mots spam FR dans objet et 1er paragraphe : gratuit, sans frais, offre, promo,
  urgent, taux, carte bancaire, investissement, augmentez votre CA, dès maintenant.
  « Test gratuit » devient « test en une minute ».
- Emoji, bouton HTML, logo, disclaimer, image, pièce jointe, raccourcisseur d'URL,
  faux « Re: » ou « Fwd: ».
- Jargon vendeur (le pitch coûte jusqu'à 57 % de réponses, Gong). Qileo et le produit
  n'apparaissent qu'en signature ou au mail 3+.
- Une variable qui peut sortir vide.

**Structure de chaque mail (50 à 100 mots, relances comprises)**
1. Salutation avec repli (§5).
2. Première phrase sur le monde du lecteur (secteur, fournisseur, calendrier), en
   affirmation, ton posé (« en général », « chez la plupart »).
3. Le fond, en 2 à 3 phrases courtes : le critère exact, la conséquence concrète, le
   geste à faire. Un seul angle par mail, jamais deux fois le même.
4. Un seul CTA, dernière ligne, ancre formulée comme un résultat (§6).
5. Signature texte 3 lignes : « Karl Zanclan / Fondateur, Qileo » (+ site si voulu).
Niveau de lecture simple (phrases courtes, mots courants), 2 à 3 paragraphes.

**Rôles**
- E1 : pose la tension. E2 (J+3, même fil) : lève LE doute (« suis-je concerné »),
  critère précis. E3 (J+7, même fil) : conséquence concrète / cas fournisseur / chiffre
  officiel. E4 (J+14, nouveau fil) : break-up honnête, sortie binaire, sans reproche.
- E1-LinkedIn : une phrase de contexte (« suite à notre connexion ») puis E1.
- A/B = deux angles, pas deux formulations. Tutoiement/vouvoiement peut être l'axe.

**Objets** : 2 à 5 mots, moins de 40 caractères, **majuscule initiale**, jamais de
« Re: » artificiel, zéro mot spam. Le mécanisme le mieux mesuré est la **référence
interne / concrète** (le mail ressemble à celui d'un fournisseur ou du comptable), pas
le putaclic. Un objet curieux doit tenir sa promesse dans le corps (objet vide : +30 %
d'ouvertures, -12 % de réponses). Putaclic modéré accepté par Romain : forme
« Votre facture n'est pas passée… », jamais mensonger.
Effort : **pas ouvert → l'objet fait le travail** (nouveau fil, hook) ;
**ouvert sans clic → le corps fait le travail** (même fil).
Bons : « Vos factures fournisseurs depuis le 1er septembre », « Adresse de réception »,
« Votre grossiste a déjà basculé », « Votre facture n'est pas passée… »,
« Franchise en base et réception », « Dernier mail de ma part ».
Mauvais : « réception obligatoire », « prêt à recevoir » (descriptifs), « Je ferme le
dossier », tout « re: », tout objet en minuscules.

**LinkedIn**
- Invitation sans note. Si note imposée : ≤ 200 caractères, qui je suis, pourquoi
  maintenant, pas de lien.
- Message 1 : 150 à 250 caractères, une idée, une question, pas de lien, pas de pitch,
  phrase d'opposition (« un mot et je n'insiste pas »).
- Message 2 (J+3) : angle différent, le lien avec UTM `utm_medium=linkedin`.
- Tâche manuelle : titre avec repli + consigne actionnable (vocal enregistré par
  l'émetteur, appel, message perso), jamais de vocal IA sur des dirigeants.

## 5. Prénom et variables avec repli (jamais de variable vide)
- Mails (Liquid, documenté) :
  `{% if firstName %}Bonjour {{firstName}},{% else %}Bonjour,{% endif %}`
- LinkedIn et tâches (syntaxe pipe) : `{{firstName|Bonjour}}, merci pour l'ajout.`
- Autres : `{{companyName|votre entreprise}}`. Demander l'aperçu Lemlist sur un lead
  sans prénom.
- Spin syntax Lemlist (`{% spin %}{% variation %}…{% endspin %}`) sur 1 ou 2 phrases
  clés pour réduire l'empreinte template.

## 6. Lien CTA, placeholder et UTM
- Un seul lien par mail, texte, dernière ligne, vers le domaine de la LP, jamais de
  bouton ni de raccourcisseur. Ancre = résultat à la première personne du lecteur :
  « Voir où j'en suis en une minute », « Vérifier si je suis concerné ».
  Jamais « en savoir plus » (8,6 % contre 30 % de réponses positives).
- LinkedIn : URL nue après un deux-points.
- Tant que la LP prod n'existe pas : href `#LIEN_LP_FE` avec UTM déjà posés
  `?utm_source=lemlist&utm_medium=email|linkedin&utm_campaign=<camp>&utm_content=<role>-<a|b>`.
  Un seul remplacement de chaîne le jour J.
- Mesure : clics et tests complétés côté LP par `utm_content`, pas les ouvertures.

## 7. Claims facture électronique (benchmark partie 4, à jour au 02/09/2026)
Sûrs : réception obligatoire depuis le 1er septembre 2026 pour toute entreprise
établie en France et assujettie à la TVA ; franchise en base concernée (réception 2026,
émission 2027) ; il faut désigner une plateforme agréée qui inscrit l'adresse dans
l'annuaire ; sans adresse dans l'annuaire le fournisseur ne peut pas délivrer par le
circuit électronique ; environ 150 plateformes agréées ; fin août 58 % des entreprises
avaient choisi (Bercy), moins d'une micro sur deux ; sanctions après mise en demeure
500 € puis 1 000 € par trimestre ; tolérance 2026 pour les entreprises engagées.
À éviter : « facture bloquée » ou « vous ne recevrez plus vos factures » (le guide
DGFiP autorise l'envoi par canal habituel et la TVA reste déductible) ; « Qileo est une
plateforme agréée » (absent de la liste DGFiP du 19/08/2026 : dire « via notre
plateforme agréée partenaire ») ; amendes périmées (15 €, 250 €) ; « sanctions dès le
1er septembre » ; chiffres de clients instables (3 000 vs 300 sur le site).

## 8. Écrire par l'API
- A : `PATCH /sequences/{seqId}/steps/{stepId}` avec `type` obligatoire (`email` :
  `subject` + `message` HTML minimal `<div>…<br><br>…</div>` ; `linkedinSend`,
  `linkedinInvite` : `message` texte ; `manual` : `title` + `message`).
- B : `PATCH .../steps/{stepId}/ab-test` avec `subject` + `message` (ne touche jamais
  la A ; marche aussi sur `linkedinSend`).
- 20 requêtes / 2 s : pause 0,3 s entre écritures. Scripts de référence dans le
  scratchpad de session (`rewrite-fe*.py`, `fix-subjects.py`) : dictionnaire
  rôle → (A, B), mapping des steps par objet courant, écriture, relecture.

## 9. Vérification obligatoire avant de rendre la main
Relire toute la campagne par l'API (A et B) et contrôler : aucun contenu vide ;
aucun tiret cadratin ni « pas X, c'est Y » ; repli présent sur chaque variable ;
placeholder ou URL prod dans chaque mail et message LinkedIn 2+, aucun lien staging ;
aucun lien dans le message LinkedIn 1 ; 50 à 100 mots par mail ; signature complète ;
objets en casse de phrase, sans « re: », sans mot spam ; claims dans la liste sûre ;
sorties « clic » vers la bonne campagne. Puis demander à Romain un envoi test.

## 10. Capture
Décisions et rejets → ligne datée dans le bloc 11, commit + push sur main le jour
même. Une règle de goût rejetée par Romain remonte dans CLAUDE.md.

---
name: cold-email-writer
description: >-
  Écrit les cold emails B2B : premier mail seul, séquence de 3 mails calibrée
  par séniorité (VP, manager, contributeur individuel) ou relance après
  silence, avec le choix de l'angle de campagne et du CTA à valeur (PVP). À
  utiliser quand on demande "écris-moi un cold email", "premier mail",
  "séquence de mails pour un VP Sales", "mail de relance", "il n'a pas
  répondu", "quel angle pour cette cible", "quel CTA", "comment finir mon
  mail", "write me a first email", "draft a cold email", "write me a sequence
  for a VP of Sales", "emails for SDRs", "write a follow-up", "bump email",
  "what angle should I use", "what CTA should I use", "how to end my email".
  Ne sert pas à noter ou corriger un mail déjà écrit (copy-review), ni aux
  messages LinkedIn (linkedin-outreach), ni au script d'appel
  (cold-call-script), ni à choisir canaux et cadence
  (outbound-campaign-architect), ni à pousser la campagne dans Lemlist
  (copy-lemlist).
---
# Cold email : premier mail, séquence, relance

But : obtenir une réponse. Pas présenter le produit, pas impressionner.
Écrire dans la langue du prospect. Répondre à l'utilisateur dans la sienne.

**Priorité à `copy-lemlist`.** Si la cible est francophone (dirigeants de TPE/PME) ou si la campagne part dans Lemlist, les règles de `copy-lemlist` gagnent en cas de conflit : objet (2 à 5 mots, majuscule initiale), 4 mails maximum (J0, J+3, J+7, J+14), mots spam français, variables à repli. Ses bibliothèques (`hooks.md`, `cta.md`, `objets.md`) passent avant les exemples d'ici. Cette skill apporte ce que `copy-lemlist` n'a pas : le réglage par séniorité, la logique des relances, le choix de l'angle.

## Entrée
Lire d'abord ce qui existe : `icp-*.md`, `persona-*.md`, `offre-*.md`, l'angle déjà choisi, les mails déjà envoyés, la conversation. Ne demander que ce qui manque, en un seul message, 1 à 3 questions max. Si tout est là, écrire directement.

| Bloc | Ce qu'il faut |
|---|---|
| Offre | Ce que fait l'entreprise en une phrase, le problème précis réglé pour cette cible, les preuves réelles (noms de clients, résultats vérifiés). |
| Cible | Titre exact, séniorité, secteur, taille. Manager : taille de l'équipe. Contributeur individuel : à qui il rend compte. |
| Signal | Déclencheur connu : nouveau poste, recrutement, levée, post récent, changement d'outil, actualité. |
| Variables | Données dispo par prospect. Aucune : écrire sans fausse personnalisation. |
| Relance | Mails déjà envoyés (angle, objet, CTA) et position dans la séquence. |

## Étape 1 : choisir le mode
| Demande | Mode | Lire avant d'écrire |
|---|---|---|
| Un premier mail, seul ou en ouverture de séquence | Premier mail | `references/premier-mail.md` |
| Une campagne complète pour une cible | Séquence de 3 mails | la fiche de séniorité (étape 2) |
| "Il n'a pas répondu", mail 2 à 5, mail de rupture | Relance | `references/relances.md` |
| "Quel angle ?", cible donnée sans angle | 3 angles de campagne | `references/angles.md` |
| "Quel CTA ?", "comment finir mon mail ?" | 5 CTA à valeur | `references/cta.md` |

Pas d'angle fourni : le déduire du contexte. Si un signal existe, l'angle part du signal. Si l'utilisateur hésite entre plusieurs approches, passer par `references/angles.md` d'abord.

## Étape 2 : régler la séniorité
| Séniorité | Altitude | Angle d'ouverture | CTA | Fiche |
|---|---|---|---|---|
| VP / C-level | Résultat stratégique | Tension de responsabilité, pression du board, trimestre raté | Conversation stratégique, pas une démo | `references/seniorite-vp.md` |
| Manager | Friction opérationnelle | Écart d'exécution de l'équipe, double pression, problème qui revient | Exploration à faible risque | `references/seniorite-manager.md` |
| Contributeur individuel (IC) | Frustration quotidienne | Un moment précis de sa journée, de pair à pair | Curiosité ou rôle de champion interne | `references/seniorite-ic.md` |

Lire la fiche du niveau visé avant d'écrire, dans tous les modes.

## Doctrine
- **Le premier mail a un seul travail : gagner le droit à un deuxième message.**
- **Règle des 3 secondes.** Le prospect décide sur : objet, nom de l'expéditeur, première ligne. Si ces trois ratent, le reste ne compte pas.
- **Trois ouvertures, par ordre de force :**
  1. Signal (si un déclencheur réel existe) : nommer le signal, le relier à son défi probable, ne pas pitcher.
  2. Tension (par défaut) : une tension ou une ironie de son monde, qu'il reconnaît tout de suite.
  3. Insight (profils analytiques) : une observation non évidente qui recadre ce qu'il croit savoir. Pas un "saviez-vous que X %".
- **Chaque mail d'une séquence apporte du neuf.** Nouvel angle, diagnostic plus profond ou ressource utile. Jamais une redite.
- **Pas de réponse n'est pas un non.** On ne s'excuse jamais de relancer.

## Structure d'un mail
```
[Objet : 2 mots, minuscules]
[Ouverture : 10 à 15 mots, nomme la tension]
[2 à 3 phrases : développer la tension dans son monde, sans produit]
[1 phrase pont : ce qui devient possible, sans nommer le produit]
[CTA : une seule demande, peu coûteuse]
[PS : mails 2 et 3, une ressource réelle]
[Ligne de rupture : dernier mail seulement]
```

Séquence de 3 mails :
```
Mail 1 : nommer la tension (accroche, crédibilité par la précision)
Mail 2 : cause racine, pas le symptôme + PS avec ressource
Mail 3 : changement d'angle ou de point de vue + ligne de rupture
```

Ligne de rupture, obligatoire en fin de dernier mail (à adapter à la langue du prospect) :
```
won't message again, hope I didn't do something wrong!
```

## Règles d'écriture (non négociables)
- **Longueur :** corps de 50 à 100 mots, hors variables et PS. Mail de rupture d'une séquence longue : 3 à 5 phrases.
- **Objet :** exactement 2 mots, en minuscules, ton de mail interne. Différent à chaque mail. Jamais "quick question", "following up", un nom de produit ou un superlatif. Test : un collègue enverrait-il cet objet à un collègue ?
- **Ouverture :** 10 à 15 mots. Jamais une question, jamais "je" / "I" en premier mot, jamais un compliment, jamais le produit ou l'entreprise de l'expéditeur.
- **Parler de lui :** "vous", "votre équipe", "votre pipe". "Je" toléré seulement dans le CTA ou le PS.
- **Un seul problème par mail. Un seul CTA.**
- **Pas de fonctionnalité, pas de bénéfice produit.** Sa douleur, sa réalité, les mots de son métier.
- **Phrases courtes :** une ligne sur mobile, 20 mots max.
- **Aucune question rhétorique.** La seule question possible est celle du CTA.
- **Aucun tiret cadratin, aucun emoji, aucun mot en majuscules.** Un seul point d'exclamation autorisé : celui de la ligne de rupture.
- **Formules interdites :** "just checking in", "following up", "circling back", "bumping this", "did you get my last email", "I hope this finds you well", "I came across your profile", "I believe", "imagine if", "saving time", "saving money", le mot "click", et leurs équivalents dans la langue du prospect.
- **Jargon interdit :** leverage, synergies, cutting-edge, seamlessly, robust, game-changer, revolutionary, innovative, holistic, best-in-class, world-class, paradigm, transformative, scalable solutions, empower, streamline, unlock, optimize, next-level.
- **CTA :** mail 1 = CTA à valeur, sans demande de RDV (sauf si l'utilisateur la veut explicitement). Mail 2 et suivants : 15 minutes avec deux créneaux précis possibles. Jamais le même type de CTA deux fois de suite. Détail : `references/cta.md`.
- **Ton :** assuré, direct, d'égal à égal. Jamais vendeur, jamais désolé.
- **Test à voix haute :** 15 secondes, ça coule naturellement.

## Anti-invention
Classer chaque affirmation avant de l'écrire :
- ✅ Fait vérifié (fourni par l'utilisateur ou sourcé) : utiliser.
- 🔵 Inférence raisonnable pour ce rôle ou ce secteur : formuler de façon neutre.
- ⚠️ Affirmation sans appui : retirer ou reformuler en observation.
- 🚨 Chiffre, résultat, cas client ou ressource inventés : jamais.

Preuve sociale sûre : "Companies like [Name]..." ou "Teams at [Name] often find...", sans résultat revendiqué. Jamais "[Company] achieved X % after using us" sans source vérifiée. Ne jamais citer une ressource (article, modèle, cas client) qui n'a pas été fournie.

## Sortie
```
CAMPAGNE : [Persona] / [Nom de l'angle]
Cible : [Titre] | [Secteur, taille] | Séniorité : [VP / Manager / IC]
Mode : [Premier mail / Séquence 3 mails / Relance mail N]
Angle : [une phrase]
Signal utilisé : [signal ou "aucun, ouverture par la tension"]
Variables : [liste ou "aucune"]

MAIL N
Objet : [mot1 mot2]
[Corps]
[P.S. si mail 2 ou 3]
[Ligne de rupture si dernier mail]

NOTES
- Tension, cause racine et changement d'angle de chaque mail
- Progression des CTA
- Quoi tester en A/B en premier : objet, ouverture ou CTA
```
Compléments propres à chaque mode : voir la référence du mode.

## Suite
Proposer la suite et attendre l'accord :
- faire noter et resserrer le texte : `copy-review` ;
- ajouter les autres canaux : `linkedin-outreach`, `cold-call-script` ;
- pousser la campagne dans Lemlist par l'API : `copy-lemlist` ;
- il manque la structure (canaux, nombre d'étapes, délais) : `outbound-campaign-architect`.

---
name: linkedin-outreach
description: >-
  Analyse un profil LinkedIn, note son fit avec l'ICP, choisit l'angle
  d'approche et écrit la séquence LinkedIn : note de connexion, puis 2 messages
  après acceptation (M1 ouverture, M2A si réponse, M2B si silence). À utiliser
  quand on partage un profil LinkedIn (URL, capture, texte collé) ou qu'on
  demande "analyse ce profil", "trouve-moi un angle pour ce lead", "une
  accroche pour ce prospect", "écris-moi une séquence LinkedIn", "mes DM
  LinkedIn", "quoi envoyer après l'acceptation", "analyze this profile", "how
  do I reach out to this person", "find me an angle for this lead", "write me
  an icebreaker", "best hook for this LinkedIn profile", "write me a LinkedIn
  sequence", "draft my LinkedIn DMs". Séquence email : cold-email-writer.
  Douleurs d'une entreprise à partir de ses signaux : trigger-finder. Campagne
  multicanale complète dans Lemlist : outbound-campaign-architect puis
  copy-lemlist. InMail non couvert.
---
# LinkedIn Outreach : du profil à la séquence

But : trouver le meilleur angle pour une personne précise, puis écrire les messages LinkedIn qui ouvrent une vraie conversation.

**LinkedIn n'est pas l'email.** Le prospect vient d'accepter une connexion : il est un peu tiède, il n'attend pas un pitch. Un premier message qui ressemble à un cold email sent l'automatisation et tue la confiance.

## Entrée
Lire d'abord ce qui existe : `icp-*.md`, `persona-*.md`, l'offre, un angle déjà trouvé (`trigger-finder`, `cold-email-writer`), le contexte de la conversation. Demander seulement ce qui manque, en un seul message, 3 questions au plus :
1. **L'expéditeur :** l'entreprise, ce qu'elle fait en une phrase ("on aide X à faire Y"), le problème réglé pour ce prospect, les preuves réelles disponibles (ne jamais en inventer).
2. **La cible :** ICP et persona visés, leurs 2 à 3 douleurs principales, ce qui déclenche d'habitude l'achat.
3. **Le contexte :** interaction déjà eue (vue de profil, like, webinaire, rencontre), variables de personnalisation disponibles, autre canal en parallèle (email).

Garder ce contexte pour tous les profils suivants de la session. Ne pas le redemander.

## Deux cas
| Cas | Parcours |
|---|---|
| Un profil est fourni | Étapes 1 à 5 : analyse, fit, angle, séquence |
| Pas de profil, un persona ou un segment | Étapes 4 et 5 : angle par tension, séquence modèle sans fausse personnalisation |

## Étape 1 : lire le profil
Formats acceptés : URL, capture ou PDF, texte collé, description libre.
- URL : tenter de récupérer la page. LinkedIn limite ce qui est visible sans connexion : extraire ce qui est disponible, dire ce qui manque, et demander un copier-coller ou une capture si l'essentiel manque.
- Capture, PDF ou texte : extraire nom, titre, headline, résumé, expériences, formation, compétences, recommandations, activité, certifications.

## Étape 2 : analyser le profil
Grille complète dans `references/analyse-profil.md`. Aller au-delà de l'évident.
- **L'activité récente vaut de l'or** (posts, likes, commentaires) : elle montre les priorités du moment.
- **Le headline est le signal le plus délibéré** : c'est ce que la personne choisit de dire d'elle.
- Chercher les signaux de timing : poste récent, promotion, recrutement dans son équipe, levée, post sur une douleur qu'on règle.

## Étape 3 : score de fit sur 10
| Dimension | Points max |
|---|---|
| Titre / séniorité | 3 |
| Taille / stade de l'entreprise | 2 |
| Secteur | 2 |
| Déclencheur ou signal de timing présent | 2 |
| Fit techno (utilise ou aurait besoin de l'outil) | 1 |

- **8 à 10 :** fit fort. Investir dans une personnalisation poussée.
- **5 à 7 :** fit moyen. Personnalisation plus légère, tester d'abord.
- **0 à 4 :** fit faible. Le dire, avec la raison, et ne continuer que si l'utilisateur confirme. Le message convertira moins.

## Étape 4 : choisir l'angle
Taxonomie et règles d'accroche dans `references/angles.md`.
1. **Signal actif d'abord** (activité récente, timing). S'il y en a un, il mène toujours.
2. Sinon, alignement headline / résumé avec l'offre : angle identité.
3. Sinon, douleur de l'ICP la plus probable d'après le profil : angle persona.
4. Retenir **1 angle principal** (la preuve la plus forte) et **2 angles de secours**.

## Étape 5 : écrire la séquence
Doctrine, structures et formulations dans `references/sequence.md`.
```
Note de connexion (optionnelle, souvent mieux sans)
M1  : ouverture, juste après l'acceptation. Lancer la conversation. Aucun pitch.
M2A : s'il a répondu, dans les 24 h. Prolonger, puis proposer un pas léger.
M2B : sans réponse, 3 à 5 jours après M1. Nouvel angle, quelque chose d'utile.
```
Règles pour tous les messages :
- **40 à 70 mots maximum.** Plus court est toujours mieux.
- **M1 : pas de produit, pas de nom d'entreprise, pas de demande de rendez-vous.** Un seul but : obtenir une réponse.
- Ouvrir par une observation ou une affirmation, jamais par une question. Une seule question par message.
- Parler de "vous" (votre équipe, votre contexte), pas de "je".
- Une idée par message. Phrases courtes. Test : le message doit pouvoir se dire à voix haute.
- Pas d'emoji. Pas de compliment d'ouverture. Pas de "merci d'avoir accepté", "je me permets", "je reviens vers vous".
- Jamais "gagner du temps" ni "économiser de l'argent".
- Adapter le ton à la séniorité et au style d'écriture du prospect.
- Écrire dans la langue du prospect.

## Limites de caractères
| Format | Limite | Note |
|---|---|---|
| Note de connexion | 300 caractères | Optionnelle, souvent mieux sans |
| Message (DM) | Pas de limite dure | S'imposer 40 à 70 mots |
| InMail | 2 000 caractères | Non couvert par cette skill |

## Sortie
```
PROFIL : [Nom], [Titre] chez [Société] | séniorité : [niveau]
Fit ICP : [X/10], [fort / moyen / faible] : [2 phrases]
Signaux relevés : [signal 1] | [signal 2] | [signal 3]

ANGLE PRINCIPAL : [nom]
Pourquoi : [2 à 3 phrases : quel signal, quelle douleur probable, pourquoi maintenant]
Angles de secours : [nom + accroche de 20 à 40 mots] x 2
À ne pas dire : [2 points propres à ce prospect]

SÉQUENCE
Note de connexion (300 caractères max) : [...]
M1 (juste après l'acceptation) : [...]
M2A (s'il a répondu, sous 24 h) : [...]
M2B (sans réponse, 3 à 5 jours après M1) : [...]

NOTES
Objectif du premier message | réponse espérée | ton retenu | sujets à éviter
À tester en A/B : [un seul élément : ouverture de M1 ou angle de M2B]
Preuves : [citation ou observation du profil] → [à quoi elle a servi]
```
Pour une accroche email sur le même angle : passer l'angle à `cold-email-writer`.

## Profil pauvre
Pas de post, pas de résumé, expériences nues : le dire clairement. Proposer d'enrichir (outil d'enrichissement comme Clay, page de l'entreprise, autres canaux) avant de contacter. Produire quand même un angle **persona** (pas signal), avec une réserve sur la confiance.

## Règles d'exactitude
- Fait vérifié : utilisable. Inférence raisonnable pour ce rôle ou ce secteur : formulation neutre. Affirmation sans appui : la retirer ou la tourner en observation.
- **Jamais de chiffre, résultat, cas client ou ressource inventés.** Pas de ROI ni de pourcentage sans source vérifiée. Pas de nom de client sans autorisation.
- Preuve sociale sûre : "Des entreprises comme [Nom]…", sans résultat annoncé.
- Aucun envoi sans validation.

## Suite
Proposer la suite et attendre l'accord :
1. Faire relire les messages : `copy-review`.
2. Ajouter l'email sur le même prospect : `cold-email-writer` (une autre douleur que M1, pour ne pas se répéter).
3. Monter la campagne multicanale : `outbound-campaign-architect`, puis `copy-lemlist` pour la pousser dans Lemlist.
4. Il a répondu : `reply-handler`.

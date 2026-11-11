---
name: offer-builder
description: >-
  Construit l'offre d'une entreprise pour la prospection, en 3 temps enchaînés
  : (a) pourquoi ses clients achètent vraiment (site, cas clients, avis :
  douleurs, mots des clients, alternatives ratées, coût de l'inaction), (b)
  inventaire des propositions de valeur avec leurs preuves, (c) l'offre sur
  trois niveaux et ses versions par canal. Chaque temps peut être demandé
  seul. À utiliser quand on demande "c'est quoi notre offre", "pourquoi nos
  clients achètent", "liste nos propositions de valeur", "transforme mes
  fonctionnalités en bénéfices", "comment pitcher", "research my customers",
  "why do people buy from us", "find customer pain points", "list my value
  props", "what value do we provide", "how to frame my offer", "how to pitch
  my product", "write a one-liner for my product" ou "turn features into
  benefits". Porte sur l'entreprise du client, pas sur un compte cible
  (skill trigger-finder) ni sur les concurrents (skill market-research). Ne
  rédige pas les mails : skill cold-email-writer.
---
# Offre : de "ce qu'on fait" à "ce que vous obtenez"

Les clients n'achètent pas des fonctions. Ils achètent un résultat, la fin d'une douleur, un changement.
- Mauvais : "Plateforme IA de personnalisation d'emails avec plus de 50 intégrations."
- Bon : "3 fois plus de rendez-vous sans recruter de SDR."

## Entrée
Lire d'abord ce qui existe, avant toute question :
- un fichier `offre-*.md` déjà présent : le lire, ne pas le refaire, proposer seulement une revue ;
- `icp-*.md` et `persona-*.md` s'ils existent ;
- le contexte du repo, le site, les supports fournis.

Il faut **au moins une source** : URL du site, page de cas clients, page d'avis (G2, Capterra, TrustRadius), présentation ou description du produit. Utiles aussi : page LinkedIn, blog, URL de concurrents. Si rien n'est fourni, poser 1 à 3 questions au maximum, en un seul message.

## Sortie
Un fichier `offre-{entreprise}.md` en 3 parties. Gabarits : `references/gabarits.md`.
Si un seul temps est demandé ("juste les propositions de valeur", "juste un one-liner"), faire ce temps seul.

## Temps A : pourquoi les clients achètent
**Hiérarchie des sources.** En cas de conflit, la voix du client l'emporte sur le marketing de l'entreprise.
1. Citations exactes de clients (cas clients, avis).
2. Chiffres donnés par les clients (retour, temps gagné).
3. Affirmations du site : à vérifier contre les avis.
4. Mentions de concurrents dans les avis.

**Dans les cas clients (viser 5 à 10) :** l'état d'avant, le moment déclencheur, pourquoi ce produit plutôt qu'un autre, l'état d'après avec des chiffres, les citations.
**Dans les avis :** les points forts dans les mots des clients, les points faibles (honnêtement), les alternatives regardées, les usages, les mots chargés d'émotion ("enfin", "ça nous a sauvés", "frustré").

**Les 4 couches de douleur :**
1. De surface : "la prospection par email était manuelle."
2. Business : "2 % de réponses, pipe vide."
3. Personnelle : "je travaillais le week-end et je ratais quand même mon objectif."
4. De carrière : "j'allais perdre mon poste."

Livrer : douleurs classées par intensité avec citations et fréquence, chiffres d'impact, profil de ceux qui en tirent le plus, déclencheurs, bibliothèque de mots des clients, différenciateurs et faiblesses, alternatives ratées, coût de l'inaction.

## Temps B : inventaire des propositions de valeur
Parcourir page d'accueil, fonctionnalités, prix, cas clients, témoignages. Relever : promesses directes, fonctions qui impliquent une valeur, résultats clients, comparaisons ("contrairement à X"), citations.

Les 7 types :
| Type | Exemple |
|---|---|
| Résultat | "3 fois plus de rendez-vous" |
| Efficacité | "La liste en 20 minutes au lieu de 4 heures" |
| Qualité | "40 % de réponses contre 8 % en moyenne" |
| Coût | "Remplace un SDR à 70 000 $ par 99 $ par mois" |
| Expérience | "En place en 5 minutes, sans équipe technique" |
| Réduction du risque | "Certifié SOC 2" |
| Différenciation | "Le seul outil avec IA et délivrabilité intégrées" |

Les exemples sont des illustrations de forme, pas des chiffres à reprendre.

Puis ranger :
- **par persona** : les 3 meilleures pour chacun, et pourquoi ;
- **par niveau** : Niveau 1 = à mettre en tête (les plus fortes, les plus différenciantes, les mieux prouvées). Niveau 2 = en appui. Niveau 3 = le minimum attendu, ne jamais ouvrir avec ;
- **avec leur preuve** : un tableau proposition, preuve, source ;
- **les trous** : promesses sans preuve (trouver la preuve ou retirer), preuves fortes sous-utilisées, ce que les concurrents promettent et qui n'est pas traité, contradictions entre pages.

## Temps C : l'offre sur trois niveaux
**Monter l'échelle jusqu'au résultat.** Un bénéfice sans résultat ne suffit pas.
Fonction ("personnalisation IA") → capacité ("1 000 emails personnalisés en 10 minutes") → bénéfice ("15 heures gagnées par semaine") → résultat ("atteindre son objectif sans travailler le week-end").

| Niveau | Sert à | Forme |
|---|---|---|
| 1. La phrase | Objets, accroches, première impression | 3 versions : résultat + vitesse, résultat + effort évité, transformation ("passer de [avant] à [après]") |
| 2. La proposition de valeur | Corps d'email, message LinkedIn, pitch court | "On aide [ICP précis] à [résultat mesurable] grâce à [approche propre], pour [impact business]." |
| 3. L'offre complète | Page d'atterrissage, appel de découverte | Problème (dans les mots du prospect) → aggravation (chiffrée) → solution (1 à 2 phrases) → résultat → preuve |

Puis les versions par canal : objets d'email (5 à 7 mots, sur eux, qui annoncent le résultat), ouverture d'email (2 phrases : constat d'une douleur + résultat), message LinkedIn (80 caractères).
Finir par les erreurs à éviter, tirées de ce que l'entreprise dit aujourd'hui.

Le "qui" du niveau 2 vient de `icp-*.md` s'il existe. Sinon, prendre le profil qui tire le plus de valeur (temps A) et le marquer "hypothèse".

## Barre de qualité (avant de livrer)
- Chaque enseignement clé s'appuie sur une citation exacte de client.
- Les chiffres sont précis (une fourchette, pas "amélioré") et sourcés.
- Les faiblesses sont dites honnêtement.
- Chaque offre passe le test "et alors ?", parle de ce qu'ils **obtiennent**, ouvre sur le résultat, sans jargon, sans promesse exagérée.
- Un commercial peut s'en servir aujourd'hui pour écrire un email personnalisé.

## Règles
- Ne jamais inventer un chiffre, une citation ni un nom de client. Pas de preuve : écrire "preuve à trouver" et le ranger dans les trous.
- Citer mot pour mot, avec la source. Ne pas reformuler les mots des clients.
- Toujours indiquer les sources et la date en tête du fichier.
- Rien de publié ni d'envoyé sans validation.

## Suite
Proposer la suite et **attendre l'accord** avant d'enchaîner. Ne rien lancer tout seul.
1. "On définit qui cibler ?" : `icp-builder`, puis `persona-builder`.
2. "On regarde le marché et les concurrents ?" : `market-research`.
3. ICP et persona déjà faits : "On construit la séquence ?" : `outbound-campaign-architect`, puis `cold-email-writer`.

Si l'offre a été écrite avant l'ICP, proposer de repasser sur le temps C une fois `icp-builder` et `persona-builder` faits, pour caler le "qui" et les mots.

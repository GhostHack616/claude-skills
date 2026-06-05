---
name: write-like-me
description: Rewrites a draft so it sounds like the USER (not like an AI) — strips AI tells AND matches the user's personal voice from their own writing samples. Use when the user wants to "write like me", "sound like me", "make this less AI", "rends ça moins IA", "écris comme moi", "humanise ce texte", "ça fait trop ChatGPT / trop IA", or pastes a draft for a public post (LinkedIn, X, newsletter, Malt) and wants it in their authentic voice. ALWAYS gets the user's writing samples (or reads voice-profile.md) before rewriting — a "voice" rewrite without samples is just generic.
---

# Write Like Me

Deux jobs, pas un : **(1)** enlever les empreintes d'IA, **(2)** faire que ça sonne comme **l'utilisateur précisément**. Un "humanizing" générique ne suffit pas — il faut calquer SA voix.

## Étape 1 — Récupérer la voix (obligatoire)
Avant toute réécriture, il te faut la vraie voix de l'utilisateur. Dans l'ordre :
1. **Lis le `voice-profile.md` fourni dans ce dossier de skill** — c'est la voix de Romain (registre pro/neutre pour Malt & contextes pros). Applique-le par défaut.
2. Si un `voice-profile.md` existe aussi dans le projet courant, il **a priorité** (contexte plus précis).
3. Si aucun profil n'existe ET que c'est une autre personne → demande **3 à 5 échantillons** de SON écriture. **Ne réécris pas "en sa voix" sans matière** — sinon c'est de l'humain générique.
3. À partir des échantillons, extrais et note :
   - **Rythme** des phrases (courtes/sèches ? longues ? mélange ?)
   - **Vocabulaire** & expressions récurrentes, argot, langue (mix FR/EN ?)
   - **Ton** (direct, chaleureux, provoc, humour pince-sans-rire ?)
   - **Habitudes de structure** (punchlines ? listes ? emojis ? ponctuation — tirets, "..." ?)
   - Ce qu'il **ne fait JAMAIS**
   Propose de sauver ça dans **`voice-profile.md`** pour zapper l'interview les prochaines fois.

## Étape 2 — Tuer les empreintes d'IA
Supprime / évite ces tells :
- **Vocabulaire** : delve, leverage, "tapestry", robust, "navigate", foster, underscore, "testament", "realm", "landscape", "dans un monde en constante évolution", "game-changer", "elevate", "unlock", "embark", "seamless", "force est de constater".
- **Structure** : parallélisme négatif ("Ce n'est pas X — c'est Y"), tout-en-bullets, Titres En Capitales, triades d'adjectifs (rule of three), paragraphes tous de même longueur.
- **Ton** : "Great question !", "Je serais ravi de…", "En conclusion", "Plongeons dans…", sur-hedging, fausse énergie, fin façon poster motivant.
- **Ponctuation** : abus de tiret cadratin (—), bullets-emojis, symétrie trop parfaite.
- **Contenu** : inflation de nouveauté ("un concept dont personne ne parle"), attributions vagues ("les experts disent"), disclaimers de date de connaissance.

## Étape 3 — Réécrire dans SA voix
- Applique le profil voix (Étape 1) + retire les tells (Étape 2).
- **Préserve le sens et l'intention.** N'invente aucun fait.
- Colle son rythme et son vocabulaire. S'il écrit court et cash → écris court et cash.
- **Garde de l'imperfection volontaire** : les vrais humains varient la longueur des phrases, commencent parfois par "Et/Mais", lâchent un fragment de phrase.

## Sortie
1. La version réécrite, **prête à poster**.
2. (Si demandé) 2-3 lignes sur ce qui était le plus "IA" dans l'original.

Ne sur-polis pas. L'objectif = "on dirait que l'utilisateur l'a écrit un bon jour", pas "texte parfait et lisse".

---
*Catalogue de tells inspiré des humanizers communautaires + de la page Wikipédia "Signs of AI writing".*

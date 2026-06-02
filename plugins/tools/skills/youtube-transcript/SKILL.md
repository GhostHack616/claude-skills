---
name: youtube-transcript
description: Lit le contenu d'une vidéo YouTube en récupérant son transcript (sous-titres) en texte clair — pour le résumer, l'analyser, en extraire des hooks ou des citations. Use when the user shares a YouTube link, says "lis cette vidéo YouTube", "résume cette vidéo", "transcript de cette vidéo", "de quoi parle cette vidéo YouTube", "what does this youtube video say", "summarize this youtube video", "get the transcript", or pastes a youtube.com / youtu.be / shorts URL and wants its content. No API key, no cookie.
allowed-tools: Bash, Read
---

# YouTube Transcript

Récupère le transcript texte d'une vidéo YouTube (sous-titres manuels OU auto-générés), sans clé API ni cookie. Ensuite tu fais ce que l'utilisateur veut : résumé, analyse, extraction de hooks, citations, etc.

## Étapes

1. **Récupère l'URL ou l'ID YouTube** fournie par l'utilisateur.

2. **Lance le script** (récupère la dépendance à la volée avec `uv`, rien à pré-installer) :

   ```bash
   uv run --with "youtube-transcript-api==0.6.2" python "${CLAUDE_SKILL_DIR}/scripts/yt_transcript.py" "<URL_OU_ID>"
   ```

   Option : ajoute un code langue en 2ᵉ argument pour forcer (`fr`, `en`…), ex: `... "<URL>" fr`.

   **Si `uv` n'est pas disponible**, fallback pip :
   ```bash
   pip install -q "youtube-transcript-api==0.6.2" && python "${CLAUDE_SKILL_DIR}/scripts/yt_transcript.py" "<URL_OU_ID>"
   ```

3. **Lis le transcript** imprimé sur stdout, puis réponds à la demande de l'utilisateur.

## Notes
- Marche pour toute vidéo ayant des sous-titres (manuels ou auto-générés).
- Si la vidéo n'a **aucun** sous-titre, le script renvoie une erreur claire → préviens l'utilisateur (il faudrait alors une transcription audio type Whisper, hors scope de ce skill léger).
- Aucune donnée envoyée ailleurs : on récupère juste les sous-titres publics depuis YouTube.

## Si l'erreur contient « 403 » / « Forbidden »
YouTube **bloque l'IP de cet environnement** (fréquent sur les IP datacenter / sessions cloud).
Ce n'est pas un bug du skill. Dans ce cas, dis-le clairement à l'utilisateur et propose :
1. **Relancer le skill en local** (Claude Code sur sa machine, IP résidentielle) — ça passe presque toujours.
2. Sinon, **coller le transcript à la main** (sur YouTube : `...` → « Afficher la transcription »).
Ne boucle pas sur des retries : si c'est 403, c'est l'IP, pas la commande.

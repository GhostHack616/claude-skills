#!/usr/bin/env bash
# apify_youtube_transcript.sh — transcript YouTube fiable via Apify (IP résidentielles → pas de 403).
# Actor : supreme_coder/youtube-transcript-scraper  (PAY_PER_EVENT : ~0,001$ start + 0,0005$/transcript)
#
# Usage : apify_youtube_transcript.sh <youtube_url|video_id|channel_url|playlist_url> [format]
#   format = text (défaut) | json | srt | vtt
#
# Pré-requis : variable d'env APIFY_TOKEN (apify_api_...). JAMAIS imprimée par ce script.
# Accepte aussi des URLs de chaîne/playlist : elles sont étendues en vidéos automatiquement.
set -euo pipefail

URL="${1:-}"
FORMAT="${2:-text}"
ACTOR="supreme_coder~youtube-transcript-scraper"

if [ -z "${APIFY_TOKEN:-}" ]; then
  echo "ERREUR: APIFY_TOKEN n'est pas défini dans l'environnement." >&2
  echo "        export APIFY_TOKEN=apify_api_xxxxx   (ne jamais committer ce token)" >&2
  exit 2
fi
if [ -z "$URL" ]; then
  echo "Usage: $(basename "$0") <youtube_url|video_id|channel_url|playlist_url> [text|json|srt|vtt]" >&2
  exit 2
fi

# Construire l'input JSON proprement (python3 échappe l'URL → pas d'injection).
INPUT_JSON=$(URL="$URL" FORMAT="$FORMAT" python3 -c 'import json,os
print(json.dumps({"urls":[{"url":os.environ["URL"]}],"outputFormat":os.environ["FORMAT"]}))')

# run-sync-get-dataset-items : lance l'actor ET renvoie directement les items du dataset.
RESP=$(curl -sS --max-time 290 \
  -X POST "https://api.apify.com/v2/acts/${ACTOR}/run-sync-get-dataset-items?token=${APIFY_TOKEN}" \
  -H "Content-Type: application/json" \
  --data "$INPUT_JSON")

printf '%s' "$RESP" | python3 -c '
import sys, json
raw = sys.stdin.read()
try:
    d = json.loads(raw)
except Exception:
    sys.stderr.write("Reponse non-JSON dApify:\n" + raw[:500] + "\n"); sys.exit(1)
if isinstance(d, dict) and d.get("error"):
    sys.stderr.write("ERREUR API Apify: %s\n" % json.dumps(d["error"])[:500]); sys.exit(1)
if not d:
    sys.stderr.write("Aucun item renvoye (la video na peut-etre aucun sous-titre).\n"); sys.exit(1)
for it in d:
    vu = it.get("videoUrl") or it.get("inputUrl") or "?"
    vd = it.get("videoDetails") if isinstance(it.get("videoDetails"), dict) else {}
    title = vd.get("title")
    lang = it.get("language")
    print("# %s" % (title or vu))
    print("URL: %s" % vu)
    if lang: print("Langue: %s" % lang)
    print()
    tr = it.get("transcript")
    if isinstance(tr, (list, dict)):
        print(json.dumps(tr, ensure_ascii=False, indent=2))
    else:
        print(tr if tr is not None else "(transcript vide)")
    print()
'

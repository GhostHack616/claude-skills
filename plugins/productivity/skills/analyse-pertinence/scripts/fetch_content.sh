#!/usr/bin/env bash
# fetch_content.sh — récupère le contenu d'une URL via Apify (IP résidentielles, pas de 403).
# Auto-détecte : URL YouTube -> transcript ; sinon -> crawl du site en markdown.
# Self-contained : ne dépend PAS du skill apify-fetch (pour rester vendorable seul).
#
# Usage : fetch_content.sh <url> [maxCrawlPages=25]
# Pré-requis : variable d'env APIFY_TOKEN (apify_api_...). JAMAIS imprimée.
set -euo pipefail

URL="${1:-}"
MAXP="${2:-25}"

if [ -z "${APIFY_TOKEN:-}" ]; then
  echo "ERREUR: APIFY_TOKEN n'est pas defini dans l'environnement." >&2
  echo "        export APIFY_TOKEN=apify_api_xxxxx   (ne jamais committer ce token)" >&2
  exit 2
fi
if [ -z "$URL" ]; then
  echo "Usage: $(basename "$0") <url> [maxCrawlPages]" >&2; exit 2
fi

is_youtube() { printf '%s' "$1" | grep -qiE '(youtube\.com|youtu\.be)'; }

if is_youtube "$URL"; then
  # --- YouTube : transcript (synchrone, rapide) ---
  echo ">> source: YouTube (transcript)" >&2
  INPUT=$(URL="$URL" python3 -c 'import json,os; print(json.dumps({"urls":[{"url":os.environ["URL"]}],"outputFormat":"text"}))')
  RESP=$(curl -sS --max-time 290 \
    -X POST "https://api.apify.com/v2/acts/supreme_coder~youtube-transcript-scraper/run-sync-get-dataset-items?token=${APIFY_TOKEN}" \
    -H "Content-Type: application/json" --data "$INPUT")
  printf '%s' "$RESP" | python3 -c '
import sys, json, html
d = json.loads(sys.stdin.read())
if isinstance(d, dict) and d.get("error"):
    sys.stderr.write("ERREUR API: %s\n" % json.dumps(d["error"])[:400]); sys.exit(1)
if not d:
    sys.stderr.write("Aucun transcript (video sans sous-titres ?).\n"); sys.exit(1)
for it in d:
    vd = it.get("videoDetails") if isinstance(it.get("videoDetails"), dict) else {}
    print("SOURCE_TYPE: youtube")
    print("TITLE: %s" % (vd.get("title") or it.get("videoUrl")))
    print("URL: %s" % (it.get("videoUrl") or it.get("inputUrl")))
    print("LANG: %s" % (it.get("language") or "?"))
    print("--- CONTENT ---")
    print(html.unescape(it.get("transcript") or ""))
'
else
  # --- Site : crawl -> markdown (asynchrone, pas de cap 300s) ---
  echo ">> source: site web (crawl -> markdown, maxCrawlPages=$MAXP)" >&2
  INPUT=$(URL="$URL" MAXP="$MAXP" python3 -c 'import json,os; print(json.dumps({
    "startUrls":[{"url":os.environ["URL"]}],
    "maxCrawlPages":int(os.environ["MAXP"]),
    "crawlerType":"playwright:adaptive",
    "saveMarkdown":True,
    "proxyConfiguration":{"useApifyProxy":True}}))')
  START=$(curl -sS --max-time 60 \
    -X POST "https://api.apify.com/v2/acts/apify~website-content-crawler/runs?token=${APIFY_TOKEN}" \
    -H "Content-Type: application/json" --data "$INPUT")
  read -r RUN_ID DATASET_ID < <(printf '%s' "$START" | python3 -c '
import sys, json
d = json.load(sys.stdin)
if isinstance(d, dict) and d.get("error"):
    sys.stderr.write("ERREUR demarrage: %s\n" % json.dumps(d["error"])[:400]); sys.exit(1)
data = d.get("data", {}); print(data.get("id",""), data.get("defaultDatasetId",""))')
  [ -z "${RUN_ID:-}" ] && { echo "ERREUR: pas de run id." >&2; exit 1; }
  echo ">> run: $RUN_ID" >&2
  WAITED=0
  while :; do
    STATUS=$(curl -sS --max-time 30 "https://api.apify.com/v2/actor-runs/${RUN_ID}?token=${APIFY_TOKEN}" \
      | python3 -c 'import sys,json; print(json.load(sys.stdin).get("data",{}).get("status","?"))')
    echo ">> statut: $STATUS (${WAITED}s)" >&2
    case "$STATUS" in
      SUCCEEDED) break ;;
      FAILED|ABORTED|TIMED-OUT|TIMING-OUT) echo "ERREUR: run $STATUS." >&2; exit 1 ;;
    esac
    [ "$WAITED" -ge 1800 ] && { echo "ERREUR: timeout polling." >&2; exit 1; }
    sleep 5; WAITED=$((WAITED+5))
  done
  curl -sS --max-time 120 "https://api.apify.com/v2/datasets/${DATASET_ID}/items?token=${APIFY_TOKEN}&clean=true" \
    | python3 -c '
import sys, json
d = json.load(sys.stdin)
if isinstance(d, dict) and d.get("error"):
    sys.stderr.write("ERREUR dataset: %s\n" % json.dumps(d["error"])[:400]); sys.exit(1)
print("SOURCE_TYPE: site")
print("PAGES: %d" % len(d))
for it in d:
    print("\n===== PAGE: %s =====" % (it.get("url") or "?"))
    t = it.get("title")
    if t: print("title: %s" % t)
    print(it.get("markdown") or it.get("text") or "")
'
fi

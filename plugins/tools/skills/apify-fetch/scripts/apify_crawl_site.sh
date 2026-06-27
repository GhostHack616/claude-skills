#!/usr/bin/env bash
# apify_crawl_site.sh — crawle un site et renvoie le contenu en markdown propre, via Apify.
# Actor : apify/website-content-crawler  (facturation via usage plateforme Apify, bornee par maxCrawlPages)
#
# Usage : apify_crawl_site.sh <start_url> [maxCrawlPages=20] [crawlerType] [proxyGroup]
#   maxCrawlPages : borne dure du budget (defaut 20). Mets-la haute pour "tout le site".
#   crawlerType   : playwright:adaptive (defaut, recommande) | playwright:firefox | cheerio | playwright:chrome
#                   -> "cheerio" = rapide, sites HTML statiques ; "playwright:*" = sites JS.
#   proxyGroup    : AUTO (defaut, proxy auto choisi par Apify) | RESIDENTIAL (si le site bloque)
#                   NB: sur le plan FREE on ne peut PAS nommer "DATACENTER" -> laisser AUTO.
#
# Mode ASYNCHRONE : lance le run, sonde jusqu'a la fin, puis recupere le dataset.
# -> pas de limite 300s (contrairement a run-sync), donc OK pour crawler un site entier.
# Pre-requis : variable d'env APIFY_TOKEN (apify_api_...). JAMAIS imprimee par ce script.
set -euo pipefail

URL="${1:-}"
MAXP="${2:-20}"
CTYPE="${3:-playwright:adaptive}"
PGROUP="${4:-AUTO}"
ACTOR="apify~website-content-crawler"
POLL_SECS=5
MAX_WAIT_SECS=1800   # garde-fou : abandonne le polling apres 30 min

if [ -z "${APIFY_TOKEN:-}" ]; then
  echo "ERREUR: APIFY_TOKEN n'est pas defini dans l'environnement." >&2
  echo "        export APIFY_TOKEN=apify_api_xxxxx   (ne jamais committer ce token)" >&2
  exit 2
fi
if [ -z "$URL" ]; then
  echo "Usage: $(basename "$0") <start_url> [maxCrawlPages=20] [crawlerType] [DATACENTER|RESIDENTIAL]" >&2
  exit 2
fi

INPUT_JSON=$(URL="$URL" MAXP="$MAXP" CTYPE="$CTYPE" PGROUP="$PGROUP" python3 -c 'import json,os
# proxy AUTO -> on ne nomme aucun groupe (laisse Apify choisir, requis sur plan FREE).
proxy = {"useApifyProxy": True}
g = os.environ["PGROUP"]
if g and g.upper() != "AUTO":
    proxy["apifyProxyGroups"] = [g]
print(json.dumps({
  "startUrls": [{"url": os.environ["URL"]}],
  "maxCrawlPages": int(os.environ["MAXP"]),
  "crawlerType": os.environ["CTYPE"],
  "saveMarkdown": True,
  "proxyConfiguration": proxy,
}))')

# 1) Demarrer le run (asynchrone).
START=$(curl -sS --max-time 60 \
  -X POST "https://api.apify.com/v2/acts/${ACTOR}/runs?token=${APIFY_TOKEN}" \
  -H "Content-Type: application/json" \
  --data "$INPUT_JSON")

read -r RUN_ID DATASET_ID < <(printf '%s' "$START" | python3 -c '
import sys, json
d = json.load(sys.stdin)
if isinstance(d, dict) and d.get("error"):
    sys.stderr.write("ERREUR demarrage run: %s\n" % json.dumps(d["error"])[:400]); sys.exit(1)
data = d.get("data", {})
print(data.get("id",""), data.get("defaultDatasetId",""))
')
if [ -z "${RUN_ID:-}" ]; then
  echo "ERREUR: pas de run id renvoye par Apify." >&2; exit 1
fi
echo ">> run demarre: $RUN_ID  (crawlerType=$CTYPE, maxCrawlPages=$MAXP, proxy=$PGROUP)" >&2

# 2) Sonder le statut jusqu'a etat terminal.
WAITED=0
while :; do
  STATUS=$(curl -sS --max-time 30 \
    "https://api.apify.com/v2/actor-runs/${RUN_ID}?token=${APIFY_TOKEN}" \
    | python3 -c 'import sys,json; print(json.load(sys.stdin).get("data",{}).get("status","?"))')
  echo ">> statut: $STATUS (${WAITED}s)" >&2
  case "$STATUS" in
    SUCCEEDED) break ;;
    FAILED|ABORTED|TIMED-OUT|TIMING-OUT)
      echo "ERREUR: run termine en $STATUS." >&2; exit 1 ;;
  esac
  if [ "$WAITED" -ge "$MAX_WAIT_SECS" ]; then
    echo "ERREUR: timeout polling apres ${MAX_WAIT_SECS}s (run $RUN_ID toujours en cours)." >&2; exit 1
  fi
  sleep "$POLL_SECS"; WAITED=$((WAITED + POLL_SECS))
done

# 3) Recuperer les items du dataset (markdown).
curl -sS --max-time 120 \
  "https://api.apify.com/v2/datasets/${DATASET_ID}/items?token=${APIFY_TOKEN}&clean=true" \
  | python3 -c '
import sys, json
d = json.load(sys.stdin)
if isinstance(d, dict) and d.get("error"):
    sys.stderr.write("ERREUR dataset: %s\n" % json.dumps(d["error"])[:400]); sys.exit(1)
print("# Crawl: %d page(s)\n" % len(d))
for it in d:
    u = it.get("url") or "?"
    t = it.get("title")
    md = it.get("markdown") or it.get("text") or ""
    print("\n\n===== PAGE: %s =====" % u)
    if t: print("title: %s" % t)
    print()
    print(md)
'

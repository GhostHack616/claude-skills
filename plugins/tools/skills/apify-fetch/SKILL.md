---
name: apify-fetch
description: Récupère du contenu web fiable via Apify (qui tourne sur IP résidentielles → pas de blocage 403/YouTube). Deux usages — (1) transcript d'une vidéo/chaîne/playlist YouTube, (2) crawl d'un site entier converti en markdown propre. Use when the user shares a YouTube link and the direct transcript renvoie 403/Forbidden, ou demande "transcript fiable", "crawler ce site", "récupère tout le site en markdown", "scrape ces pages", "remplace Supadata", "crawl this site", "get the transcript via Apify". Nécessite la variable d'env APIFY_TOKEN.
allowed-tools: Bash, Read
---

# Apify Fetch — transcripts YouTube + crawl site → markdown

Remplace Supadata. Passe par l'API Apify, qui exécute le scraping depuis des **IP résidentielles** :
ça contourne le 403 que YouTube renvoie aux IP datacenter (sessions cloud/web), et les blocages anti-bot des sites.

## Pré-requis (à vérifier en premier)

Le token Apify doit être dans l'environnement. **Ne jamais l'imprimer** :

```bash
[ -n "$APIFY_TOKEN" ] && echo SET || echo MISSING
```

- Si `MISSING` : demander à l'utilisateur de faire `export APIFY_TOKEN=apify_api_...` (jamais committé).
- Le token s'utilise **uniquement** dans les appels `curl` des scripts ci-dessous, jamais en `echo`.

---

## 1) Transcript YouTube

```bash
bash "${CLAUDE_SKILL_DIR}/scripts/apify_youtube_transcript.sh" "<URL_OU_ID>" [text|json|srt|vtt]
```

- Accepte une URL/ID de **vidéo** ou **Short**, mais aussi une URL de **chaîne** ou **playlist**
  (étendue automatiquement en vidéos).
- `format` par défaut `text` (le plus lisible pour résumer/analyser). `json` ajoute les timestamps.
- Sortie : titre + langue + transcript, imprimés sur stdout. Lis-les puis réponds à la demande.
- Actor : `supreme_coder/youtube-transcript-scraper`. Coût ≈ **0,001 $ (start) + 0,0005 $ / transcript**.
- Synchrone (réponse en ~10-15 s pour une vidéo).

## 2) Crawl d'un site → markdown

```bash
bash "${CLAUDE_SKILL_DIR}/scripts/apify_crawl_site.sh" "<URL_DEPART>" [maxCrawlPages=20] [crawlerType] [proxyGroup]
```

- `maxCrawlPages` : **borne dure du budget** (défaut 20). Monte-la pour crawler tout le site.
- `crawlerType` : `playwright:adaptive` (défaut, recommandé) · `cheerio` (rapide, HTML statique) ·
  `playwright:firefox` / `playwright:chrome` (sites très JS).
- `proxyGroup` : `AUTO` (défaut) · `RESIDENTIAL` (si le site bloque). **Ne pas nommer `DATACENTER`**
  sur le plan FREE (non autorisé → erreur).
- **Asynchrone** : le script lance le run, sonde le statut, puis récupère le dataset → **pas de limite
  de 300 s**, donc OK pour un site entier. Logs de progression sur stderr.
- Sortie : pour chaque page, `===== PAGE: <url> =====` puis le markdown. Actor : `apify/website-content-crawler`.
- Coût : facturé via l'usage plateforme Apify (compute units + proxy), borné par `maxCrawlPages`.

---

## Choisir le bon `crawlerType`
- Site classique / blog / doc en HTML rendu côté serveur → `cheerio` (le plus rapide et le moins cher).
- Site qui ne s'affiche qu'avec du JS (SPA React/Vue, contenu chargé en async) → `playwright:adaptive`.
- En cas de doute, `playwright:adaptive` (le défaut) : il bascule tout seul entre HTTP brut et navigateur.

## Erreurs courantes
- `MISSING` au check token → faire `export APIFY_TOKEN=...`.
- `do not have access to proxy groups: DATACENTER` → plan FREE : laisser `proxyGroup` à `AUTO`.
- `Aucun item renvoyé` (transcript) → la vidéo n'a aucun sous-titre (ni manuel ni auto). Le dire à l'utilisateur.
- Run `FAILED`/`TIMED-OUT` (crawl) → souvent `maxCrawlPages` trop haut ou site lent ; réduire, ou passer
  `proxyGroup` à `RESIDENTIAL` si c'est un blocage anti-bot.

## Note budget (plan FREE = 5 $/mois)
Les transcripts coûtent ~0,0005 $ pièce (négligeable). Le crawl consomme du compute/proxy : toujours
borner avec `maxCrawlPages` avant de lancer un gros site, et prévenir l'utilisateur de l'ordre de grandeur.

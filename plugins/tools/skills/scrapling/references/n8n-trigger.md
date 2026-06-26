# Contenu web + transcripts YouTube depuis n8n (sans VPS)

But : récupérer le contenu d'une page web ou le transcript d'une vidéo YouTube **depuis un workflow n8n**, sans quota bloquant et **sans serveur à administrer**.

> ⚠️ Cette recette remplace une version précédente qui montait un endpoint REST FastAPI sur le VPS (Caddy + systemd). C'était de la **plomberie inutile** dans 90 % des cas, et ça ne réglait même pas YouTube (IP datacenter bloquée). Le VPS scrapling ne se justifie plus que pour les sites lourdement protégés — voir la section 3.

## TL;DR — quelle voie pour quel besoin

| Besoin | Voie | Coût | Serveur ? |
|---|---|---|---|
| Lire une page web (texte/markdown) | **Jina Reader** (`r.jina.ai/`) en nœud HTTP Request | gratuit, sans clé | non |
| Transcript YouTube, faible volume | **Supadata free** (déjà installé), 100/mois | gratuit | non |
| Transcript YouTube, gros volume | **Apify** (acteur transcript) | free 5 $/mois récurrent | non |
| Site Cloudflare/Turnstile que Jina ne passe pas | **scrapling sur le VPS** (dernier recours) | VPS + maintenance | oui |

Idée clé : tant que le **scraping web passe par Jina** (gratuit), les **100 crédits Supadata gratuits servent 100 % aux transcripts YouTube** ⇒ ≈ 100 transcripts/mois sans rien payer.

## 1. Scraping web — Jina Reader (zéro infra)

Dans n8n, un seul nœud **HTTP Request** :

- **Method** : `GET`
- **URL** : `https://r.jina.ai/{{ $json.url }}` — on préfixe simplement `r.jina.ai/` devant l'URL cible.
- **Headers** (optionnels mais recommandés) :
  - `Accept: application/json` → réponse structurée `{ code, status, data: { title, content, ... } }`
  - `x-no-cache: true` → force une lecture fraîche (sinon Jina peut renvoyer un snapshot en cache)
- **Résultat** : le contenu propre est dans `{{ $json.data.content }}` (ou le body markdown brut sans le header `Accept`).

Ça tourne sur les serveurs de Jina (proxifié), donc **marche depuis n'importe où**, et ça **rend le JavaScript** (Chrome headless, OK pour les SPA React/Vue).

**Limites honnêtes :**
- 20 req/min sans clé ; **500 req/min avec une clé gratuite** Jina (10 M tokens offerts) → passer une clé en header `Authorization: Bearer <clé>` si besoin de volume.
- **Ne contourne PAS** Cloudflare / DataDome / anti-bot. Sur un site fortement protégé → section 3.
- Tu envoies l'URL cible à un tiers (Jina) : OK pour des pages **publiques**, pas pour des URLs privées/authentifiées.

Backups gratuits sans clé (même usage, simple GET) : `https://pure.md/<URL>`, ou urltomarkdown.

Réf : [doc Jina Reader](https://jina.ai/reader/) · [repo jina-ai/reader](https://github.com/jina-ai/reader)

## 2. Transcript YouTube — service hosté (surtout pas le VPS)

**Pourquoi pas le self-host :** YouTube **bloque les IP des datacenters** (AWS, OVH, Hetzner, GCP…) → `youtube-transcript-api` et `yt-dlp` renvoient `IpBlocked`/`RequestBlocked`, aggravé par le challenge **PoToken** (2025-2026). Ça marche en local, ça casse sur un VPS. Il faut un service qui tourne sur **ses propres IP résidentielles/rotatives**.

- **Faible volume (≤ 100/mois)** → garder **Supadata free** (l'outil MCP `supadata_transcript` est déjà branché). 1 crédit/transcript, 100/mois, sans CB. Comme le web passe par Jina, ces crédits sont désormais réservés à YouTube.
- **Gros volume** → un **acteur Apify "YouTube Transcript"** appelé depuis un nœud HTTP Request n8n. Le free tier Apify (5 $ de crédit prépayé **récurrent chaque mois**, sans CB) couvre de ~100 à 1000+ transcripts selon l'acteur, et tourne sur l'infra Apify (pas de blocage d'IP).

Réf : [issue YouTube IP-block](https://github.com/jdepoix/youtube-transcript-api/issues/593) · [reco forum n8n → Apify](https://community.n8n.io/t/generate-youtube-transcript/67072)

## 3. Quand (et seulement quand) ressortir le VPS

Uniquement si Jina **échoue** sur un site derrière Cloudflare strict / Turnstile / DataDome. Là, `StealthyFetcher` de scrapling sur le VPS a une chance de passer. Mise en place du VPS : voir `remote-vps-connector.md`. **N'y va pas par défaut** : c'est 4–8 h/mois de maintenance (anti-bot qui évolue, TLS, updates) pour un cas marginal.

## Pourquoi ce choix (résumé du challenge web-sourcé)

- Jina lit les pages gratuitement, sans clé, de partout, JS inclus → le VPS+FastAPI+Caddy était inutile pour le scraping courant.
- Le VPS **ne récupère pas** les transcripts YouTube (IP datacenter bloquée) → il ne remplaçait même pas Supadata sur ce point.
- Self-host = coût déplacé vers de la maintenance continue, mauvais arbitrage pour un usage perso.

Sources : [Jina free/no-key](https://jina.ai/reader/) · [Firecrawl free 1000/mois](https://www.firecrawl.dev/pricing) · [Supadata pricing](https://supadata.ai/pricing) · [coût réel du self-hosting](https://use-apify.com/blog/self-hosting-web-scrapers-guide)

# Déclencher le scraping du VPS depuis n8n (REST)

But : appeler le VPS scrapling depuis un workflow **n8n** (« l'appli N »), pour scraper/extraire sans quota et sans dépendre de Supadata. Le VPS scrape (réseau ouvert, anti-bot), n8n l'orchestre.

## Pourquoi REST et pas le connecteur MCP existant

Le VPS expose déjà scrapling en **MCP `streamable-http`** sur `/mcp` (voir `remote-vps-connector.md`). C'est fait pour le connecteur Claude.ai. **Pour n8n, ne pas réutiliser ce `/mcp`** : c'est du JSON-RPC avec handshake `initialize` + session, pénible à reproduire dans un nœud HTTP Request. On ajoute à côté un **petit endpoint REST** que n8n appelle en **un seul nœud HTTP Request**.

> n8n a bien un nœud « MCP Client Tool », mais il est pensé pour servir d'outil à un nœud AI Agent (appel piloté par un LLM), pas pour un « scrape cette URL » déterministe. Pour un workflow fixe, REST est plus simple et plus robuste.

## Périmètre honnête (à lire avant de tout router via le VPS)

- ✅ **Scraping web / Cloudflare / SPA / login** → le VPS est la bonne réponse : gratuit, illimité, et il marche même quand la session cloud ne peut pas joindre les sites.
- ⚠️ **Transcripts YouTube** → le VPS a une **IP datacenter**, donc YouTube renvoie souvent **403** (même cause que le warning du skill `youtube-transcript`). L'endpoint `/transcript` ci-dessous est **best-effort** : s'il 403, garder **Supadata en fallback** pour ce cas précis (1 crédit/transcript, 100/mois suffit largement), ou ajouter un **proxy résidentiel** à `youtube-transcript-api` sur le VPS.

## 1. Endpoint REST sur le VPS

`/opt/scrapling-mcp/serve_rest.py` :
```python
# REST minimal pour déclencher scrapling depuis n8n (nœud HTTP Request).
import os
from typing import Optional
from fastapi import FastAPI, Header, HTTPException
from pydantic import BaseModel
from scrapling.fetchers import Fetcher, StealthyFetcher

TOKEN = os.environ["SCRAPLING_TOKEN"]  # défini dans le service systemd (jamais en clair dans le repo)
app = FastAPI()


class ScrapeReq(BaseModel):
    url: str
    mode: str = "auto"               # "basic" | "stealth" | "auto"
    selector: Optional[str] = None   # CSS optionnel, ex ".article h1::text"
    max_chars: int = 8000


def _basic(url: str):
    return Fetcher.get(url, impersonate="chrome", timeout=30)


def _stealth(url: str):
    return StealthyFetcher.fetch(
        url, headless=True, solve_cloudflare=True, timeout=60000, network_idle=True
    )


def _check(authorization: str):
    if authorization != f"Bearer {TOKEN}":
        raise HTTPException(status_code=401, detail="bad token")


@app.post("/scrape")
def scrape(req: ScrapeReq, authorization: str = Header(default="")):
    _check(authorization)

    if req.mode == "basic":
        page = _basic(req.url)
    elif req.mode == "stealth":
        page = _stealth(req.url)
    else:  # auto : Fetcher d'abord, bascule stealth si bloqué/vide
        page = _basic(req.url)
        if page.status in (403, 429, 503) or not page.get_all_text(strip=True):
            page = _stealth(req.url)

    if req.selector:
        return {"status": page.status, "url": req.url,
                "items": page.css(req.selector).getall()}
    return {"status": page.status, "url": req.url,
            "text": page.get_all_text(strip=True)[: req.max_chars]}


# --- best-effort : transcript YouTube (peut 403 sur IP datacenter) ---
class TranscriptReq(BaseModel):
    url: str
    lang: str = "fr"


@app.post("/transcript")
def transcript(req: TranscriptReq, authorization: str = Header(default="")):
    _check(authorization)
    import re
    from youtube_transcript_api import YouTubeTranscriptApi

    m = re.search(r"(?:v=|youtu\.be/|shorts/|embed/)([\w-]{11})", req.url)
    vid = m.group(1) if m else req.url  # accepte une URL ou un ID brut
    try:
        segs = YouTubeTranscriptApi.get_transcript(vid, languages=[req.lang, "en"])
    except Exception as e:  # 403 IP datacenter, vidéo sans sous-titres, etc.
        raise HTTPException(status_code=502, detail=f"transcript indispo: {e}")
    return {"video_id": vid, "text": " ".join(s["text"] for s in segs)}
```

Lancer en test :
```bash
SCRAPLING_TOKEN="un-token-long-et-aleatoire" \
  uv run --with "scrapling[fetchers]" --with fastapi --with uvicorn --with youtube-transcript-api \
  uvicorn serve_rest:app --host 127.0.0.1 --port 8011 --app-dir /opt/scrapling-mcp
```

## 2. Service systemd

`/etc/systemd/system/scrapling-rest.service` :
```ini
[Unit]
Description=Scrapling REST (pour n8n)
After=network.target

[Service]
Environment=SCRAPLING_TOKEN=change-moi-token-long-aleatoire
ExecStart=/usr/bin/env uv run --with "scrapling[fetchers]" --with fastapi --with uvicorn --with youtube-transcript-api uvicorn serve_rest:app --host 127.0.0.1 --port 8011
WorkingDirectory=/opt/scrapling-mcp
User=scrapling
Restart=on-failure

[Install]
WantedBy=multi-user.target
```
```bash
sudo systemctl daemon-reload && sudo systemctl enable --now scrapling-rest
```

## 3. Caddy : exposer /scrape et /transcript en HTTPS

Réutiliser le même sous-domaine que le MCP, en routant par chemin :
```
scrapling.tondomaine.com {
    reverse_proxy /mcp*        127.0.0.1:8000   # MCP existant (connecteur Claude.ai)
    reverse_proxy /scrape*     127.0.0.1:8011   # REST pour n8n
    reverse_proxy /transcript* 127.0.0.1:8011
}
```
Caddy gère le certificat seul. Endpoints : `https://scrapling.tondomaine.com/scrape` et `.../transcript`.

## 4. Côté n8n : nœud HTTP Request

Un seul nœud suffit :

- **Method** : `POST`
- **URL** : `https://scrapling.tondomaine.com/scrape`
- **Authentication** : Generic Credential → **Header Auth** → Name `Authorization`, Value `Bearer <ton-token>` (ne pas écrire le token en dur dans le workflow, passer par un credential n8n)
- **Send Body** : `JSON` :
  ```json
  { "url": "={{ $json.url }}", "mode": "auto" }
  ```
- **Réponse** : JSON. Le contenu scrapé est dans `{{ $json.text }}` (ou `{{ $json.items }}` si tu as passé un `selector`).

Pour un transcript : même nœud sur `/transcript`, body `{ "url": "={{ $json.url }}", "lang": "fr" }`, texte dans `{{ $json.text }}`.

## ⚠️ À confirmer en live (ne pas supposer)

1. **Sécu.** L'endpoint est public dès qu'il est derrière Caddy. Le token Bearer est le minimum ; en plus, restreindre par IP au firewall du VPS (n'autoriser que l'IP de sortie de n8n) est fortement recommandé. Ne jamais commiter le token.
2. **API scrapling.** Les flags (`solve_cloudflare`, `impersonate`, `network_idle`) viennent des templates de ce skill et de la version installée — vérifier sur la doc live de scrapling si une montée de version change la signature.
3. **YouTube depuis le VPS.** Tester `/transcript` réellement : si 403 récurrent (IP datacenter), router YouTube via Supadata (fallback) ou ajouter un proxy résidentiel.

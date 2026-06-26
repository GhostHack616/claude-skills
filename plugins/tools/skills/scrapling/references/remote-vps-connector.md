# Exposer scrapling-fetch en connecteur MCP distant (pour l'app Claude.ai / mobile)

But : héberger `scrapling-fetch-mcp` sur le VPS en **serveur MCP distant HTTPS**, pour l'ajouter comme **connecteur personnalisé** dans Claude.ai (web + mobile). Le VPS scrape (réseau ouvert), l'app Claude l'appelle depuis n'importe où, téléphone compris.

Le serveur est en **FastMCP** : il supporte le transport `streamable-http` nativement, codé en dur sur `stdio` à l'origine. Un wrapper de quelques lignes l'expose en HTTP. Pas besoin de supergateway.

> À exécuter sur le VPS (réseau ouvert). Idéalement par le Claude Code du VPS, qui pourra vérifier les flags exacts sur la doc live et itérer. Les deux points à confirmer en live sont signalés plus bas.

## 1. Installer l'outil + les navigateurs
```bash
curl -LsSf https://astral.sh/uv/install.sh | sh        # uv si absent
uv tool install git+https://github.com/cyberchitta/scrapling-fetch-mcp
uvx --from git+https://github.com/cyberchitta/scrapling-fetch-mcp scrapling install
```
`scrapling install` télécharge des navigateurs (plusieurs centaines de Mo). Prévoir la RAM/disque.

## 2. Wrapper HTTP
`/opt/scrapling-mcp/serve_http.py` :
```python
from scrapling_fetch_mcp.mcp import mcp

mcp.settings.host = "127.0.0.1"
mcp.settings.port = 8000
mcp.run(transport="streamable-http")   # endpoint servi sur /mcp
```
Lancer (dans l'environnement où le package est installé) :
```bash
uv run --with scrapling-fetch-mcp python /opt/scrapling-mcp/serve_http.py
```

## 3. Service systemd (reste up)
`/etc/systemd/system/scrapling-mcp.service` :
```ini
[Unit]
Description=Scrapling Fetch MCP (streamable-http)
After=network.target

[Service]
ExecStart=/usr/bin/env uv run --with scrapling-fetch-mcp python /opt/scrapling-mcp/serve_http.py
Restart=on-failure
User=scrapling
WorkingDirectory=/opt/scrapling-mcp

[Install]
WantedBy=multi-user.target
```
```bash
sudo systemctl daemon-reload && sudo systemctl enable --now scrapling-mcp
```

## 4. HTTPS public via Caddy
DNS : pointer un sous-domaine (ex: `scrapling.tondomaine.com`) vers le VPS.
`Caddyfile` :
```
scrapling.tondomaine.com {
    reverse_proxy 127.0.0.1:8000
}
```
Caddy gère le certificat tout seul. L'endpoint MCP devient `https://scrapling.tondomaine.com/mcp`.

## 5. Ajouter le connecteur dans Claude.ai
Réglages → Connecteurs → Ajouter un connecteur personnalisé → URL `https://scrapling.tondomaine.com/mcp`. Une fois connecté, depuis le web ou le tél : "récupère le contenu de cette page", "trouve les mentions de X sur cette URL". Deux outils exposés : fetch de page (avec pagination) et extraction par regex, en 3 niveaux (basic / stealth / max-stealth).

## ⚠️ Deux points à confirmer en live (ne pas supposer)
1. **Auth / exposition.** Ce MCP n'implémente pas OAuth. Les connecteurs Claude.ai s'attendent souvent à de l'OAuth ou un endpoint ouvert. Tant que l'auth n'est pas en place, l'endpoint est **public** : au minimum, utiliser un sous-domaine/chemin non devinable, restreindre par IP (firewall VPS) ou ajouter une couche d'auth devant Caddy, et ne pas l'exposer largement. Durcissement propre = mettre un proxy OAuth devant (à faire dans un second temps).
2. **Plan Claude.ai.** Les connecteurs personnalisés distants nécessitent un plan payant (Pro/Max/Team/Enterprise selon l'offre du moment) et la fonctionnalité peut s'appeler différemment. Vérifier dans tes réglages que "connecteur personnalisé / custom connector" est dispo sur ton compte.

## Déclencher depuis n8n
Ce connecteur MCP est fait pour l'app Claude.ai. **Pour n8n, tu n'as en général PAS besoin de ce VPS** : le scraping web courant passe par Jina Reader (gratuit, sans clé) et les transcripts YouTube par Supadata/Apify, le tout en simple nœud HTTP Request. Le VPS scrapling ne sert que de dernier recours pour les sites Cloudflare/Turnstile que Jina ne passe pas. Détail et arbitrage → `n8n-trigger.md`.

## Rappel
Pour Claude Code (terminal/app), pas besoin de tout ça : le skill `scrapling` (ce dossier) suffit, ou la config stdio Claude Desktop (`uvx scrapling-fetch-mcp`). Le serveur distant ne sert que pour l'app web/mobile.

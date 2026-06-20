# Source de vérité upstream

Ce skill est un wrapper léger FR, adapté de `Cedriccmh/claude-code-skill-scrapling` (MIT), lui-même basé sur la lib **`D4Vinci/Scrapling`** (Karim Shoair).

Pour tout ce qui dépasse le cœur (crawl/Spider, adaptive scraping, MCP server, rotation de proxy, signatures d'API détaillées), la doc officielle fait foi. Ne pas réinventer ici, aller voir l'upstream et ne ramener que la conclusion utile.

| Besoin | Ici | Upstream (doc officielle Scrapling) |
|---|---|---|
| Page statique simple | `templates/basic_fetch.py` / CLI quick path | `docs/cli/extract-commands.md`, `docs/fetching/static.md` |
| Cloudflare / WAF | `templates/stealth_cloudflare.py` | `docs/fetching/stealthy.md` |
| SPA / rendu JS | DynamicFetcher (générer depuis basic_fetch) | `docs/fetching/dynamic.md` |
| Login HTTP + multi-pages | `templates/session_login.py` | `docs/fetching/sessions.md` |
| Parsing HTML seul | `templates/parse_only.py` | `docs/parsing/*` |
| Crawl / Spider | hors scope ici | `docs/spiders/*` |
| Adaptive scraping | hors scope ici | `docs/parsing/adaptive.md` |
| MCP server | hors scope ici | `docs/ai/mcp-server.md` |
| Rotation proxy / blocage | garde-fou seulement | `docs/spiders/proxy-blocking.md` |

Repo lib : https://github.com/D4Vinci/Scrapling
Skill source : https://github.com/Cedriccmh/claude-code-skill-scrapling

# Mémoire de Claude — repo claude-skills

> Fichier lu automatiquement à chaque session. Le garder **court**. Les détails longs vont dans `notes/`.

## L'utilisateur
- Parle **français**. **Veut des réponses TRÈS concises**, droit au but. (Pas de pavés.)
- Bosse sur des skills + automatisations IA (Claude Code, n8n, MCP).

## Projets & contexte
- **`claude-skills`** : marketplace de skills (plugins `tools` / `productivity` / `lemlist`).
- **Scraping** : pile retenue = **Scrapling** + **Apify** (= Crawlee). Ordre quand un fetch échoue : read-API plateforme → Scrapling normal → Scrapling stealth (Cloudflare) → Apify/Firecrawl. Maillon faible = skill `website-scraper` (requests basique).
- **Higgsfield motion-site** : réalisable (MCP réel + Claude code le site, pas de skill magique). **En pause, à reprendre.**

## Décisions
- Mémoire = ce fichier `CLAUDE.md` (auto-chargé). Pas de hook pour l'instant.

## Leçons (à enrichir)
- _(rien encore)_

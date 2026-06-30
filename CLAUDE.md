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
- Cible = **cloud / Claude Code web** (pas local Obsidian).

## Système mémoire (cloud)
- Ce fichier s'auto-charge à chaque session = ma mémoire. **Doit vivre sur `main`** pour se recharger (les sessions web ouvrent `main`).
- **Règle de capture** : en fin de session utile → je mets à jour ce fichier (Leçons / décisions) puis **commit + push**. Le stop-hook rappelle de committer.
- Détails longs → dossier `notes/` (lu à la demande), pas ici. Garder ce fichier **court**.
- En web : pas d'Obsidian/MCP local → « déposer une source » = committer un fichier dans le repo.

## Leçons (à enrichir)
- _(rien encore)_

# Mémoire de Claude — repo claude-skills

> Fichier lu automatiquement à chaque session. Garder **court**. **Contexte repo uniquement** — la mémoire perso complète vit dans le repo cerveau **privé** de l'utilisateur (pas ici : repo public).

## L'utilisateur (minimum)
- Parle **français**. **Veut des réponses TRÈS concises**, droit au but.

## Ce repo
- Marketplace **publique** de skills (plugins `tools` / `productivity` / `lemlist`).
- Maillon faible connu : skill `website-scraper` (requests basique, lâche sur Cloudflare).

## Décisions
- **Mémoire perso + notes → repo privé dédié** (multi-repos ; ici on ne garde que le contexte du repo).
- **Scraping** : pile actée = **Scrapling + Apify** (=Crawlee). Escalade quand un fetch échoue : read-API plateforme → Scrapling normal → Scrapling stealth (Cloudflare) → Apify/Firecrawl.
- Obsidian : écarté pour l'instant (cloud-first) ; le pattern raw/→wiki marche sur de simples fichiers git.

## Leçons
- **X/Twitter** : scraping direct bloqué (fingerprint navigateur) même quand curl passe → toujours read-API : `api.fxtwitter.com/<user>/status/<id>`, et `threadreaderapp.com/thread/<id>.html` pour dérouler un fil. Les « articles » X longs sont dans le JSON fxtwitter (`tweet.article`).

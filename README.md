# claude-skills

**La source de vérité de mes skills Claude.** Ce dépôt centralise tous les skills (méthodes, playbooks, outils) et sert de base aux autres repos (RomainPro, repos clients). Un skill = un dossier avec un `SKILL.md`.

> Règle d'or : un skill ne vit qu'**ici**. Les autres repos en reçoivent une **copie**. On ne modifie jamais un skill dans un repo consommateur sans le répercuter ici, sinon ça drifte.

---

## Index des skills

### Plugin `productivity` (8 skills) — mes skills perso
| Skill | Rôle |
|---|---|
| `analyse-pertinence` | Récupère le contenu d'une URL (vidéo YouTube ou site) via Apify, puis juge s'il est **pertinent pour moi** (profil growth/outbound) et comment le réutiliser. Grille 5 axes + verdict 🟢/🟡/🔴. Requiert `APIFY_TOKEN`. |
| `brainstorm` | Brainstorm structuré : interrogatoire serré de grill-me (1 question à la fois, hypothèses challengées, réponse recommandée) + flux design de superpowers (contexte, 2-3 approches, design section par section, doc validé). Pour idées code ET business/growth. |
| `malt-workflow` | Workflow Malt à 2 modes. **Offre** : va chercher l'offre dans Gmail, lit profil + stats (RomainPro), juge le fit, produit la réponse Malt + un email de renfort, ou un dossier de ranking si hors cible. **Profil** : audite le compte Malt (titre, mots-clés, description, TJM) et sort un plan de modif en cas de disette ou sur demande. S'optimise via les journaux win-loss + changements de profil. |
| `malt-response` | Playbook de réponse Malt gagnante (méthode pure, vendeuse, objectif = décrocher l'entretien). |
| `write-like-me` | Réécrit dans ma voix (anti-IA, zéro tiret cadratin). **Contient `voice-profile.md` = la source de vérité de ma voix.** |
| `grill-me` | Stress-test d'un plan par interview serré. |
| `handoff` | Compacte une conversation en doc de passation. |
| `write-a-skill` | Aide à écrire un nouveau skill proprement. |

### Plugin `lemlist` (38 skills) — librairie GTM / outbound
ICP, sourcing, copywriting cold email & LinkedIn, campaign design, benchmarking, hygiène CRM, automatisation n8n. Source : l3mpire/claude-skills (MIT), moins le skill spécifique Claap.

### Plugin `tools` (3 skills)
- `youtube-transcript` : lit le transcript d'une vidéo YouTube en texte brut (sans clé API, mais bloqué en 403 sur IP datacenter).
- `apify-fetch` : récupération web fiable via Apify (IP résidentielles → pas de 403). Deux usages : transcript YouTube (vidéo/chaîne/playlist) et crawl d'un site entier → markdown propre. **Remplace Supadata.** Requiert la variable d'env `APIFY_TOKEN`.
- `scrapling` : scraping web via la lib Scrapling (arbre de décision Fetcher, bypass Cloudflare, sessions login, parsing HTML). Requiert un réseau ouvert (local/VPS), pas un sandbox web bridé. Adapté de Cedriccmh/claude-code-skill-scrapling (MIT).

### `bulldozer/` (10 skills bruts, hors plugin)
5 Meta Ads + 5 Google Ads (B2B paid acquisition). Cloné depuis la page Notion publique de Bulldozer Collective. Non packagés en plugin.

---

## Comment un autre repo s'en sert

Il y a **deux mécanismes**, et ils ne marchent pas dans les mêmes contextes. À ne pas confondre.

### 1. Vendoring dans `.claude/skills/` — **le seul fiable en web**
Copier le dossier du skill dans `RomainPro/.claude/skills/<skill>/`. Au démarrage d'une session (CLI **et** web), Claude charge les skills présents là. C'est la méthode utilisée pour RomainPro.

```
RomainPro/
└── .claude/
    └── skills/
        ├── malt-workflow/
        ├── malt-response/
        └── write-like-me/   (avec voice-profile.md)
```

Les zips prêts à déposer sont dans `dist/`.

### 2. Marketplace de plugins — **CLI local seulement**
Ce repo est aussi une marketplace (`.claude-plugin/marketplace.json`). En **CLI local** :

```
/plugin marketplace add GhostHack616/claude-skills
/plugin install productivity@ghosthack-skills
```

ou via `.claude/settings.json` (`extraKnownMarketplaces` + `enabledPlugins`).

> ⚠️ **Vérifié : la marketplace déclarée dans `settings.json` ne se charge PAS de façon fiable dans Claude Code on the web.** Pour le web, utiliser le vendoring (méthode 1). La marketplace reste le catalogue propre et partageable + la source de vérité versionnée.

---

## Flux de mise à jour (zéro drift)

1. Tout changement (skill ou voix) se fait **ici**, sur `master`.
2. Pour la voix / l'écriture : un seul fichier, `plugins/productivity/skills/write-like-me/voice-profile.md`. `malt-workflow` et `malt-response` ne font que le référencer.
3. On régénère le zip dans `dist/`, on le redépose dans le repo consommateur (qui écrase l'ancienne copie).
4. On ne modifie jamais la copie dans RomainPro sans backporter ici.

---

## Données privées vs méthode

- **Les skills = la méthode** (public, ce repo). Aucun chiffre client, aucune preuve, aucun secret dedans.
- **Mes données = profil, preuves, stats, activité** (privé, RomainPro). Lues par les skills à l'exécution, jamais commitées ici.

Ex : `malt-workflow` lit `RomainPro/stats/` (modèles fournis dans `plugins/productivity/skills/malt-workflow/references/repopro-stats-templates/`), mais ces fichiers remplis restent dans RomainPro.

---

## Install local (CLI, par machine)

```bash
git clone git@github.com:GhostHack616/claude-skills.git ~/claude-skills
cd ~/claude-skills && ./install.sh
```

`install.sh` symlinke les dossiers de skills (`bulldozer/`, `tools/`) dans `~/.claude/skills/`. Idempotent.

## Conventions

- Un skill = un dossier nommé exactement comme le `name:` du frontmatter.
- Frontmatter minimum : `name`, `description` (description riche en déclencheurs).
- Sous-dossiers optionnels : `references/`, `scripts/`, `assets/`.
- Voir `AUDIT.md` pour les notes qualité par skill.

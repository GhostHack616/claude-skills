# claude-skills

Personal Claude Code skill library + **plugin marketplace**. One skill = one folder with `SKILL.md`.

Two ways to consume it:
- **Marketplace (recommandé, multi-repo)** : ce repo est une marketplace de plugins. N'importe quel autre repo peut piocher dedans via son `.claude/settings.json` — voir [Marketplace](#marketplace-de-plugins).
- **Symlink local** : `install.sh` symlinke les skills `bulldozer/`, `noelse/`, `tools/` dans `~/.claude/skills/`.

## Structure

```
claude-skills/
├── .claude-plugin/
│   └── marketplace.json          # Déclare la marketplace "ghosthack-skills"
├── plugins/
│   └── lemlist/                  # Plugin: 37 skills GTM/outbound (source lemlist, MIT)
│       ├── .claude-plugin/plugin.json
│       └── skills/<37 skills>/SKILL.md
├── bulldozer/                    # Skills publiés par Bulldozer Collective (bruts)
│   ├── meta-ads/                 # 5 skills B2B Meta Ads
│   │   ├── creative-analyzer/
│   │   ├── audience-builder/
│   │   ├── hook-optimizer/
│   │   ├── asc-auditor/
│   │   └── ad-copy/
│   └── google-ads/               # 5 skills B2B Google Ads
│       ├── shopping-feed/
│       ├── pmax-auditor/
│       ├── negative-keywords/
│       ├── rsa-generator/
│       └── search-terms/
├── noelse/                       # Forks/customs adaptés au contexte Noelse
└── tools/                        # Skills techniques transverses (n8n, pipedrive, etc.)
```

## Marketplace de plugins

Ce repo expose un plugin **`lemlist`** (37 skills GTM/outbound : ICP, sourcing, copywriting cold email & LinkedIn, campaign design, benchmarking, n8n…).

### Brancher la marketplace sur un autre repo (par client)

Dans le repo client, crée `.claude/settings.json` :

```json
{
  "extraKnownMarketplaces": {
    "ghosthack-skills": {
      "source": { "source": "github", "repo": "GhostHack616/claude-skills" }
    }
  },
  "enabledPlugins": { "lemlist@ghosthack-skills": true }
}
```

Au démarrage d'une session Claude Code sur ce repo (CLI ou web), les skills se chargent
automatiquement. Tu peux ensuite les appeler avec `/<nom-du-skill>` (ex: `/outbound-analyst`)
ou laisser Claude les déclencher tout seul.

### Installer la marketplace à la main (par machine)

```
/plugin marketplace add GhostHack616/claude-skills
/plugin install lemlist@ghosthack-skills
```

## Install (any machine)

```bash
git clone git@github.com:GhostHack616/claude-skills.git ~/claude-skills
cd ~/claude-skills
./install.sh
```

`install.sh` symlinks chaque dossier de skill dans `~/.claude/skills/<skill-name>/`. Idempotent — relancer après chaque pull update les liens.

## Conventions

- Un skill = un dossier nommé exactement comme la valeur `name:` du frontmatter
- Frontmatter minimum : `name`, `description`
- Sous-dossiers optionnels par skill : `references/`, `scripts/`, `data/`
- Pas de fork dans `bulldozer/` — toute adaptation custom va dans `noelse/`

## Source

`bulldozer/` cloné depuis la page Notion publique [Skills Claude — B2B Paid Acquisition by Bulldozer](https://www.notion.so/bulldozer-collective/1420a2e7fb2441f4b2daa03af3ade655) (extracted 2026-04-28).

## Skills audit

Voir `AUDIT.md` pour notes / flags / quality grading par skill.

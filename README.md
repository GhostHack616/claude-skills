# claude-skills

Personal Claude Code skill library. One skill = one folder with `SKILL.md`. Symlinked into `~/.claude/skills/` via `install.sh`.

## Structure

```
claude-skills/
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

# claude-skills

**La source de vérité de mes skills Claude.** Ce dépôt centralise tous les skills (méthodes, playbooks, outils) et sert de base aux autres repos (RepoPro, repos clients). Un skill = un dossier avec un `SKILL.md`.

> Règle d'or : un skill ne vit qu'**ici**. Les autres repos en reçoivent une **copie**. On ne modifie jamais un skill dans un repo consommateur sans le répercuter ici, sinon ça drifte.

---

## Index des skills

### Plugin `productivity` (6 skills) — mes skills perso
| Skill | Rôle |
|---|---|
| `malt-workflow` | Workflow Malt de bout en bout : va chercher l'offre dans Gmail, lit profil + stats (RepoPro), juge le fit, produit la réponse Malt + un email de renfort, ou un dossier de ranking si hors cible. S'optimise via un journal win-loss. |
| `malt-response` | Playbook de réponse Malt gagnante (méthode pure, vendeuse, objectif = décrocher l'entretien). |
| `write-like-me` | Réécrit dans ma voix (anti-IA, zéro tiret cadratin). **Contient `voice-profile.md` = la source de vérité de ma voix.** |
| `grill-me` | Stress-test d'un plan par interview serré. |
| `handoff` | Compacte une conversation en doc de passation. |
| `write-a-skill` | Aide à écrire un nouveau skill proprement. |

### Plugin `lemlist` (38 skills) — librairie GTM / outbound
ICP, sourcing, copywriting cold email & LinkedIn, campaign design, benchmarking, hygiène CRM, automatisation n8n. Source : l3mpire/claude-skills (MIT), moins le skill spécifique Claap.

### Plugin `tools` (1 skill)
`youtube-transcript` : lit le transcript d'une vidéo YouTube en texte brut.

### `bulldozer/` (10 skills bruts, hors plugin)
5 Meta Ads + 5 Google Ads (B2B paid acquisition). Cloné depuis la page Notion publique de Bulldozer Collective. Non packagés en plugin.

---

## Comment un autre repo s'en sert

Il y a **deux mécanismes**, et ils ne marchent pas dans les mêmes contextes. À ne pas confondre.

### 1. Vendoring dans `.claude/skills/` — **le seul fiable en web**
Copier le dossier du skill dans `RepoPro/.claude/skills/<skill>/`. Au démarrage d'une session (CLI **et** web), Claude charge les skills présents là. C'est la méthode utilisée pour RepoPro.

```
RepoPro/
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
4. On ne modifie jamais la copie dans RepoPro sans backporter ici.

---

## Données privées vs méthode

- **Les skills = la méthode** (public, ce repo). Aucun chiffre client, aucune preuve, aucun secret dedans.
- **Mes données = profil, preuves, stats, activité** (privé, RepoPro). Lues par les skills à l'exécution, jamais commitées ici.

Ex : `malt-workflow` lit `RepoPro/stats/` (modèles fournis dans `plugins/productivity/skills/malt-workflow/references/repopro-stats-templates/`), mais ces fichiers remplis restent dans RepoPro.

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

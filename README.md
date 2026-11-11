# claude-skills

**La source de vérité de mes skills Claude.** Ce dépôt centralise tous les skills (méthodes, playbooks, outils) et sert de base aux autres repos (RomainPro, repos clients). Un skill = un dossier avec un `SKILL.md`.

> Règle d'or : un skill ne vit qu'**ici**. Les autres repos en reçoivent une **copie**. On ne modifie jamais un skill dans un repo consommateur sans le répercuter ici, sinon ça drifte.

---

## Architecture : 6 blocs, 48 skills

Rangé par thème, dans l'ordre du travail sur un client. Un bloc = un plugin = un zip dans `dist/`.

| Bloc | Plugin | Skills | Sert à |
|---|---|---|---|
| 1. Stratégie | `gtm-strategy` | 8 | Quoi vendre, à qui, combien ça pèse |
| 2. Outbound | `lemlist` | 11 | Trouver les comptes et leur écrire |
| 3. Pub payante | `paid-ads` | 11 | Meta et Google Ads |
| 4. CRM et automatisation | `revops` | 3 | n8n, doublons, pipe |
| 5. Outils web | `tools` | 3 | Scraper, crawler, transcripts |
| 6. Perso et méta | `productivity` | 12 | Malt, voix, brainstorm, écrire des skills |

> Règle : **tout skill du repo vit dans un plugin** déclaré dans `.claude-plugin/marketplace.json`. Pas de dossier de skills hors `plugins/`. Avant d'en ajouter un : vérifier qu'il ne double pas un skill existant, sinon le fusionner.

### La chaîne (ce qui s'enchaîne)

Chaque skill lit les fichiers produits par les précédentes, puis propose la suivante et attend un « ok ».

```
offer-builder → icp-builder → persona-builder → [market-research · market-sizing · tam] → abm
   → list-builder (+ trigger-finder, niche-data-finder) → outbound-campaign-architect
   → cold-email-writer · linkedin-outreach · cold-call-script → copy-review → copy-lemlist
   → reply-handler → outbound-analyst → pipeline-analysis
```

- **`gtm-kickoff`** déroule toute la chaîne pour un client : il regarde ce qui existe, part de la première étape manquante, s'arrête pour validation entre chaque étape. Déclencheurs : « je démarre un client », « on en est où sur ce client ».
- **`tam`** déroule seulement la partie chiffrage : `icp-builder` → `market-sizing` → `abm`.

---

## Index des skills

### 1. `gtm-strategy` : stratégie (8)
| Skill | Rôle |
|---|---|
| `gtm-kickoff` | Chef d'orchestre du parcours client complet, de l'offre à la campagne envoyée. |
| `offer-builder` | Pourquoi les clients achètent (site, cas clients, avis), inventaire des propositions de valeur, offre sur trois niveaux et par canal. |
| `icp-builder` | ICP sur 4 dimensions + ICP négatif + grille de score sur 100. Mode deals gagnés (CRM ou CSV) ou mode hypothèse (nouveau client sans données). |
| `persona-builder` | Personas acheteurs. Mode hypothèse (depuis l'offre et l'ICP) ou mode transcripts (analyse d'appels de vente). |
| `market-research` | Étude de marché (douleurs, segments, tendances) et carte de la concurrence avec battlecard. |
| `market-sizing` | TAM / SAM / SOM : bottom-up d'abord, top-down en contrôle, SOM dérivé de la capacité commerciale. |
| `tam` | Enchaîne `icp-builder` → `market-sizing` → `abm`, un seul livrable. |
| `abm` | Tiers 1/2/3 calés sur la capacité, liste de comptes scorée, score d'engagement, règles de passage. |

### 2. `lemlist` : outbound (11)
| Skill | Rôle |
|---|---|
| `list-builder` | De l'ICP et du persona à une recherche configurée dans Lemlist : comptes, contacts, signaux. |
| `trigger-finder` | Signaux d'achat → douleur probable → angle et moment. Mode stratégique (quoi surveiller) ou tactique (un compte précis). |
| `niche-data-finder` | 3 à 5 sources de données de niche avec signal d'achat pour un segment. |
| `outbound-campaign-architect` | Structure de la séquence : canaux, étapes, délais, d'après les données lemlist. |
| `cold-email-writer` | Premier mail, séquence de 3 mails par niveau (VP, manager, IC), relances, CTA, angles de campagne. |
| `linkedin-outreach` | Angle d'attaque depuis un profil LinkedIn + séquence de 2 messages après connexion. |
| `cold-call-script` | Script d'appel à froid structuré. |
| `copy-review` | Note, audite et réécrit un mail, un message LinkedIn ou une séquence. |
| `copy-lemlist` | Remplit une campagne Lemlist multicanal par l'API (mails A/B, LinkedIn, tâches), deux brouillons avant déploiement. Skill maison, dirigeants de PME françaises. |
| `reply-handler` | Classer une réponse et écrire la bonne suite. |
| `outbound-analyst` | Comparer une campagne aux benchmarks lemlist (244K+ campagnes). |

### 3. `paid-ads` : pub payante (11)
- **Meta (8)** : `meta-ads`, `audience-architecture`, `ad-creative-brief`, `ad-creative`, `ad-creative-scorecard`, `ad-reverse-engineer`, `analytics-tracking`, `audit-paid-ads`. Copie telle quelle du plugin public Bulldozer Collective 1.8.3.
- **Google Ads (3)** : `search-terms` (termes de recherche + mots-clés négatifs), `rsa-generator`, `pmax-auditor`.

Détail et limites : [`plugins/paid-ads/README.md`](plugins/paid-ads/README.md). Notes qualité : `AUDIT.md`.

### 4. `revops` : CRM et automatisation (3)
| Skill | Rôle |
|---|---|
| `n8n` | Construire un workflow n8n importable (architecture, erreurs, logs, tests) ou déboguer une erreur. |
| `crm-duplicate-detector` | Repérer, noter et fusionner les doublons de contacts et de comptes. |
| `pipeline-analysis` | Analyse du pipe commercial avec tableau de bord interactif. |

### 5. `tools` : outils web (3)
- `scrapling` : scraping et extraction (choix du Fetcher, Cloudflare, login, pagination, export CSV). Porte l'échelle d'escalade : read-API → Scrapling → stealth → Apify. Réseau ouvert requis (local ou VPS).
- `apify-fetch` : transcripts YouTube et crawl d'un site en markdown via Apify (IP résidentielles). Demande `APIFY_TOKEN`.
- `youtube-transcript` : transcript YouTube sans clé (bloqué en 403 sur IP datacenter).

### 6. `productivity` : perso et méta (12)
| Skill | Rôle |
|---|---|
| `malt-workflow` | Workflow Malt à 2 modes (offre, profil). Va chercher l'offre dans Gmail, juge le fit, produit la réponse. |
| `malt-response` | Playbook de réponse Malt gagnante, utilisé par `malt-workflow`. |
| `write-like-me` | Réécrit dans ma voix. **Contient `voice-profile.md` = la source de vérité de ma voix.** |
| `analyse-pertinence` | Récupère une URL (vidéo ou site) via Apify et juge si elle est pertinente pour moi. Demande `APIFY_TOKEN`. |
| `brainstorm` | Idée floue → design ou plan validé (grill + 2-3 approches + doc). Grille GTM en référence. |
| `grill-me` | Stress-test d'un plan par interview serrée. |
| `handoff` | Compacte une conversation en doc de passation. |
| `write-a-skill` | Écrire un nouveau skill proprement. |
| `prompt-engineering` | Transformer un prompt brouillon en prompt prêt pour la prod. |
| `slide-deck-builder` | Document source → présentation .pptx. |
| `i-have-adhd` | Réponses mises en forme pour un lecteur TDAH. Manuel (`/i-have-adhd`). |
| `marketplace-sync-check` | Vérifie que la marketplace est bien chargée dans le repo courant. |

### Ce qui a été fusionné (11/11/2026)
68 skills → 48. Rien n'est perdu : les anciennes versions restent dans l'historique git.

| Avant | Maintenant |
|---|---|
| `icp-definer` | `icp-builder` (mode hypothèse) |
| `persona-definer`, `persona-insights-analysis` | `persona-builder` |
| `deep-company-analyser`, `value-prop-lister`, `offer-definer` | `offer-builder` |
| `market-research-edp`, `competitor-finder` | `market-research` |
| `list-builder`, `company-finder`, `people-finder` | `list-builder` |
| `trigger-finder`, `pain-identifier` | `trigger-finder` |
| `copywriting-first-touch`, `copywriting-follow-up`, `copywriting-ic-sequence`, `copywriting-manager-sequence`, `copywriting-vp-sequence`, `cta-designer`, `campaign-angle-finder` | `cold-email-writer` |
| `copywriting-analyzer`, `copywriting-refiner` | `copy-review` |
| `linkedin-outbound-angle`, `linkedin-sequence` | `linkedin-outreach` |
| `n8n-workflow-builder`, `n8n-debugger` | `n8n` |
| `website-scraper` | `scrapling` |
| `search-terms`, `negative-keywords` | `search-terms` |
| `gtm-action-thinker` | `brainstorm` (référence `gtm-lens.md`) |
| `shopping-feed` | supprimé (e-commerce, hors cible) |
| plugins `meta-ads` + `google-ads` | plugin `paid-ads` |

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

Un zip par bloc dans `dist/`, à dézipper dans `.claude/skills/` du repo consommateur :

```bash
unzip -o ~/claude-skills/dist/gtm-strategy.zip -d .claude/skills/
```

```bash
unzip -o ~/claude-skills/dist/lemlist.zip -d .claude/skills/
```

Les deux ensemble donnent toute la chaîne client (`gtm-kickoff` compris). Régénérer les zips après chaque changement : `scripts/build-dist.sh`.

### 2. Marketplace de plugins — **CLI local seulement**
Ce repo est aussi une marketplace (`.claude-plugin/marketplace.json`). En **CLI local** :

```
/plugin marketplace add GhostHack616/claude-skills
/plugin install gtm-strategy@ghosthack-skills
/plugin install lemlist@ghosthack-skills
```

Plugins disponibles : `gtm-strategy`, `lemlist`, `paid-ads`, `revops`, `tools`, `productivity`.

> ⚠️ Changement du 11/11/2026 : `meta-ads` s'appelle maintenant `paid-ads`, et les skills n8n / CRM sont passées de `lemlist` à `revops`. Dans un repo qui active des plugins par `enabledPlugins`, remplacer `meta-ads@ghosthack-skills` par `paid-ads@ghosthack-skills` et ajouter `revops@ghosthack-skills` et `gtm-strategy@ghosthack-skills`.

ou via `.claude/settings.json` (`extraKnownMarketplaces` + `enabledPlugins`).

> ⚠️ **Vérifié : la marketplace déclarée dans `settings.json` ne se charge PAS de façon fiable dans Claude Code on the web.** Pour le web, utiliser le vendoring (méthode 1). La marketplace reste le catalogue propre et partageable + la source de vérité versionnée.

---

## Flux de mise à jour (zéro drift)

1. Tout changement (skill ou voix) se fait **ici**, sur `master`.
2. Pour la voix / l'écriture : un seul fichier, `plugins/productivity/skills/write-like-me/voice-profile.md`. `malt-workflow` et `malt-response` ne font que le référencer.
3. On régénère les zips (`scripts/build-dist.sh`), on redépose celui du bloc concerné dans le repo consommateur (qui écrase l'ancienne copie).
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

`install.sh` symlinke tous les skills de `plugins/*/skills/` dans `~/.claude/skills/`. Idempotent.

## Conventions

- Un skill = un dossier nommé exactement comme le `name:` du frontmatter.
- Frontmatter minimum : `name`, `description` (description riche en déclencheurs).
- Sous-dossiers optionnels : `references/`, `scripts/`, `assets/`.
- Voir `AUDIT.md` pour les notes qualité par skill.

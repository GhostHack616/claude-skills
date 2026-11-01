# Plugin meta-ads

Copie telle quelle des 8 skills Meta du plugin public de Bulldozer Collective : dépôt `bulldozer-collective/bulldozer-claude-marketplace`, plugin `bulldozer` version 1.8.3 (commit `5bf1ec0` du 30/10/2026). Le dépôt source n'a pas de licence : le contenu reste celui de Bulldozer.

| Skill | À quoi il sert |
|---|---|
| `meta-ads` | Structure d'une campagne Meta (objectif, groupes de pub, budget, phase d'apprentissage), suivi, plan de lancement sur 30 jours |
| `audience-architecture` | Ciblage B2B traduit en audiences publicitaires : segments, sources d'audiences similaires, exclusions, synchronisation entre régies |
| `ad-creative-brief` | 5 à 10 idées de pub tirées de la proposition de valeur (16 angles passés en revue) |
| `ad-creative` | Textes de pub en variantes (titres, textes principaux, descriptions) |
| `ad-creative-scorecard` | Note d'une pub vidéo sur 8 critères, par trois profils d'experts |
| `ad-reverse-engineer` | Décortique une pub vidéo (concurrente ou inspiration) en modèle réutilisable |
| `analytics-tracking` | Suivi des conversions et des événements, UTM, plan de tracking |
| `audit-paid-ads` | Audit d'un compte publicitaire Meta, Google ou LinkedIn |

**Limite** : ces skills appellent par endroits les outils de Bulldozer OS (`bdz...`), qui demandent un compte Bulldozer. Sans ce compte, il faut leur fournir les chiffres (export du gestionnaire de publicités). Les scripts Python de `ad-creative-scorecard` et `ad-reverse-engineer` extraient des images d'une vidéo.

Ce plugin remplace, depuis le 01/11/2026, les 5 skills Meta bruts du dossier `bulldozer/meta-ads/` (tirés de la page Notion publique de Bulldozer en juin 2026, jamais branchés à un plugin).

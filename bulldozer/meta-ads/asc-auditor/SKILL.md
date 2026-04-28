---
name: asc-auditor
description: Audite les campagnes Advantage+ Shopping (ASC) Meta Ads pour détecter les fuites structurelles et corriger les misallocations de budget (souvent 20%+). Déclencher pour : "audit ASC", "Advantage+", "Advantage Shopping", "Meta ASC", "budget misallocation Meta", "structure campagne Meta".
---

# ASC Auditor — B2B Meta Ads

## Objectif
Identifier les fuites structurelles dans les campagnes Advantage+ (ASC) qui causent une misallocation de budget. En B2B, Advantage+ est souvent mal configuré : l'algorithme optimise pour le volume de conversions plutôt que la qualité pipeline, ce qui entraîne 20%+ de budget gaspillé.

## Quand utiliser ce skill
- CPA en hausse alors que le budget Advantage+ augmente
- Qualité des leads en baisse (beaucoup de MQL, peu de SQL)
- Lancement ou migration vers Advantage+
- Audit trimestriel de la structure Meta Ads

## Inputs requis

Demande à l'utilisateur :
1. **Structure de compte** : campagnes, ad sets, ads (export ou screenshot)
2. **Paramètres Advantage+** : budget cap, audience segments, existing customers cap
3. **Données de performance** : CPA, ROAS, CPL, volume conversions (30 derniers jours)
4. **Données CRM** : taux MQL→SQL, coût par SQL, pipeline généré
5. **Pixel/CAPI setup** : événements trackés, attribution window
6. **ICP et segmentation** actuelle

## Processus

### Étape 1 — Audit de la structure

| Élément | Best practice B2B | Red flag |
|---------|------------------|----------|
| **Nombre de campagnes ASC** | 1-3 max (consolider le budget) | 5+ campagnes qui se cannibalisent |
| **Budget par campagne** | Min. 50€/jour (idéal 100€+) | Sous 30€/jour = pas assez de data |
| **Existing customers cap** | Limiter à 10-20% en acquisition | Pas de cap = 50%+ du budget sur clients existants |
| **Audience segments** | Définis et bien labelisés | Aucun segment = full broad |
| **Nombre de creatives** | 5-15 par campagne | <5 = pas assez de testing, >20 = dilution |

### Étape 2 — Diagnostic des fuites de budget

#### Fuite #1 : Existing customers drain
**Symptôme** : Le CPA semble bon mais le pipeline ne suit pas
**Diagnostic** : Vérifier la répartition budget existing vs new customers
**Correction** : Mettre un cap existing customers à 10-20% max

#### Fuite #2 : Broad audience trop large
**Symptôme** : Volume de leads élevé mais taux SQL très faible
**Diagnostic** : L'algo optimise pour des profils faciles à convertir (pas nécessairement ICP)
**Correction** : Ajouter des audience segments bien définis comme signaux

#### Fuite #3 : Creative fatigue non détectée
**Symptôme** : CPM stable mais CTR en baisse progressive
**Diagnostic** : Les mêmes creatives tournent depuis trop longtemps
**Correction** : Refresh créatif toutes les 2-4 semaines, rotation active

#### Fuite #4 : Mauvais événement d'optimisation
**Symptôme** : Beaucoup de conversions mais pas de revenue
**Diagnostic** : Optimisation sur un événement trop haut de funnel (page view, lead)
**Correction** : Optimiser sur l'événement le plus proche de la valeur (SQL, démo complétée)

#### Fuite #5 : Attribution window inadaptée
**Symptôme** : Les résultats reportés ne matchent pas le CRM
**Diagnostic** : Window trop large (28 jours) gonfle artificiellement les résultats
**Correction** : 7-day click pour le B2B (cycle court), 7-day click + 1-day view pour le reste

### Étape 3 — Audit du tracking

| Élément | Vérification | Impact si défaillant |
|---------|-------------|---------------------|
| **Pixel** | Installé et fire correctement | Pas d'optimisation possible |
| **CAPI (Conversions API)** | Server-side actif | -20-30% de données avec iOS 14+ |
| **Event Match Quality** | Score > 6/10 | Mauvais signal → mauvaise optimisation |
| **Déduplication** | Pixel + CAPI ne comptent pas en double | Métriques gonflées |
| **Events** | Bons événements envoyés (Purchase/Lead/SQL) | Optimisation sur le mauvais signal |
| **Value passée** | Valeur pipeline envoyée avec l'event | Pas d'optimisation sur la valeur |

### Étape 4 — Benchmark de performance

Compare les KPIs actuels aux benchmarks B2B :

| KPI | Benchmark B2B (indicatif) | Alerte si |
|-----|--------------------------|-----------|
| **CPM** | 15-40€ | >50€ (audience trop niche ou saturée) |
| **CTR** | 0.8-2% | <0.5% (créa ou ciblage problème) |
| **CPC** | 1-5€ | >8€ (revoir ciblage + créa) |
| **CPL** | 20-80€ | >100€ (funnel ou offre à revoir) |
| **Coût/SQL** | Dépend du ACV | >15% du ACV cible |
| **MQL→SQL rate** | 15-30% | <10% (problème qualité) |

### Étape 5 — Plan de restructuration

## Format de sortie

```
## Audit ASC Meta Ads — [Date]

### Score de santé : [X/100]

| Dimension | Score | Statut |
|-----------|-------|--------|
| Structure de compte | /20 | 🔴🟡🟢 |
| Budget allocation | /25 | 🔴🟡🟢 |
| Audience & ciblage | /20 | 🔴🟡🟢 |
| Tracking & attribution | /20 | 🔴🟡🟢 |
| Créatives | /15 | 🔴🟡🟢 |

### Fuites de budget identifiées
| Fuite | Budget impacté (est.) | Correction | Priorité |
|-------|----------------------|------------|----------|

### Paramètres à modifier immédiatement
1. [Paramètre] : [Valeur actuelle] → [Valeur recommandée]
2. ...

### Structure recommandée
[Schéma de la structure optimale : campagnes, ad sets, naming]

### Roadmap d'optimisation
| Semaine | Action | KPI à monitorer |
|---------|--------|----------------|
| S1 | Corrections structurelles | CPL, impression delivery |
| S2 | Refresh créatif | CTR, CPM |
| S3 | Optimisation audiences | MQL→SQL rate |
| S4 | Analyse et itération | Coût/SQL |
```

## Règles clés
- En B2B, **toujours mettre un cap existing customers** — sinon Advantage+ cible en priorité les gens qui vous connaissent déjà (faciles à convertir mais pas d'acquisition nette)
- **Ne jamais optimiser sur des micro-conversions** (page view, add to cart) en B2B — optimiser au minimum sur Lead, idéalement sur SQL ou opportunity
- **CAPI est non-négociable** depuis iOS 14 — sans server-side tracking, 30%+ des conversions sont invisibles
- **Consolider plutôt que fragmenter** — moins de campagnes = plus de data par campagne = meilleure optimisation

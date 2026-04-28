---
name: creative-analyzer
description: Analyse les créatives Meta Ads pour isoler les angles top-performing et améliorer le CVR de +15-30%. Identifie les patterns gagnants à scaler et les fatigue créatives. Déclencher pour : "analyse créatives", "creative analyzer", "performance créa", "creative fatigue", "top-performing ads", "best ads Meta".
---

# Creative Analyzer — B2B Meta Ads

## Objectif
Analyser les performances créatives pour identifier les angles, formats et messages qui génèrent du pipeline (pas juste des clics). Isoler les patterns gagnants à scaler et détecter la fatigue créative avant qu'elle impacte les résultats.

## Quand utiliser ce skill
- Revue de performance créative (recommandé : bimensuelle)
- Préparation d'un nouveau sprint créatif
- Baisse de CVR ou hausse de CPA inexpliquée
- Besoin de prioriser les investissements créatifs

## Inputs requis

Demande à l'utilisateur :
1. **Ads Manager export** avec données par ad : impressions, reach, frequency, CTR, CPC, CPL, conversions, spend
2. **Données CRM** (si disponible) : leads par ad → MQL → SQL → pipeline
3. **Assets créatifs** : images, vidéos, carrousels utilisés (ou captures d'écran)
4. **Copy** : primary text, headline, description de chaque ad
5. **Période d'analyse** : minimum 14 jours avec suffisamment de data
6. **Objectif business** : SQL, démos, pipeline €

## Processus

### Étape 1 — Classification des créatives

Tague chaque créative selon une grille multidimensionnelle :

| Dimension | Catégories |
|-----------|-----------|
| **Format** | Image statique, Carrousel, Vidéo courte (<15s), Vidéo longue (>15s), UGC, Motion graphic |
| **Angle message** | Pain point, ROI/Résultat, Social proof, How it works, Vs concurrent, Provocateur |
| **Hook visuel** | Texte overlay, Face humaine, Data/graphique, Produit/UI, Situation, Before/After |
| **CTA** | Démo, Essai gratuit, Guide, Webinar, Audit, Contact |
| **Funnel stage** | Cold, Warm, Retargeting |
| **Ton** | Corporate, Casual, Expert, Provocateur, Éducatif |

### Étape 2 — Analyse de performance par dimension

Pour chaque dimension, calcule les KPIs moyens :

```
## Performance par format
| Format | Ads | Spend | CTR | CPC | CPL | SQL rate | Coût/SQL |
|--------|-----|-------|-----|-----|-----|----------|----------|
| Image statique | X | X€ | X% | X€ | X€ | X% | X€ |
| Carrousel | ... |
| Vidéo courte | ... |
[etc.]

## Performance par angle message
[Même structure]

## Performance par hook visuel
[Même structure]
```

### Étape 3 — Identification des winners et losers

**Critères de classification :**

| Catégorie | Critères | Action |
|-----------|---------|--------|
| **Winner** | Top 20% sur Coût/SQL ET volume suffisant (>1000 impressions) | Scaler le budget, décliner l'angle |
| **Promising** | Bon CTR + bon CVR mais faible volume | Augmenter le budget pour valider |
| **Fatigué** | Historiquement bon mais CTR en baisse (-20%+ vs peak) | Pause ou refresh |
| **Loser** | Bottom 20% sur Coût/SQL avec volume suffisant | Couper |
| **Insuffisant** | Pas assez de data pour conclure (<1000 impressions, <5 conversions) | Laisser tourner ou augmenter budget |

**Détection de fatigue créative :**
| Signal | Seuil d'alerte |
|--------|----------------|
| Frequency | >3 sur 7 jours (retargeting : >5) |
| CTR trend | Baisse de >20% vs les 2 premières semaines |
| CPM trend | Hausse de >15% à audience constante |
| Conversion rate | Baisse de >25% vs peak |

### Étape 4 — Extraction des patterns gagnants

Identifie les combinaisons format × angle × hook qui performent :

```
## Patterns gagnants identifiés

### Pattern 1 : [Nom descriptif]
- Format : [ex: Vidéo courte]
- Angle : [ex: Pain point]
- Hook : [ex: Stat choc en texte overlay]
- Ton : [ex: Direct/Provocateur]
- Performance : CTR [X]%, CPL [X]€, SQL rate [X]%
- Pourquoi ça marche : [analyse]
- Comment le décliner : [3 idées de déclinaison]

### Pattern 2 : ...
```

### Étape 5 — Recommandations pour le prochain sprint créatif

Priorise les prochaines créatives à produire :

| Priorité | Creative à produire | Basé sur | Effort | Impact estimé |
|----------|-------------------|----------|--------|---------------|
| P1 | Déclinaison du winner #1 avec nouveau hook | Pattern 1 | Faible | Fort |
| P2 | Nouveau format sur angle gagnant | Pattern 2 | Moyen | Fort |
| P3 | Test d'un nouvel angle non exploré | Gap identifié | Moyen | Incertain |

## Format de sortie

```
## Analyse Créative Meta Ads — [Période]

### Vue d'ensemble
- Créatives analysées : [X]
- Spend total : [X]€
- Winners identifiés : [X]
- Fatigués à pauser : [X]
- Losers à couper : [X]

### Top 5 créatives (par Coût/SQL)
| Rang | Ad | Format | Angle | Spend | CTR | CPL | SQL | Coût/SQL |
|------|-----|--------|-------|-------|-----|-----|-----|----------|

### Bottom 5 créatives (budget gaspillé)
| Ad | Format | Angle | Spend | CTR | CPL | SQL | Raison |

### Analyse par dimension
[Tableaux par format, angle, hook]

### Patterns gagnants
[Détail des 2-3 patterns identifiés]

### Alertes fatigue créative
| Ad | Signal | Severity | Action recommandée |

### Roadmap créative — Sprint suivant
| Priorité | Brief créatif | Format | Angle | Basé sur |
|----------|--------------|--------|-------|----------|
| P1 | ... |
| P2 | ... |
| P3 | ... |

### Budget recommandé par créative
| Creative | Budget actuel | Budget recommandé | Raison |
```

## Règles clés
- **Ne jamais juger une créative uniquement sur le CTR** — un bon CTR avec un mauvais taux SQL = budget gaspillé
- **Minimum 1000 impressions et 5 conversions** avant de tirer des conclusions
- **Le winner n'est pas la créative avec le plus de leads** — c'est celle avec le meilleur coût/SQL
- **La fatigue créative est inévitable** — prévoir un rythme de refresh de 2-4 nouvelles créatives toutes les 2 semaines
- **Un pattern gagnant se décline, il ne se copie pas** — même angle + nouveau hook = nouvelle créative

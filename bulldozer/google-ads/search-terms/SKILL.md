---
name: search-terms
description: Analyse les Search Terms Google Ads pour identifier les requêtes qui génèrent des SQL vs le bruit. Sépare les requêtes à forte valeur pipeline du trafic informationnel. Déclencher pour : "search terms", "requêtes de recherche", "analyse requêtes", "SQL queries", "quality leads Google Ads".
---

# Search Terms Analyzer — B2B Paid Acquisition

## Objectif
Analyser les rapports de search terms pour distinguer les requêtes qui génèrent des SQL (Sales Qualified Leads) de celles qui génèrent du bruit. En B2B, la majorité du volume de requêtes n'a aucune valeur pipeline — ce skill identifie les signaux de qualité.

## Quand utiliser ce skill
- Analyse hebdomadaire ou bimensuelle des search terms
- Identification des requêtes à scaler (plus de budget)
- Découverte de nouveaux mots-clés à ajouter aux campagnes
- Diagnostic d'un problème de qualité des leads

## Inputs requis

Demande à l'utilisateur :
1. **Search Terms Report** (CSV/Excel) avec : requête, impressions, clics, coût, conversions, valeur de conversion
2. **Données CRM** (si disponible) : quelles requêtes ont généré des SQL, opportunities, closed-won
3. **ICP** : persona, taille entreprise, secteur, géo
4. **Définition d'un SQL** pour ce business
5. **Campagnes actives** et leurs objectifs

## Processus

### Étape 1 — Classification des requêtes

Catégorise chaque requête selon la **matrice intention × ICP** :

```
                    ICP Match ✅         ICP Match ❌
                ┌─────────────────┬─────────────────┐
Intention       │   🟢 SCALE      │   🟡 MONITOR    │
Transactionnelle│   Budget ↑↑     │   Évaluer       │
                ├─────────────────┼─────────────────┤
Intention       │   🟡 NURTURE    │   🔴 EXCLUDE    │
Informationnelle│   Retarget only │   Négatif        │
                └─────────────────┴─────────────────┘
```

### Étape 2 — Signaux d'intention B2B

Identifie les marqueurs d'intention dans les requêtes :

**Signaux forts (intention d'achat) :**
- "logiciel", "outil", "solution", "plateforme" + secteur
- "comparatif", "vs", "alternative à [concurrent]"
- "prix", "tarif", "devis", "demo"
- "pour [taille entreprise]", "pour [secteur]"
- "[Problème spécifique] + automatiser/optimiser/réduire"

**Signaux faibles (informationnel) :**
- "c'est quoi", "définition", "comment", "pourquoi"
- "gratuit", "open source", "template"
- "cours", "formation", "tuto", "pdf"
- "emploi", "stage", "salaire", "fiche métier"

**Signaux ambigus (à analyser avec le CRM) :**
- Requêtes marque concurrente
- Requêtes génériques sectorielles
- Requêtes avec des termes métier spécifiques

### Étape 3 — Analyse de performance par cluster

Regroupe les requêtes en clusters thématiques et analyse :

| Cluster | Requêtes | Clics | Coût | Conv. | SQL | Coût/SQL | Verdict |
|---------|----------|-------|------|-------|-----|----------|---------|
| [Thème A] | X | X | X€ | X | X | X€ | SCALE/MAINTAIN/CUT |

### Étape 4 — Identification des opportunités

1. **Requêtes à scaler** : bonne conversion, bon CPA, sous-exploitées (peu d'impressions)
2. **Nouveaux keywords à ajouter** : requêtes non couvertes par les campagnes existantes mais à forte intention
3. **Requêtes à isoler** : haute performance → méritent leur propre ad group avec annonce dédiée
4. **Long tail à fort ROI** : requêtes très spécifiques avec excellent taux de conversion

### Étape 5 — Recommandations d'action

Pour chaque cluster, recommande une action concrète :

| Action | Critère | Mise en œuvre |
|--------|---------|---------------|
| **SCALE** | SQL-generating, bon CPA | Augmenter les enchères, ajouter en exact match |
| **ISOLATE** | Fort volume + fort CVR | Créer un ad group dédié avec RSA spécifique |
| **ADD** | Nouvelle requête pertinente | Ajouter comme keyword dans la bonne campagne |
| **EXCLUDE** | Hors ICP ou hors intention | Ajouter en négatif (voir skill negative-keywords) |
| **MONITOR** | Ambiguë, données insuffisantes | Laisser tourner 2 semaines, re-analyser |

## Format de sortie

```
## Analyse Search Terms — [Période]

### Vue d'ensemble
- Requêtes uniques analysées : [X]
- Requêtes SQL-generating : [X] ([X]%)
- Requêtes hors ICP : [X] ([X]%)
- Budget sur requêtes SQL-generating : [X]€ ([X]%)

### Top 10 requêtes SQL-generating
| Requête | Clics | Coût | SQL | Coût/SQL | Action |
|---------|-------|------|-----|----------|--------|

### Top 10 requêtes à exclure (budget gaspillé)
| Requête | Clics | Coût | Conv. | Raison exclusion |

### Clusters de requêtes
[Tableau par cluster avec verdict]

### Nouvelles opportunités keywords
| Requête découverte | Volume estimé | Intention | Campagne recommandée |

### Actions prioritaires
1. [Action immédiate 1]
2. [Action immédiate 2]
3. [Action immédiate 3]
```

## Règles clés
- Ne jamais juger une requête uniquement sur les conversions Google Ads — toujours croiser avec les données CRM (SQL, pipeline, revenue)
- Une requête à faible volume mais fort taux de SQL vaut plus qu'une requête à fort volume sans pipeline
- Les requêtes brand concurrent sont à traiter au cas par cas (souvent bon CTR mais mauvais taux de closing)
- Relancer l'analyse toutes les 2 semaines — les patterns changent

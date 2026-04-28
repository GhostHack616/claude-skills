---
name: pmax-auditor
description: Audite les campagnes Performance Max Google Ads pour améliorer le quality score des assets de +20-40% et réduire les CPCs. Déclencher pour : "audit PMax", "Performance Max", "asset quality", "quality score PMax", "optimiser PMax", "campagne PMax".
---

# PMax Auditor — B2B Paid Acquisition

## Objectif
Auditer les campagnes Performance Max pour identifier les faiblesses d'assets, les signaux d'audience mal configurés et les fuites de budget. Un asset quality score faible impacte directement les CPCs (+20-40% de surcoût potentiel).

## Quand utiliser ce skill
- Lancement ou refonte d'une campagne PMax
- CPCs en hausse sans raison marché identifiée
- Asset quality score sous "Best" sur plus de 50% des assets
- Taux de conversion PMax inférieur aux campagnes Search

## Processus

### Étape 1 — Collecte des données
Demande à l'utilisateur :
1. **Asset Report** complet (textes, images, vidéos avec quality ratings)
2. **Audience Signals** configurés
3. **Listing Groups** / Feed Shopping (si applicable)
4. **Search Terms Insights** (catégories de requêtes PMax)
5. **ICP** : persona cible, proposition de valeur, secteur

### Étape 2 — Audit des Assets

#### Textes (Headlines & Descriptions)
Évalue chaque asset sur :

| Critère | Score attendu | Problème fréquent |
|---------|--------------|-------------------|
| **Pertinence ICP** | Le texte parle au décideur B2B | Langage trop générique/B2C |
| **Proposition de valeur** | Bénéfice concret et mesurable | Features au lieu de outcomes |
| **CTA** | Action claire et urgente | CTA mou ("en savoir plus") |
| **Différenciation** | Unique vs concurrents | Messages interchangeables |
| **Diversité** | Variété d'angles | Répétition du même message |

Règles pour les headlines :
- Minimum 5 headlines "Best" quality
- Au moins 3 angles différents : ROI/chiffres, pain point, social proof, urgence, bénéfice
- Pas plus de 2 headlines avec le même mot-clé principal
- Au moins 1 headline avec un chiffre/preuve concrète

Règles pour les descriptions :
- Minimum 3 descriptions "Best" quality
- Chaque description = 1 angle unique
- Inclure au moins 1 description orientée objection-handling

#### Images
| Critère | Recommandation |
|---------|---------------|
| **Formats** | Au moins 3 ratios (1:1, 1.91:1, 4:5) |
| **Variété** | Produit, lifestyle, data/proof, team |
| **Qualité** | Haute résolution, pas de texte surchargé |
| **Brand** | Cohérence visuelle, logo visible |

#### Vidéos
- Au moins 1 vidéo de 15s minimum
- Format vertical + horizontal
- Hook dans les 3 premières secondes
- CTA visible dans les 5 dernières secondes

### Étape 3 — Audit des Audience Signals

Vérifie :
1. **Custom Segments** : mots-clés d'intention d'achat (pas juste awareness)
2. **Données first-party** : liste clients, converters, high-value segments
3. **Intérêts & démographie** : alignés avec l'ICP
4. **Exclusions** : segments B2C ou hors cible exclus

Problèmes fréquents :
- Audience signals trop larges (Google ignore alors les signaux)
- Pas de données first-party uploadées
- Segments custom basés sur des termes informationnels au lieu de termes transactionnels

### Étape 4 — Audit de la structure

| Élément | Best practice | Flag si |
|---------|--------------|---------|
| **Nombre d'asset groups** | 1 par persona/offre | Tout mélangé dans 1 group |
| **Budget** | Minimum 50€/jour par asset group | Sous-budget = pas d'apprentissage |
| **URL Expansion** | OFF en B2B (sauf si pages toutes optimisées) | ON par défaut = trafic sur pages hors funnel |
| **Final URL** | Landing page dédiée par asset group | Page d'accueil générique |

### Étape 5 — Output structuré

```
## Résumé de l'audit PMax

### Score global : [X/100]

| Dimension | Score | Priorité |
|-----------|-------|----------|
| Assets texte | /25 | 🔴🟡🟢 |
| Assets visuels | /25 | 🔴🟡🟢 |
| Audience Signals | /25 | 🔴🟡🟢 |
| Structure & Settings | /25 | 🔴🟡🟢 |

### Actions prioritaires (Top 5)
1. [Action] → Impact estimé : [X]
2. ...

### Assets à remplacer
| Asset actuel | Rating | Problème | Proposition de remplacement |
|-------------|--------|----------|-----------------------------|

### Assets manquants à créer
| Type | Angle | Brief créatif |

### Audience Signals — Corrections
[Détail des modifications recommandées]

### Settings à modifier
[Liste des paramètres à changer]
```

## Règles clés
- En B2B, désactiver URL Expansion sauf cas exceptionnel
- Ne jamais laisser PMax tourner sans audience signals solides (sinon Google optimise pour le volume, pas la qualité)
- Un asset "Low" quality doit être remplacé immédiatement — il tire le score global vers le bas
- Vérifier les Search Terms Insights pour détecter si PMax cannibalise les campagnes Search brand

---
name: negative-keywords
description: Audite et optimise les listes de mots-clés négatifs Google Ads pour couper 15-30% du budget gaspillé sur des requêtes hors ICP. Déclencher pour : "audit négatifs", "negative keywords", "mots-clés négatifs", "requêtes hors cible", "wasted spend", "clean up search terms".
---

# Negative Keywords Optimizer — B2B Paid Acquisition

## Objectif
Identifier et éliminer les requêtes de recherche qui génèrent des clics sans valeur pipeline. En B2B, 15 à 30% du budget Google Ads est gaspillé sur des requêtes hors ICP (mauvais persona, mauvaise intention, mauvais stade du funnel).

## Quand utiliser ce skill
- Audit périodique des search terms (recommandé : toutes les 2 semaines)
- Lancement d'une nouvelle campagne (protection préventive)
- CAC en hausse sans explication claire
- Taux de conversion landing page en baisse

## Processus

### Étape 1 — Collecte des données
Demande à l'utilisateur :
1. Export des **Search Terms Report** (derniers 30-90 jours)
2. Le **ICP** (Ideal Customer Profile) : taille d'entreprise, secteur, job titles cibles, pays
3. Les **objectifs pipeline** : SQL, démo, essai gratuit, etc.
4. Budget mensuel et CPA cible

### Étape 2 — Analyse des requêtes hors ICP
Classe chaque requête dans une des catégories suivantes :

| Catégorie | Exemple | Action |
|-----------|---------|--------|
| **Hors persona** | "gratuit", "stage", "formation", "étudiant" | Négatif exact ou phrase |
| **Hors intention** | "c'est quoi", "définition", "pdf", "cours" | Négatif phrase |
| **Concurrent direct** | Noms de concurrents (si non ciblés volontairement) | Négatif exact |
| **B2C / mauvais segment** | "particulier", "personnel", "pas cher" | Négatif phrase |
| **Géo hors cible** | Villes/pays non ciblés | Négatif exact |
| **Job title hors cible** | Rôles non décisionnaires | Négatif phrase |

### Étape 3 — Construction des listes négatives
Organise les négatifs en **listes thématiques** réutilisables :

1. **[NKW] Intent — Informationnel** : requêtes purement informationnelles sans intention d'achat
2. **[NKW] Persona — Hors ICP** : requêtes liées à des personas non ciblés
3. **[NKW] Budget — Low value** : requêtes contenant "gratuit", "pas cher", "free trial" sans valeur
4. **[NKW] Competitors** : noms de concurrents (si applicable)
5. **[NKW] Geo — Exclusions** : termes géographiques hors zone de chalandise

### Étape 4 — Recommandations de match type
- **Exact match négatif** : quand la requête spécifique est hors cible mais des variantes pourraient être pertinentes
- **Phrase match négatif** : quand tout un thème est hors cible
- **Broad match négatif** : à utiliser avec précaution, uniquement pour des termes sans ambiguïté (ex: "emploi", "stage")

### Étape 5 — Output structuré
Produis un livrable avec :

1. **Tableau de synthèse** : nombre de requêtes analysées, % identifié comme hors ICP, budget récupérable estimé
2. **Liste de négatifs par catégorie** : format CSV prêt à importer (keyword, match type, liste)
3. **Top 20 quick wins** : les 20 requêtes les plus coûteuses à bloquer immédiatement
4. **Requêtes ambiguës** : requêtes nécessitant une décision humaine (potentiellement utiles mais incertaines)

## Format de sortie

```
## Résumé de l'audit

- Requêtes analysées : [X]
- Requêtes hors ICP identifiées : [X] ([X]%)
- Budget gaspillé estimé (30j) : [X]€
- Économie projetée : [X]€/mois

## Top 20 Quick Wins
| Requête | Impressions | Clics | Coût | Conv. | Action recommandée |
|---------|-------------|-------|------|-------|--------------------|

## Listes de négatifs
### [NKW] Intent — Informationnel
[liste des keywords + match type]

### [NKW] Persona — Hors ICP
[liste des keywords + match type]

[etc.]

## Requêtes ambiguës (décision requise)
| Requête | Contexte | Recommandation |
```

## Règles clés
- Ne jamais ajouter un négatif qui pourrait bloquer une requête à forte intention d'achat
- Toujours vérifier les cross-match : un négatif dans une campagne ne doit pas bloquer une requête utile dans une autre
- Prioriser par coût : commencer par les requêtes qui brûlent le plus de budget
- Documenter chaque décision pour l'audit suivant

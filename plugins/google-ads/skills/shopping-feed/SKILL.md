---
name: shopping-feed
description: Vérifie et optimise les flux Shopping Google Ads pour réduire les erreurs de feed et gagner +5-15% d'impression share. Déclencher pour : "shopping feed", "flux produit", "Google Merchant", "feed errors", "impression share shopping", "flux shopping".
---

# Shopping Feed Checker — B2B Paid Acquisition

## Objectif
Auditer le flux de données produit (Google Merchant Center) pour identifier et corriger les erreurs qui réduisent l'impression share. En B2B, les feeds sont souvent mal optimisés car conçus pour le B2C — ce skill adapte les best practices au contexte B2B.

## Quand utiliser ce skill
- Impression share Shopping en dessous de 50%
- Nombre élevé de produits désapprouvés ou avec avertissements
- Lancement d'un feed Shopping pour une offre B2B (SaaS, services, matériel pro)
- Audit régulier (recommandé : mensuel)

## Inputs requis

Demande à l'utilisateur :
1. **Export du feed** (CSV/XML) ou accès au Google Merchant Center
2. **Rapport de diagnostics** Merchant Center (erreurs, avertissements)
3. **Catalogue produit/offre** avec positionnement et ICP
4. **Impression share actuel** et historique
5. **Pays cibles** et langues

## Processus

### Étape 1 — Audit des erreurs critiques

Vérifie les champs obligatoires et leur conformité :

| Champ | Vérification | Erreur fréquente B2B |
|-------|-------------|---------------------|
| **title** | ≤150 car., mots-clés en premier | Titre trop corporate, pas de keyword |
| **description** | ≤5000 car., riche en keywords | Description marketing au lieu de technique |
| **price** | Format correct, devise, cohérence avec LP | Prix "sur demande" non géré |
| **availability** | in_stock / out_of_stock | Non mis à jour |
| **image_link** | Haute résolution, fond blanc, pas de texte | Images trop marketing |
| **gtin/mpn/brand** | Au moins 2 identifiants sur 3 | Manquants pour produits propriétaires |
| **product_type** | Taxonomie Google respectée | Catégories custom non reconnues |
| **custom_labels** | 0-4, pour segmenter les campagnes | Non utilisés |

### Étape 2 — Optimisation des titres produit

Les titres Shopping sont le levier #1 de l'impression share.

**Structure recommandée pour le B2B :**
```
[Marque] + [Type de produit] + [Attribut clé] + [Pour qui/usage]
```

**Exemples :**
- ❌ "Solution Enterprise CRM" 
- ✅ "HubSpot CRM — Logiciel Gestion Clients pour PME B2B"
- ❌ "Pack Standard"
- ✅ "Pack Licences Microsoft 365 Business — 25 Utilisateurs"

**Règles :**
- Mot-clé principal dans les 70 premiers caractères
- Inclure la marque en premier (si marque connue) ou en dernier (si marque inconnue)
- Ajouter le use case ou le persona cible
- Ne pas utiliser de MAJUSCULES excessives ni de caractères spéciaux promotionnels

### Étape 3 — Optimisation des descriptions

| Élément | Recommandation |
|---------|---------------|
| **Longueur** | 500-1000 caractères minimum |
| **Keywords** | Intégrer les termes de recherche cibles naturellement |
| **Specs techniques** | Inclure les caractéristiques recherchées par les acheteurs B2B |
| **Bénéfices** | Lier les features aux outcomes business |
| **Formatage** | Texte brut, pas de HTML |

### Étape 4 — Stratégie de Custom Labels

Recommande une structure de custom_labels pour segmenter les campagnes Shopping :

| Label | Usage | Exemples de valeurs |
|-------|-------|-------------------|
| **custom_label_0** | Marge / priorité business | High_margin, Low_margin, Strategic |
| **custom_label_1** | Catégorie produit | Software, Hardware, Service, Accessory |
| **custom_label_2** | Cible / segment | SMB, Mid-market, Enterprise |
| **custom_label_3** | Saisonnalité / promo | Promo_Q4, Evergreen, New_launch |
| **custom_label_4** | Performance | Best_seller, Low_performer, New |

### Étape 5 — Vérification de la cohérence feed ↔ landing page

Google désapprouve les produits si le feed ne correspond pas à la page de destination :

- **Prix** : identique au centime près
- **Disponibilité** : stock réel reflété
- **Titre/image** : reconnaissable sur la LP
- **Microdata** : schema.org Product implémenté sur les LP

## Format de sortie

```
## Audit Shopping Feed — [Date]

### Score de santé du feed : [X/100]

| Dimension | Score | Détail |
|-----------|-------|--------|
| Erreurs critiques | /30 | [X] produits désapprouvés |
| Qualité des titres | /25 | [X]% optimisés |
| Qualité des descriptions | /20 | [X]% avec description complète |
| Attributs manquants | /15 | [X] champs manquants |
| Cohérence feed↔LP | /10 | [X] incohérences |

### Erreurs à corriger immédiatement
| Produit | Erreur | Impact | Correction |
|---------|--------|--------|------------|

### Titres à optimiser (Top 20)
| Titre actuel | Titre optimisé | Keywords ajoutés |

### Custom Labels recommandés
[Structure proposée]

### Impact estimé
- Impression share actuel : [X]%
- Impression share projeté : [X]% (+[X]%)
- Produits récupérés : [X]
```

## Règles clés
- En B2B, le prix "sur demande" n'est pas compatible Shopping — il faut afficher un prix ou utiliser des campagnes non-Shopping
- Les custom labels sont le meilleur levier pour allouer le budget Shopping sur les produits à plus forte marge
- Ne jamais keyword-stuff les titres — Google pénalise et l'expérience utilisateur se dégrade
- Mettre à jour le feed au minimum quotidiennement (temps réel si possible)

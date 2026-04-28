---
name: rsa-generator
description: Génère des Responsive Search Ads (RSA) optimisées pour le B2B avec un CTR supérieur de 10-25% sans copy générique. Déclencher pour : "RSA", "responsive search ads", "annonces Google Ads", "écrire des annonces", "headlines Google", "copy search ads".
---

# RSA Generator — B2B Paid Acquisition

## Objectif
Générer des Responsive Search Ads qui parlent aux décideurs B2B avec des messages spécifiques, mesurables et différenciants. Objectif : +10-25% de CTR vs les RSA génériques, avec un meilleur taux de qualification post-clic.

## Quand utiliser ce skill
- Création de nouvelles campagnes Search
- Refresh d'annonces avec Ad Strength sous "Good"
- CTR en dessous des benchmarks secteur
- Taux de conversion post-clic faible (mauvaise qualification du clic)

## Inputs requis

Demande à l'utilisateur :
1. **Mots-clés cibles** du groupe d'annonces
2. **ICP** : qui est le décideur ? (titre, taille entreprise, secteur)
3. **Proposition de valeur** : qu'est-ce qui différencie l'offre ?
4. **Preuves** : chiffres clients, logos, certifications, awards
5. **Landing page URL** (pour assurer la cohérence message)
6. **Offre/CTA** : démo, essai gratuit, audit, consultation, etc.
7. **Concurrents principaux** (pour se différencier)

## Framework de génération

### Structure des 15 Headlines (30 caractères max chacun)

Utilise la matrice suivante pour garantir diversité et pertinence :

| Slot | Angle | Exemple B2B |
|------|-------|-------------|
| H1-H2 | **Keyword match** | Reprend le mot-clé principal pour le Quality Score |
| H3-H4 | **Bénéfice mesurable** | "+30% de pipeline en 90 jours" |
| H5-H6 | **Pain point** | "Marre des leads non qualifiés ?" |
| H7-H8 | **Social proof** | "Utilisé par 500+ scale-ups B2B" |
| H9-H10 | **Différenciation** | Ce que les concurrents ne font pas |
| H11-H12 | **CTA / Offre** | "Audit gratuit en 48h" |
| H13 | **Urgence / Scarcité** | "Places limitées ce mois-ci" |
| H14 | **Brand** | Nom de la marque + positionnement court |
| H15 | **Wildcard** | Angle créatif ou saisonnier |

### Structure des 4 Descriptions (90 caractères max chacune)

| Slot | Angle | Contenu |
|------|-------|---------|
| D1 | **Value prop complète** | Bénéfice principal + preuve + CTA |
| D2 | **How it works** | Processus en 3 étapes simples |
| D3 | **Objection handling** | Répond à la principale objection (prix, complexité, temps) |
| D4 | **Social proof + CTA** | Résultat client concret + appel à l'action |

### Règles de copywriting B2B

**À FAIRE :**
- Utiliser des chiffres concrets ("+27% de conversion", "en 14 jours", "500+ clients")
- Parler le langage du décideur (ROI, pipeline, CAC, revenue)
- Inclure le mot-clé dans au moins 3 headlines (pinned en position 1 si besoin)
- Varier les formats : question, affirmation, impératif, preuve
- Tester la formule : [Résultat] + [Temporalité] + [Sans risque]

**À NE PAS FAIRE :**
- Copy générique applicable à n'importe quel secteur
- Superlatifs vides ("le meilleur", "leader", "numéro 1")
- Jargon interne non compris par le prospect
- Tous les headlines avec le même angle
- Headlines qui ne fonctionnent pas seuls (dépendants du contexte d'un autre headline)

### Pinning stratégique

| Position | Recommandation |
|----------|---------------|
| **Position 1** | Pin 2-3 headlines contenant le keyword principal |
| **Position 2** | Pin 2-3 headlines de bénéfice/différenciation |
| **Position 3** | Laisser libre (Google optimise) |

## Format de sortie

```
## RSA — [Nom du groupe d'annonces]

### Final URL : [URL]
### Display Path : [path1] / [path2]

### Headlines (15)
| # | Headline (≤30 car.) | Angle | Pin |
|---|---------------------|-------|-----|
| H1 | ... | Keyword | Pos 1 |
| H2 | ... | Keyword | Pos 1 |
| H3 | ... | Bénéfice | Pos 2 |
[etc.]

### Descriptions (4)
| # | Description (≤90 car.) | Angle |
|---|----------------------|-------|
| D1 | ... | Value prop |
[etc.]

### Ad Strength estimé : [Excellent / Good]

### Notes
- [Justification des choix de pinning]
- [Variantes à A/B tester en priorité]
```

## Règles clés
- Chaque headline doit fonctionner seul, sans dépendre d'un autre
- Chaque headline doit être unique (pas de reformulation du même message)
- Respecter strictement les limites de caractères (30 headlines, 90 descriptions)
- Toujours vérifier la cohérence avec la landing page
- Proposer au moins 2 variantes de RSA par ad group pour le testing

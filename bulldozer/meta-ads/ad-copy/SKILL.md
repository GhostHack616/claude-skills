---
name: ad-copy
description: Génère du copy Meta Ads aligné avec les buying triggers B2B (pain, ROI, proof). Produit des primary texts, headlines et descriptions optimisés pour la conversion pipeline. Déclencher pour : "ad copy Meta", "copy Facebook Ads", "texte publicitaire Meta", "écrire une pub Meta", "copy social ads B2B".
---

# Ad Copy Generator — B2B Meta Ads

## Objectif
Créer du copy publicitaire Meta Ads qui parle aux décideurs B2B en activant les bons buying triggers : douleur identifiée, ROI quantifié, preuve sociale. L'objectif n'est pas le clic — c'est le clic qualifié qui avance dans le pipeline.

## Quand utiliser ce skill
- Lancement de nouvelles campagnes Meta Ads B2B
- Refresh créatif (fatigue publicitaire, baisse du CTR)
- Test de nouveaux angles messaging
- Adaptation d'un message Search vers Social

## Inputs requis

Demande à l'utilisateur :
1. **ICP détaillé** : titre du décideur, taille entreprise, secteur, maturité digitale
2. **Pain points principaux** (top 3) : qu'est-ce qui empêche le prospect de dormir ?
3. **Proposition de valeur** : résultat concret délivré + en combien de temps
4. **Preuves** : cas clients, chiffres, logos, témoignages
5. **Offre / CTA** : démo, essai, audit, webinar, guide, consultation
6. **Ton de voix** : expert, direct, provocateur, empathique
7. **Landing page** pour vérifier la cohérence
8. **Formats créatifs prévus** : image statique, carrousel, vidéo

## Framework de génération

### Les 5 buying triggers B2B

Chaque ad copy doit activer au moins 2 de ces triggers :

| Trigger | Définition | Exemple |
|---------|-----------|---------|
| **PAIN** | Nommer la douleur spécifique du prospect | "Votre équipe sales passe 60% de son temps sur des leads non qualifiés" |
| **ROI** | Quantifier le résultat obtenu | "Nos clients réduisent leur CAC de 35% en 90 jours" |
| **PROOF** | Démontrer avec des faits | "Utilisé par Aircall, Payfit et 200+ scale-ups B2B" |
| **URGENCY** | Créer un sentiment de timing | "Les entreprises qui n'automatisent pas maintenant perdent 2-3 deals/mois" |
| **IDENTITY** | Parler à l'identité du prospect | "Les CMOs qui scalent ne font pas ça manuellement" |

### Structure du Primary Text (texte principal)

**Format court (1-3 lignes) — pour retargeting / offre directe :**
```
[Pain point en 1 ligne]
[Résultat chiffré]
[CTA]
```

**Format moyen (4-6 lignes) — pour prospection tiède :**
```
[Hook — question ou stat choc]

[Développement du pain en 2 lignes]
[Solution en 1 ligne + preuve]

[CTA + offre]
```

**Format long (7-12 lignes) — pour prospection froide / éducation :**
```
[Hook — problème universel du persona]

[Contexte — pourquoi ce problème existe]
[Conséquences — ce que ça coûte de ne rien faire]

[Solution — ce qu'on propose]
[Preuve — résultat client]
[Mécanisme — comment ça marche (3 étapes)]

[CTA + réduction de risque (gratuit, sans engagement)]
```

### Headlines (40 caractères max)

Produis 5 headlines par angle :

| Angle | Exemple |
|-------|---------|
| **Résultat** | "-35% de CAC en 90 jours" |
| **Pain** | "Assez des leads non qualifiés ?" |
| **Social proof** | "Rejoint par 500+ B2B" |
| **Offre** | "Audit gratuit — 48h" |
| **Curiosité** | "Ce que font les top 1% CMOs" |

### Descriptions (30 caractères max)

| Type | Exemple |
|------|---------|
| **CTA** | "Réservez votre démo" |
| **Bénéfice** | "Plus de pipeline, moins de bruit" |
| **Preuve** | "Noté 4.9/5 par nos clients" |

## Matrice de déclinaison

Pour chaque campagne, génère un minimum de **3 variantes** croisant :

| | Hook A (Pain) | Hook B (ROI) | Hook C (Proof) |
|---|---|---|---|
| **CTA 1 (Démo)** | Variante 1 | Variante 2 | Variante 3 |
| **CTA 2 (Guide)** | Variante 4 | Variante 5 | Variante 6 |

## Format de sortie

```
## Ad Copy Meta Ads — [Nom de la campagne]

### Contexte
- ICP : [résumé]
- Objectif : [SQL / Démo / Leads]
- Funnel stage : [Cold / Warm / Retargeting]

### Variante 1 — [Angle : Pain + ROI]
**Primary Text :**
[texte]

**Headline :** [headline]
**Description :** [description]
**CTA Button :** [Learn More / Sign Up / Book Now / Download]

---

### Variante 2 — [Angle : Proof + Urgency]
[même structure]

---

### Variante 3 — [Angle : Identity + Pain]
[même structure]

---

### Plan de test recommandé
| Semaine | Test | Variable isolée | KPI à mesurer |
|---------|------|----------------|---------------|
| S1-S2 | V1 vs V2 vs V3 | Hook (Pain vs ROI vs Proof) | CTR + CPA |
| S3-S4 | Winner + 2 CTA | CTA (Démo vs Guide) | CVR |
```

## Règles de copywriting B2B pour Meta

1. **Première ligne = tout.** Si le hook ne stoppe pas le scroll, le reste n'existe pas
2. **Pas de jargon marketing** — parler comme le prospect parle à son équipe
3. **Un message = une idée.** Pas de feature list dans une pub
4. **Les chiffres battent les adjectifs** : "35% de réduction" > "réduction significative"
5. **Le CTA doit matcher l'étape du funnel** : pas de "Achetez maintenant" en cold
6. **Tester le copy avant les visuels** — le texte drive plus de performance que l'image en B2B

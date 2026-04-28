---
name: audience-builder
description: Construit des audiences Meta Ads basées sur l'ICP B2B en exploitant les job titles, signaux d'intention et données comportementales. Déclencher pour : "audience Meta", "ciblage Meta Ads", "audience builder", "ICP targeting", "custom audience B2B", "lookalike B2B".
---

# Audience Builder — B2B Meta Ads

## Objectif
Construire des audiences Meta Ads qui reflètent l'ICP B2B réel — pas juste des intérêts génériques. Exploiter les job titles, les signaux comportementaux, les données first-party et les custom audiences pour maximiser le taux MQL→SQL.

## Quand utiliser ce skill
- Lancement de campagnes Meta Ads B2B
- Taux MQL→SQL trop faible (<15%)
- Audiences existantes saturées (CPM en hausse, volume en baisse)
- Expansion vers de nouveaux segments ICP

## Inputs requis

Demande à l'utilisateur :
1. **ICP complet** :
   - Job titles cibles (décideurs + influenceurs)
   - Taille d'entreprise (employés ou CA)
   - Secteurs d'activité
   - Géographie
   - Stack technologique (si pertinent)
2. **Données first-party disponibles** : liste clients, liste prospects CRM, visiteurs site, engagés email
3. **Historique campagnes** : audiences déjà testées et résultats
4. **Budget** : pour dimensionner la taille d'audience nécessaire
5. **Objectif** : acquisition cold, nurturing warm, retargeting hot

## Processus

### Étape 1 — Cartographie des couches d'audience

Construis la stratégie en 4 couches (du plus chaud au plus froid) :

```
┌─────────────────────────────────────┐
│ 🔴 RETARGETING (Hot)                │
│ Visiteurs site, engagés ads/email   │
│ Budget : 15-25%                     │
├─────────────────────────────────────┤
│ 🟠 LOOKALIKE (Warm)                 │
│ LAL clients, LAL SQL, LAL high-LTV  │
│ Budget : 30-40%                     │
├─────────────────────────────────────┤
│ 🟡 INTEREST + BEHAVIOR (Tepid)      │
│ Job titles + intérêts sectoriels    │
│ Budget : 20-30%                     │
├─────────────────────────────────────┤
│ 🟢 BROAD (Cold)                     │
│ Advantage+ / broad avec créa filtre │
│ Budget : 10-20%                     │
└─────────────────────────────────────┘
```

### Étape 2 — Construction des Custom Audiences

| Source | Audience | Fenêtre | Usage |
|--------|----------|---------|-------|
| **Site web** | Visiteurs pages pricing/demo | 30 jours | Retargeting hot |
| **Site web** | Visiteurs blog/resources | 90 jours | Nurturing |
| **CRM** | Clients actifs | - | Seed pour LAL + exclusion en acq |
| **CRM** | SQL des 12 derniers mois | - | Seed pour LAL (meilleur signal) |
| **CRM** | Prospects engagés non convertis | - | Retargeting |
| **Email** | Ouvreurs email 90j | - | Warm audience |
| **Meta** | Engagés page/pub 90j | 90 jours | Retargeting tepid |
| **Vidéo** | Vues 50%+ vidéo | 90 jours | Retargeting engagé |

### Étape 3 — Construction des Lookalike Audiences

**Hiérarchie des seeds (du meilleur au moins bon) :**
1. **Clients high-LTV** (meilleur signal de qualité)
2. **SQL convertis** (signal de qualification)
3. **Tous les clients** (signal correct)
4. **Leads qualifiés** (signal faible mais volume)

**Recommandations LAL :**

| Paramètre | Recommandation B2B | Pourquoi |
|-----------|-------------------|----------|
| **Taille** | 1-3% (commencer à 1%) | En B2B, l'audience est niche — au-delà de 3%, la dilution est trop forte |
| **Pays** | Pays unique (pas multi-pays) | Les patterns B2B varient par pays |
| **Seed minimum** | 1000 contacts | En dessous, le signal est trop faible |
| **Refresh** | Tous les 90 jours | Le profil client évolue |

### Étape 4 — Ciblage par intérêts et comportements

**Job titles B2B (couche d'intérêts) :**

| Niveau | Exemples | Usage |
|--------|----------|-------|
| **C-Level** | CEO, CFO, CTO, CMO, COO | Offres stratégiques, gros deals |
| **VP / Director** | VP Marketing, Director of Sales, Head of Growth | Offres mid-market |
| **Manager** | Marketing Manager, Product Manager, Sales Manager | Offres SMB / self-serve |

**Combinaison recommandée :**
```
Job title ciblé
+ Intérêt sectoriel (SaaS, Marketing Digital, Business Intelligence...)
+ Comportement (early technology adopters, business decision makers)
+ Exclusion (étudiants, job seekers, freelancers si hors ICP)
```

**Intérêts B2B à forte valeur :**
- Business decision makers (comportement Meta)
- SaaS, Cloud computing, CRM, Marketing automation
- Harvard Business Review, TechCrunch, Forbes (proxy de séniorité)
- IT decision makers, Small business owners

### Étape 5 — Exclusions stratégiques

| Exclusion | Raison |
|-----------|--------|
| **Clients actuels** (CRM list) | Ne pas payer pour acquérir des clients existants |
| **Employés** (email domain) | Éviter l'auto-ciblage |
| **Convertis récents** (pixel) | Déjà dans le pipeline |
| **Job titles hors ICP** | Étudiants, stagiaires, juniors (si non cible) |
| **Audiences retargeting** (dans les campagnes cold) | Éviter la cannibalisation |

## Format de sortie

```
## Stratégie d'audiences Meta Ads — [Nom du client/projet]

### ICP cible
[Résumé de l'ICP]

### Architecture des audiences

#### 🔴 Retargeting (Budget : [X]%)
| Audience | Source | Fenêtre | Taille estimée |
|----------|--------|---------|----------------|

#### 🟠 Lookalike (Budget : [X]%)
| Audience | Seed | Taille LAL | Pays | Taille estimée |
|----------|------|-----------|------|----------------|

#### 🟡 Interest-based (Budget : [X]%)
| Audience | Composition (AND/OR) | Taille estimée |
|----------|---------------------|----------------|

#### 🟢 Broad / Advantage+ (Budget : [X]%)
| Audience | Signaux fournis | Taille estimée |

### Exclusions
| Exclusion | Appliquée à |
|-----------|-------------|

### Plan de test
| Phase | Audiences testées | Budget | Durée | KPI |
|-------|------------------|--------|-------|-----|
| S1-S2 | LAL 1% clients vs LAL 1% SQL | [X]€ | 14j | CPA, SQL rate |
| S3-S4 | Winner + Interest stack | [X]€ | 14j | CPA, SQL rate |

### Checklist avant lancement
- [ ] Custom audiences uploadées et matchées (>60% match rate)
- [ ] Lookalikes créées et prêtes
- [ ] Exclusions appliquées à toutes les campagnes cold
- [ ] Pixel + CAPI fonctionnels
- [ ] UTM tracking configuré
```

## Règles clés
- **Les données first-party sont le meilleur signal** — toujours commencer par les LAL basées sur les clients/SQL avant les intérêts
- **En B2B, une audience trop large = des leads non qualifiés** — mieux vaut un CPM plus élevé sur la bonne audience qu'un CPM faible sur tout le monde
- **Exclure systématiquement les clients** des campagnes d'acquisition — c'est le gaspillage #1 en B2B sur Meta
- **Le créatif est le premier filtre** — même sur une audience broad, un message qui parle à un CMO B2B ne sera cliqué que par des CMOs B2B
- **Refresh les seeds de LAL** tous les trimestres — votre base client évolue, vos audiences doivent suivre

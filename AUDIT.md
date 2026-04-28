# Bulldozer Skills — Audit

Audit réalisé 2026-04-28 sur les 10 SKILL.md récupérés depuis la page Notion publique de Bulldozer Collective.

## Verdict global

Kit marketing bien structuré, pas une bibliothèque battle-tested. Structure consistante (frontmatter → Objectif → Inputs → Processus → Output → Règles), Claude-friendly, drop-in fonctionnel. Plusieurs problèmes de méthodologie et incohérences internes à connaître avant usage en prod.

## Notes par skill

| Skill | Note | Problème principal |
|-------|------|---|
| `meta-ads/creative-analyzer` | A− | Le meilleur — taxonomie multi-dim solide |
| `meta-ads/audience-builder` | B | LAL-first (30-40% du budget) — conflit avec strat Noelse "no LAL" + globalement daté |
| `meta-ads/hook-optimizer` | A− | 7 types de hooks bien définis, framework de scoring exploitable |
| `meta-ads/asc-auditor` | C+ | **Erreur terminologique** : ASC = Advantage+ Shopping (e-commerce). Le contenu décrit Advantage+ Lead Campaigns. Mauvais nom = mauvaises recos en prod |
| `meta-ads/ad-copy` | B+ | "Description 30 caractères max" est faux (Meta ≠ Google Ads short desc) |
| `google-ads/shopping-feed` | C | **Hors-sujet pour B2B SaaS**. Shopping = retail. Inutile pour Noelse, lemlist, scale-ups SaaS |
| `google-ads/pmax-auditor` | B+ | Standard, pas de fausse note |
| `google-ads/negative-keywords` | B+ | Solide mais simple, recouvre Search Terms |
| `google-ads/rsa-generator` | B+ | Char limits corrects (30/90), bonne matrice de slots |
| `google-ads/search-terms` | B | Overlap fort avec Negative Keywords — auraient dû être un seul skill |

## Issues critiques

### 1. ASC Auditor mal nommé
ASC (Advantage+ Shopping Campaigns) requiert un product feed. Pour B2B lead-gen, ça n'existe pas. Meta a Advantage+ Audience et Advantage+ Lead Campaigns. Le contenu du skill mélange les deux. À renommer/reformuler dans un fork `noelse/advantage-plus-auditor`.

### 2. Audience Builder LAL-heavy ↔ strat Noelse
Le skill recommande LAL = 30-40% du budget. Or pour Noelse la décision est "jamais de LAL" (CAPI + Conversion Leads only). Importé tel quel, ce skill produit des recos en contradiction avec la doctrine. À fork dans `noelse/audience-builder-no-lal`.

### 3. Shopping Feed Checker hors-sujet
Le reste du kit cible B2B SaaS lead-gen (SQL, MQL, pipeline). Shopping n'a aucun sens pour ce contexte. Skill installé brut pour référence mais à ne pas déclencher en prod sur Noelse.

## Issues structurelles

- **Promesses chiffrées non mesurables** : chaque skill annonce +15-30% CVR, +20-40% quality score, etc. Aucun ne définit la baseline ni la mesure post-application. Numbers = marketing copy.
- **Benchmarks B2B donnés comme universels** (CPM 15-40€, CPL 20-80€, MQL→SQL 15-30%). Varient par secteur.
- **Pas de garde-fou anti-hallucination** : si l'user lance le skill sans data, rien n'empêche le modèle d'inventer des chiffres dans le format de sortie.

## Pour Noelse spécifiquement

**À utiliser tel quel (7)** : creative-analyzer, hook-optimizer, ad-copy, negative-keywords, rsa-generator, search-terms, pmax-auditor

**À forker dans `noelse/` avant prod** : audience-builder, asc-auditor

**À skip en prod** : shopping-feed (installé pour ref uniquement)

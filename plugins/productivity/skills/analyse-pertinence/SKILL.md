---
name: analyse-pertinence
description: Récupère le contenu d'une URL (vidéo YouTube ou site web) via Apify, puis juge s'il est pertinent POUR ROMAIN (freelance growth/outbound) et comment le réutiliser. Use when Romain partage un lien et demande "c'est pertinent pour moi ?", "ça vaut le coup ?", "analyse cette vidéo/ce site pour moi", "veille", "je dois lire ça ?", "résume et dis-moi si c'est utile", "is this relevant for me", ou colle une URL en attendant un verdict d'utilité (pas juste un résumé). Nécessite la variable d'env APIFY_TOKEN.
allowed-tools: Bash, Read
---

# Analyse de pertinence

But : transformer une URL en **verdict d'utilité pour Romain**, pas en simple résumé. On récupère le
contenu réel (transcript YouTube ou markdown du site) via Apify, puis on le juge contre son profil et
on dit **quoi en faire**.

## Étape 1 — Récupérer le contenu (Apify, IP résidentielles → pas de 403)

D'abord vérifier le token (ne JAMAIS l'imprimer) :
```bash
[ -n "$APIFY_TOKEN" ] && echo SET || echo MISSING
```
Si `MISSING` → demander à Romain de faire `export APIFY_TOKEN=apify_api_...` et s'arrêter là.

Puis récupérer le contenu (le script auto-détecte YouTube vs site) :
```bash
bash "${CLAUDE_SKILL_DIR}/scripts/fetch_content.sh" "<URL>" [maxCrawlPages=25]
```
- URL YouTube (vidéo/Short/chaîne/playlist) → transcript texte.
- Autre URL → crawl du site → markdown (borné par `maxCrawlPages`).
- Si le skill `apify-fetch` est déjà installé, ses scripts font la même chose ; ce script est inclus ici
  pour que `analyse-pertinence` reste autonome une fois vendoré seul.

Lis tout le contenu renvoyé sur stdout avant de juger.

## Étape 2 — Juger la pertinence (contre le profil de Romain)

**Profil de référence (à mobiliser pour le verdict) :** freelance / consultant **growth & outbound B2B**.
Sujets cœur :
- **Cold email / outbound** (lemlist) : séquences, délivrabilité, reply rate, ICP, copywriting.
- **Paid acquisition B2B** : Meta Ads & Google Ads, lead gen, CPL, créa, audiences.
- **Growth / GTM** pour scale-ups & SaaS B2B : funnel, MQL→SQL, pipeline.
- **Marketing automation** (n8n) + stack data, et **IA appliquée au marketing**.
- Clients types : **SaaS / scale-ups B2B** qui veulent du RDV qualifié.

> Si `voice-profile.md` (skill `write-like-me`) est présent dans le repo, le lire pour affiner le profil
> et caler le ton des éventuelles suggestions de contenu.

Noter le contenu sur ces 5 axes (chacun 0-2, total /10) :
1. **Fit thématique** — touche-t-il un sujet cœur de Romain ?
2. **Actionnable** — y a-t-il des méthodes, frameworks, chiffres réutilisables (clients ou contenu) ?
3. **Nouveauté** — apporte-t-il du neuf vs ce qu'un growth senior sait déjà, ou c'est du déjà-vu ?
4. **Angle d'usage** — exploitable en : veille · repurposing (LinkedIn/newsletter) · argument/preuve client · idée de lead magnet ?
5. **Signal business** — la source (chaîne, boîte, site) est-elle un **prospect** ou un acteur de son écosystème ?

## Étape 3 — Rendre le verdict (format imposé)

```
🎯 Verdict : 🟢 Pertinent / 🟡 Partiel / 🔴 Pas pertinent   (score X/10)

Pourquoi (2-4 puces, ancrées dans le contenu réel, avec citations courtes) :
- …

Angle d'usage recommandé : <veille | repurposing | argument client | lead magnet | prospect | rien>

À faire (max 3, concret) :
1. …
```
Règles de sortie :
- **Citer le contenu** (preuves), pas des généralités. Si un chiffre/méthode est réutilisable, le sortir tel quel.
- Si verdict 🔴, le dire franchement et **ne pas inventer** un angle pour sauver les meubles.
- Si tu proposes une réutilisation (post LinkedIn, idée newsletter), l'écrire **dans la voix de Romain** :
  pro/sobre, concret, **zéro tiret cadratin**, zéro superlatif creux, pas d'AI tells (cf. `write-like-me`).

## Notes
- Coût Apify : transcript ≈ 0,0005 $ ; crawl borné par `maxCrawlPages` (plan FREE suffit).
- Pour un gros site, monter `maxCrawlPages` ; prévenir Romain de l'ordre de grandeur avant de lancer.
- Erreur `DATACENTER` (proxy) sur plan FREE : le script laisse déjà Apify choisir le proxy (rien à faire).

---
name: hook-optimizer
description: Optimise les hooks des publicités Meta Ads pour améliorer le scroll-stop rate. Les 3 premières secondes déterminent jusqu'à 50% de la performance d'une pub. Déclencher pour : "hook", "scroll-stop", "accroche pub", "première seconde", "thumb-stop", "hook rate", "attention Meta Ads".
---

# Hook Optimizer — B2B Meta Ads

## Objectif
Optimiser les 3 premières secondes des publicités Meta Ads (vidéo et statique) pour maximiser le scroll-stop rate. En B2B, les décideurs scrollent vite — le hook doit capter l'attention, qualifier l'audience et créer la curiosité en un instant. Les 3 premières secondes = jusqu'à 50% de la performance globale.

## Quand utiliser ce skill
- Scroll-stop rate (ThruPlay/Impressions) sous 25%
- Hook rate (3s video views / impressions) sous 30%
- Nouvelles créatives à produire (brief les hooks en amont)
- A/B test spécifique sur les hooks

## Inputs requis

Demande à l'utilisateur :
1. **Créatives actuelles** : vidéos ou images avec performance (impressions, 3s views, CTR)
2. **ICP** : persona, douleurs, langage utilisé
3. **Message principal** de la campagne
4. **Format** : vidéo (durée), image statique, carrousel
5. **Hook rate actuel** (3-second video views / impressions)
6. **Benchmarks internes** (si disponibles)

## Framework : Les 7 types de hooks B2B

### Pour les vidéos (3 premières secondes)

| Type de hook | Mécanique | Exemple B2B | Quand l'utiliser |
|-------------|-----------|-------------|------------------|
| **Stat choc** | Chiffre surprenant qui remet en question une croyance | "80% de votre budget Google Ads ne touche pas votre ICP" | Cold audience, awareness |
| **Question pain** | Question directe sur une douleur connue | "Combien de leads dans votre CRM ne répondront jamais ?" | Cold/Warm, qualification |
| **Contraste** | Before/After ou comparaison visuelle | "Votre funnel actuel vs ce qu'il devrait être" | Warm audience |
| **Provocation** | Affirmation contre-intuitive | "Arrêtez de chercher plus de leads. Vous en avez trop." | Cold, thought leadership |
| **Social proof immédiat** | Résultat client dès la première seconde | "Comment [Client] a divisé son CAC par 3 en 90 jours" | Warm/Retargeting |
| **Pattern interrupt** | Élément visuel ou sonore inattendu | Texte qui apparaît en premier, visuel décalé, son spécifique | Cold, saturation publicitaire |
| **Identification** | Interpeller directement le persona | "Si vous êtes CMO d'une scale-up B2B, cette pub est pour vous" | Cold, qualification par le hook |

### Pour les images statiques (premier regard)

| Élément | Optimisation |
|---------|-------------|
| **Texte overlay** | Max 5-7 mots, lisible en 1 seconde, contraste fort |
| **Visuel principal** | 1 focal point, pas de surcharge |
| **Hiérarchie** | Le hook textuel se lit AVANT le visuel |
| **Couleur** | Contraste avec le feed (éviter blanc/bleu Facebook) |
| **Format** | 1:1 ou 4:5 (plus de surface dans le feed) |

### Pour les carrousels (première slide)

La slide 1 = le hook. Elle doit :
- Poser une question ou promettre un résultat
- NE PAS donner la réponse (créer le swipe)
- Être lisible sans zoom
- Avoir un design cohérent avec les slides suivantes (continuité visuelle)

## Processus d'optimisation

### Étape 1 — Diagnostic du hook actuel

Évalue chaque créative sur 5 critères :

| Critère | Score /5 | Évaluation |
|---------|----------|-----------|
| **Clarté** | Le message est compris en <2 secondes | |
| **Pertinence ICP** | Le hook parle spécifiquement au persona cible | |
| **Émotion** | Le hook provoque une réaction (surprise, curiosité, frustration) | |
| **Différenciation** | Le hook se distingue du reste du feed | |
| **Qualification** | Le hook filtre naturellement l'audience (les non-ICP ne cliquent pas) | |

**Score total /25 :**
- 20-25 : Excellent — optimiser à la marge
- 15-19 : Bon — tester des variantes
- 10-14 : Moyen — réécrire le hook
- <10 : Faible — refonte complète

### Étape 2 — Génération de hooks alternatifs

Pour chaque créative, produis **5 hooks alternatifs** en utilisant 5 types différents :

```
## Créative : [Nom/ID]

Hook actuel : "[hook actuel]"
Score : [X]/25
Hook rate : [X]%

### Alternatives proposées

| # | Type | Hook | Score estimé |
|---|------|------|-------------|
| 1 | Stat choc | "[nouveau hook]" | /25 |
| 2 | Question pain | "[nouveau hook]" | /25 |
| 3 | Provocation | "[nouveau hook]" | /25 |
| 4 | Social proof | "[nouveau hook]" | /25 |
| 5 | Identification | "[nouveau hook]" | /25 |

Recommandation : Tester le hook #[X] en priorité car [raison]
```

### Étape 3 — Optimisation vidéo frame par frame

Pour les vidéos, analyse les 3 premières secondes :

| Seconde | Contenu actuel | Problème | Recommandation |
|---------|---------------|----------|----------------|
| 0-1s | [quoi] | [problème] | [correction] |
| 1-2s | [quoi] | [problème] | [correction] |
| 2-3s | [quoi] | [problème] | [correction] |

**Règles vidéo B2B :**
- Seconde 0-1 : Le hook visuel ou textuel doit être immédiat (pas de logo, pas d'intro)
- Seconde 1-2 : Développer le hook — ajouter le contexte minimal
- Seconde 2-3 : Transition vers la promesse — pourquoi rester ?
- Le son NE DOIT PAS être nécessaire (85% des utilisateurs ont le son off)
- Sous-titres obligatoires si quelqu'un parle

### Étape 4 — Plan de test A/B des hooks

| Test | Variante A | Variante B | Variable isolée | Durée | Budget | KPI |
|------|-----------|-----------|----------------|-------|--------|-----|
| Test 1 | Hook actuel | Hook Stat choc | Hook uniquement | 7j | [X]€ | Hook rate, CTR |
| Test 2 | Winner test 1 | Hook Question pain | Hook uniquement | 7j | [X]€ | Hook rate, CTR |

**Règles de test :**
- Isoler UNE seule variable (le hook) — même copy, même audience, même CTA
- Minimum 1000 impressions par variante avant conclusion
- Mesurer le hook rate (3s views / impressions) ET le CTR (un bon hook sans clic = curiosité sans intent)
- Un hook gagnant doit avoir +20% de hook rate vs le contrôle pour être significatif

## Format de sortie

```
## Audit & Optimisation des Hooks — [Date]

### Diagnostic
| Créative | Hook actuel | Hook rate | CTR | Score /25 | Verdict |
|----------|------------|-----------|-----|-----------|---------|

### Hooks optimisés
[Pour chaque créative : 5 alternatives avec scores]

### Top 3 hooks à tester en priorité
1. [Hook] — Type : [X] — Créative : [X] — Raison : [X]
2. ...
3. ...

### Plan de test
| Semaine | Test | Variantes | Budget | KPI cible |
|---------|------|-----------|--------|-----------|

### Quick wins visuels
[Recommandations sur le texte overlay, la couleur, le format]

### Benchmarks de référence
| Metric | Actuel | Cible | Top performers secteur |
|--------|--------|-------|----------------------|
| Hook rate (3s) | [X]% | [X]% | 30-45% |
| Scroll-stop rate | [X]% | [X]% | 25-35% |
| CTR | [X]% | [X]% | 1-2.5% |
```

## Règles clés
- **Le hook doit qualifier, pas juste attirer** — un hook viral qui attire des non-ICP augmente le CTR mais détruit le coût/SQL
- **Pas de logo en première seconde** — personne ne stoppe son scroll pour un logo
- **Texte > visuel en B2B** — les décideurs réagissent aux mots (pain, résultats) plus qu'aux visuels esthétiques
- **Tester les hooks AVANT de produire les vidéos complètes** — faire des variantes de hook sur la même vidéo est 10x moins cher que refaire tout le contenu
- **Le hook image = les 5-7 premiers mots du texte overlay** — pas le visual background
- **Un bon hook polarise** — s'il ne fait réagir personne, il ne fait stopper personne non plus

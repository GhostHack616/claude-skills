---
name: search-terms
description: Analyse les termes de recherche Google Ads pour séparer les requêtes qui génèrent des SQL du bruit, puis en tire les listes de mots-clés négatifs prêtes à importer (catégories, type de correspondance, quick wins). Sert à scaler les bonnes requêtes, trouver de nouveaux mots-clés et couper le budget gaspillé sur des requêtes hors ICP. Déclencher pour "search terms", "termes de recherche", "requêtes de recherche", "analyse requêtes", "SQL queries", "quality leads Google Ads", "audit négatifs", "negative keywords", "mots-clés négatifs", "requêtes hors cible", "wasted spend", "budget gaspillé", "clean up search terms". Ne pas utiliser pour écrire des annonces (rsa-generator) ni pour auditer Performance Max (pmax-auditor).
---

# Search Terms : requêtes à garder, requêtes à exclure (B2B)

## Objectif
Lire le rapport des termes de recherche pour distinguer les requêtes qui génèrent des SQL (Sales Qualified Leads) de celles qui font du bruit, puis bloquer le bruit avec des mots-clés négatifs. En B2B, la majorité du volume de requêtes n'a aucune valeur pipeline, et 15 à 30 % du budget Google Ads part sur des requêtes hors ICP (mauvais persona, mauvaise intention, mauvais stade du funnel).

## Quand l'utiliser
- Revue des termes de recherche toutes les 2 semaines.
- Lancement d'une campagne (liste de négatifs en protection préventive).
- Problème de qualité des leads, CAC en hausse sans explication, taux de conversion de la landing page en baisse.
- Recherche de requêtes à scaler ou de nouveaux mots-clés à ajouter.

## Inputs
Demander à l'utilisateur ce qui manque :
1. **Rapport des termes de recherche** (CSV ou Excel, 30 à 90 derniers jours) : requête, impressions, clics, coût, conversions, valeur de conversion.
2. **Données CRM** si elles existent : quelles requêtes ont donné des SQL, des opportunités, des deals gagnés.
3. **ICP** : persona et intitulés de poste cibles, taille d'entreprise, secteur, pays.
4. **Définition d'un SQL** et objectifs pipeline (SQL, démo, essai gratuit...).
5. **Campagnes actives** et leurs objectifs, budget mensuel, CPA cible.

## Partie 1 : analyser les requêtes

### Étape 1 : classer chaque requête (intention × ICP)
| | ICP : oui | ICP : non |
|---|---|---|
| **Intention transactionnelle** | SCALE : plus de budget | MONITOR : à évaluer |
| **Intention informationnelle** | NURTURE : retargeting seulement | EXCLUDE : négatif |

### Étape 2 : repérer les signaux d'intention
**Signaux forts (intention d'achat) :**
- "logiciel", "outil", "solution", "plateforme" + secteur
- "comparatif", "vs", "alternative à [concurrent]"
- "prix", "tarif", "devis", "demo"
- "pour [taille d'entreprise]", "pour [secteur]"
- [problème précis] + "automatiser", "optimiser", "réduire"

**Signaux faibles (informationnel) :**
- "c'est quoi", "définition", "comment", "pourquoi"
- "gratuit", "open source", "template"
- "cours", "formation", "tuto", "pdf"
- "emploi", "stage", "salaire", "fiche métier"

**Signaux ambigus (à trancher avec le CRM) :**
- requêtes sur la marque d'un concurrent
- requêtes génériques du secteur
- requêtes avec des termes métier précis

### Étape 3 : performance par cluster
Regrouper les requêtes par thème, puis juger chaque cluster :

| Cluster | Requêtes | Clics | Coût | Conv. | SQL | Coût/SQL | Verdict |
|---|---|---|---|---|---|---|---|
| [Thème A] | X | X | X € | X | X | X € | SCALE / MAINTAIN / CUT |

### Étape 4 : opportunités
1. **Requêtes à scaler** : bonne conversion, bon CPA, peu d'impressions.
2. **Nouveaux mots-clés** : requêtes à forte intention pas encore couvertes par les campagnes.
3. **Requêtes à isoler** : très bonne performance, méritent leur propre groupe d'annonces avec une annonce dédiée.
4. **Longue traîne rentable** : requêtes très précises avec un excellent taux de conversion.

### Étape 5 : une action par cluster
| Action | Critère | Mise en œuvre |
|---|---|---|
| **SCALE** | Génère des SQL, bon CPA | Monter les enchères, ajouter en exact match |
| **ISOLATE** | Fort volume + fort taux de conversion | Groupe d'annonces dédié avec RSA spécifique (skill `rsa-generator`) |
| **ADD** | Nouvelle requête pertinente | L'ajouter comme mot-clé dans la bonne campagne |
| **EXCLUDE** | Hors ICP ou hors intention | Passer en négatif (partie 2) |
| **MONITOR** | Ambiguë, pas assez de données | Laisser tourner 2 semaines, puis réanalyser |

## Partie 2 : construire les négatifs

### Étape 6 : ranger les requêtes à exclure
| Catégorie | Exemple | Action |
|---|---|---|
| **Hors persona** | "gratuit", "stage", "formation", "étudiant" | Négatif exact ou expression |
| **Hors intention** | "c'est quoi", "définition", "pdf", "cours" | Négatif expression |
| **Concurrent direct** | Noms de concurrents (s'ils ne sont pas ciblés exprès) | Négatif exact |
| **B2C / mauvais segment** | "particulier", "personnel", "pas cher" | Négatif expression |
| **Géo hors cible** | Villes ou pays non ciblés | Négatif exact |
| **Poste hors cible** | Rôles non décisionnaires | Négatif expression |

### Étape 7 : listes thématiques réutilisables
1. **[NKW] Intent : Informationnel** : requêtes purement informationnelles, sans intention d'achat.
2. **[NKW] Persona : Hors ICP** : requêtes liées à des personas non ciblés.
3. **[NKW] Budget : Low value** : requêtes avec "gratuit", "pas cher", "free trial" sans valeur.
4. **[NKW] Competitors** : noms de concurrents (si applicable).
5. **[NKW] Geo : Exclusions** : termes géographiques hors zone ciblée.

### Étape 8 : type de correspondance
- **Exact négatif** : la requête précise est hors cible, mais ses variantes peuvent être utiles.
- **Expression négative** : tout un thème est hors cible.
- **Large négatif** : avec précaution, seulement pour des termes sans ambiguïté ("emploi", "stage").

## Format de sortie
```
## Analyse Search Terms : [Période]

### Vue d'ensemble
- Requêtes uniques analysées : [X]
- Requêtes qui génèrent des SQL : [X] ([X] %)
- Requêtes hors ICP : [X] ([X] %)
- Budget sur requêtes qui génèrent des SQL : [X] € ([X] %)
- Budget gaspillé estimé (30 j) : [X] € | Économie projetée : [X] €/mois

### Top 10 requêtes qui génèrent des SQL
| Requête | Clics | Coût | SQL | Coût/SQL | Action |

### Clusters de requêtes
[Tableau par cluster avec verdict]

### Nouvelles opportunités de mots-clés
| Requête découverte | Volume estimé | Intention | Campagne recommandée |

### Top 20 quick wins à bloquer (les plus coûteuses)
| Requête | Impressions | Clics | Coût | Conv. | Raison | Action recommandée |

### Listes de négatifs
#### [NKW] Intent : Informationnel
[mots-clés + type de correspondance]
#### [NKW] Persona : Hors ICP
[mots-clés + type de correspondance]
[etc.]

### Requêtes ambiguës (décision requise)
| Requête | Contexte | Recommandation |

### Actions prioritaires
1. [Action immédiate 1]
2. [Action immédiate 2]
3. [Action immédiate 3]
```
En plus : les négatifs dans un **CSV prêt à importer** (mot-clé, type de correspondance, liste).

## Règles clés
- **Ne jamais juger une requête sur les seules conversions Google Ads.** Toujours croiser avec le CRM (SQL, pipeline, revenu).
- Une requête à faible volume mais fort taux de SQL vaut plus qu'une requête à gros volume sans pipeline.
- **Ne jamais ajouter un négatif qui peut bloquer une requête à forte intention d'achat.** En cas de doute : requête ambiguë, décision humaine.
- Vérifier les effets croisés : un négatif dans une campagne ne doit pas bloquer une requête utile dans une autre.
- Requêtes sur la marque d'un concurrent : au cas par cas (souvent bon CTR, mauvais taux de closing). Négatif seulement si on ne les cible pas exprès.
- Prioriser par coût : commencer par les requêtes qui brûlent le plus de budget.
- Ne jamais inventer un chiffre : budget gaspillé et économie se calculent sur le rapport fourni.
- Documenter chaque décision pour la revue suivante. Relancer l'analyse toutes les 2 semaines : les motifs changent.

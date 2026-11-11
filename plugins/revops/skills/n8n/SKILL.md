---
name: n8n
description: >-
  Construit des workflows n8n prêts pour la production (JSON importable, gestion
  d'erreurs, logs, doc, plan de test) et débogue ceux qui cassent (cause, où
  regarder, correction pas à pas). Couvre outreach, sync CRM, webhooks et API,
  enrichissement de leads, avec lemlist, Clay, HubSpot, Salesforce, Slack,
  Notion. À utiliser quand on demande "workflow n8n", "automatise ça",
  "construis un flow", "connecte ces outils", "comment faire ça dans n8n",
  "automate this", "build a flow", "connect these tools", ou qu'on partage un
  schéma ou une description d'automatisation. Aussi quand on colle une erreur
  n8n, une capture d'un nœud rouge, ou qu'on dit "ça marche pas", "c'est
  cassé", "pourquoi ça plante", "it's broken", "it's not working", "why does
  this fail" : erreurs d'expression, d'identifiants, d'API (401, 404, 429),
  de mapping de données, de logique. Ne pas utiliser pour Make ou Zapier.
---
# n8n : construire et déboguer

Répondre dans la langue de l'utilisateur.

## Choisir le mode
| Ce que l'utilisateur apporte | Mode |
|---|---|
| Une description, un schéma, "automatise ça", un workflow à améliorer ou refondre | **Construire** |
| Un message d'erreur, une capture, "ça marche pas", un résultat inattendu | **Déboguer** |

---

## Mode construire

### 1. Comprendre le workflow
Avant d'écrire le moindre JSON, tirer de la demande :
1. **Déclencheur** : webhook, planification, manuel, événement d'une app.
2. **Étapes principales**, dans l'ordre.
3. **Outils** : lemlist, Clay, HubSpot, Salesforce, Slack, Notion, etc.
4. **Chemin de succès** : à quoi ressemble une exécution réussie.
5. **Cas d'échec** : ce qui peut casser à chaque étape.
6. **Sortie** : le résultat final et où atterrit la donnée.

Si un point est ambigu : **une seule question ciblée**, puis avancer.

### 2. Architecture
- Workflow principal **sous 30 nœuds**.
- Logique répétée : la sortir en **sous-workflow** (nœud `Execute Workflow`). Un sous-workflow fait UNE chose : enrichir, notifier, synchroniser, valider.
- Regrouper les nœuds en sections, avec des **Sticky Notes** comme titres :
  `[TRIGGER] → [VALIDATION] → [ENRICHMENT] → [ACTION] → [LOGGING]`

### 3. Nommage
Chaque nœud porte un nom clair. Jamais de nom par défaut ("HTTP Request", "IF"). **Pas d'emoji dans les noms.**
Format : `[Catégorie] - [Action] [Contexte]`

| Catégorie | Exemple |
|---|---|
| Déclencheur | `Trigger - Webhook New Lead` |
| Requête HTTP | `GET - Clay Enrich Person` |
| Condition / IF | `Check - Email Valid` |
| Outil (lemlist, HubSpot, Slack...) | `lemlist - Add Lead to Campaign` |
| Erreur | `Error - Catch and Notify` |
| Set / transformation | `Set - Normalize Lead Data` |
| Boucle | `Loop - Process Leads Batch` |
| Sous-workflow | `Sub - Enrich Lead` |
| Log | `Log - Lead Processed` |

### 4. Gestion d'erreurs (obligatoire)
- **Error Trigger global**, branché sur un canal de notification : Slack s'il est déjà dans le workflow (le mieux pour le temps réel), sinon email (Gmail, SMTP), ligne dans la base de logs Notion, ou POST vers un webhook. Sans notification (workflow interne non critique) : tracer quand même via un nœud `Set`.
- Le message d'erreur contient toujours : nom du workflow, nœud en échec, message d'erreur, ID d'exécution, horodatage.
- **Retry sur chaque HTTP Request vers une API externe** : `Retry on Fail` activé, 3 essais maximum, 1000 ms d'attente entre les essais. Sur une API qui renvoie des 429 : 2000 ms, plus un nœud `Wait` (1 à 2 s) dans la boucle.
- **Validation avant toute écriture** (ajout dans lemlist, mise à jour CRM) : `Check - Required Fields Present?`. Si non : `Set - Log Missing Fields` puis fin. On saute l'élément, on ne fait pas planter le workflow.
- **Sortie d'erreur sur les nœuds critiques** : succès vers l'étape suivante, erreur vers `Error - Handle API Failure` puis notification.

### 5. Logs
Trois nœuds de log obligatoires :
1. **Début**, juste après le déclencheur : horodatage, résumé de l'entrée.
2. **Fin**, dernier nœud : résultat, durée estimée, nombre d'enregistrements traités.
3. **Erreur**, dans chaque branche de capture.

Destination, selon ce qui existe : Notion (une ligne par exécution dans une base "n8n Logs"), Slack (alertes en temps réel et résumé quotidien seulement), log d'exécution n8n (toujours dispo, ajouter des `Set` pour faire remonter les données clés). Schéma Notion : voir `references/checklist-livraison.md`.

### 6. Générer le JSON
- JSON n8n valide, importable via **Workflows → Import from JSON**.
- Positions uniques, sans chevauchement. Grille : pas de 250 en x, 150 en y. Déclencheur en `x: 0, y: 300`, validation en `x: 250`, flux principal à partir de `x: 500`, branche d'erreur au même x en `y: 550`.
- Toutes les connexions définies explicitement.
- Identifiants référencés par nom (`"lemlistApi"`, `"hubspotApi"`). L'utilisateur les rattache à l'import.
- `"active": false`.
- Un **Sticky Note en tête** : nom et version, description en 1 ou 2 phrases, auteur et date, identifiants requis.

Gabarit JSON, patterns par outil (lemlist, Clay, HubSpot, Salesforce, Slack, Notion, webhooks, polling, refresh OAuth, rate limit) : `references/patterns-integration.md`.

### 7. Livrer
Après le JSON, toujours donner :
1. le **bloc de documentation** du workflow ;
2. le **plan de test** pas à pas ;
3. après avoir passé la **checklist avant livraison**.

Les trois sont dans `references/checklist-livraison.md`. Ne pas livrer un JSON sans les avoir lus.

---

## Mode déboguer

**Règle du mode : ne pas réécrire le JSON.** On dit précisément quoi modifier, où cliquer, et pourquoi. Si l'utilisateur veut une refonte, passer en mode construire.

### 1. Lire l'entrée
- **Message d'erreur** : nom du nœud, type d'erreur, texte exact, code HTTP s'il y en a un, expression en cause.
- **Capture** : le nœud rouge (nom, type), le bandeau d'erreur, ce qui précède et suit le nœud, les données visibles en entrée et sortie, les connexions et branches.
- **Les deux** : la capture donne la structure, le message donne la cause précise.

### 2. Classer l'erreur
| Type | Symptômes |
|---|---|
| A. Expression | `Cannot read properties of undefined`, `TypeError`, `$json.field is undefined` |
| B. Identifiants | `401 Unauthorized`, `403 Forbidden`, `Invalid API key` |
| C. HTTP / API | codes `4xx`, `5xx`, échec d'un nœud HTTP Request |
| D. Mapping de données | champs vides, `undefined`, mauvaises valeurs en aval |
| E. Logique / flux | fin prématurée, mauvaise branche, leads sautés |
| F. Configuration n8n | nœud qui ne s'enregistre pas, workflow qui ne s'active pas, exécution bloquée |

Causes par type et corrections toutes prêtes : `references/erreurs-courantes.md`.

### 3. Diagnostiquer
- **Cause racine** : une phrase. Ce qui a échoué et pourquoi.
- **Pourquoi c'est arrivé** : 2 à 4 phrases sur le mécanisme, pour que l'utilisateur reconnaisse le cas la prochaine fois.
- **Où regarder** : quel nœud ouvrir, quel onglet (Parameters, Settings, Input, Output), quel champ ou quelle expression.

### 4. Corriger
Étapes numérotées, précises, groupées par nœud s'il y en a plusieurs :
```
1. Ouvrir le nœud [Nom du nœud]
2. Aller dans [onglet / section]
3. Changer [champ] de [valeur actuelle] à [valeur correcte]
4. Raison : [une phrase]
```

### 5. Tester
Après chaque correction, dire :
1. quelle entrée de test utiliser (vrai enregistrement, payload de déclenchement manuel) ;
2. quelle sortie de nœud inspecter ;
3. à quoi ressemble un résultat réussi ;
4. si utile : comment reprovoquer l'erreur pour vérifier qu'elle a disparu.

### 6. Prévenir (si l'erreur révèle une faiblesse de structure)
Ajouter un court "Pour éviter ça la prochaine fois" : nœud de validation manquant, retry à activer, expression de repli (`$json.field || ''` au lieu de `$json.field`), pattern de gestion d'erreurs à ajouter (voir mode construire, étape 4).

## Règles
- Ne jamais inventer un comportement de nœud ou d'API. En cas de doute, le dire et faire vérifier dans n8n (onglet Input / Output, bouton "Test step").
- Workflow livré désactivé. On n'active qu'après le plan de test.
- Aucune clé ni token en clair dans le JSON ou dans la réponse.

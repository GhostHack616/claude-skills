# Erreurs n8n : causes par type et corrections toutes prêtes

## Causes par type

### A. Expression
Symptômes : `Cannot read properties of undefined`, `null`, `TypeError`, `$json.field is undefined`
- Le champ n'existe pas dans l'élément courant.
- `$json` utilisé alors que la donnée vient d'un nœud précédent (il faut `$('Node Name').item.json`).
- Mauvais index de tableau (`$json[0]` sur autre chose qu'un tableau).
- Pas de valeur de repli sur un champ optionnel.
- Espace ou faute de frappe dans le nom du champ.

### B. Identifiants / authentification
Symptômes : `401 Unauthorized`, `403 Forbidden`, `Invalid API key`, `Authentication failed`
- Mauvais identifiant rattaché au nœud.
- Clé ou token expiré ou révoqué.
- Mauvais type d'auth (Bearer, Basic, clé en en-tête).
- lemlist : la clé API se met en mot de passe, avec un nom d'utilisateur vide (HTTP Basic Auth).
- HubSpot : token de Private App dans l'en-tête Authorization, sous la forme `Bearer TOKEN`.
- OpenAI : token Bearer dans l'en-tête Authorization.

### C. HTTP / API
Symptômes : `4xx`, `5xx`, échec d'un nœud HTTP Request
- `400 Bad Request` : payload mal formé, champ requis manquant, mauvais type de donnée.
- `404 Not Found` : mauvaise URL, ou ressource inexistante (lead, campagne, contact).
- `422 Unprocessable Entity` : bon format mais valeurs invalides (email en doublon, valeur d'énumération invalide).
- `429 Too Many Requests` : rate limit atteint, pas de retry configuré.
- `500 Server Error` : problème côté API, réessayer avec un délai croissant.

### D. Mapping de données
Symptômes : champs vides, `undefined`, mauvaises valeurs en aval
- Le nœud Set ne transmet pas tous les champs (option "Keep All Fields" absente).
- Un nœud Merge perd les données d'une branche.
- Le traitement par lots d'une boucle change la structure des éléments.
- Casse différente dans le nom du champ (`email`, `Email`, `EMAIL`).
- Erreur de parsing JSON sur une chaîne qui n'est pas du JSON valide.

### E. Logique / flux
Symptômes : le workflow s'arrête tôt, mauvaise branche prise, leads sautés
- Condition IF mal évaluée (type différent : chaîne `"true"` contre booléen `true`).
- Le Switch part sur la sortie de repli au lieu de la route attendue.
- Connexion manquante entre deux nœuds.
- Mauvaise sortie connectée (branche 0 ou branche 1 d'un IF).
- La boucle n'itère pas (tableau d'entrée vide).

### F. Configuration n8n
Symptômes : le nœud ne s'enregistre pas, le workflow ne s'active pas, l'exécution reste bloquée
- Paramètre requis manquant dans le nœud.
- URL de webhook non enregistrée (le workflow n'a jamais été activé une seule fois).
- Timeout d'exécution (un workflow long demande d'augmenter le timeout).
- `active: false` : le workflow n'est pas allumé.
- Identifiant mal enregistré.

## Corrections toutes prêtes

### Expression : champ undefined
```
Error: Cannot read properties of undefined (reading 'email')
```
Le champ n'existe pas à cet endroit du flux.
1. Ouvrir le nœud en échec.
2. Onglet "Input" : vérifier si le champ existe vraiment dans la donnée entrante.
3. S'il manque : remonter au nœud source et vérifier que le champ est bien défini et transmis.
4. S'il existe sous un autre nom : corriger l'expression avec le nom exact.
5. Ajouter un repli : `{{ $json.email || '' }}` pour ne pas planter sur un champ optionnel absent.

### Expression : mauvais nœud référencé
```
Error: $json returns empty or unexpected data
```
On lit l'entrée du nœud courant alors que la donnée est dans un nœud précédent.
1. Remplacer `$json.field` par `$('Exact Node Name').item.json.field`.
2. Le nom du nœud doit correspondre exactement (casse et espaces compris).

### HTTP 401 sur lemlist
```
Error: 401 Unauthorized on lemlist API
```
1. Ouvrir le nœud HTTP Request, onglet Authentication.
2. Type : "Basic Auth".
3. Username : laisser vide.
4. Password : la clé API lemlist (lemlist Settings → Integrations → API).

### HTTP 401 sur HubSpot
```
Error: 401 Unauthorized on HubSpot API
```
1. Vérifier qu'on utilise un token de Private App (pas une clé API : dépréciée).
2. Dans le nœud : en-tête Authorization à `Bearer YOUR_TOKEN`.
3. Vérifier que la Private App a les scopes requis pour l'opération.

### HTTP 429 : rate limit
```
Error: 429 Too Many Requests
```
1. Ouvrir le nœud HTTP Request, onglet Settings.
2. Activer "Retry on Fail" : Max retries 3, Wait 2000ms.
3. Sur une grosse liste : ajouter un nœud Wait (1 à 2 s) avant le HTTP Request, dans la boucle.

### IF qui prend toujours la mauvaise branche
Symptôme : tous les leads partent dans la mauvaise branche d'un IF.
1. Ouvrir le nœud IF, vérifier la valeur de la condition.
2. Cas fréquent : chaîne `"true"` comparée au booléen `true`. Ils ne sont pas égaux dans n8n.
3. Correction : `{{ $json.field === true }}`, ou passer l'opération sur "is not empty" pour un test de présence.
4. Test : bouton "Test step" sur le nœud IF avec une vraie entrée, pour voir quelle branche part.

### Set qui perd les champs en amont
Symptôme : des champs des nœuds précédents disparaissent après un Set.
1. Ouvrir le nœud Set.
2. Activer "Keep All Fields" (en haut du nœud).
3. Tous les champs entrants sont conservés, seuls ceux qu'on définit sont ajoutés ou écrasés.

### Switch qui part sur la sortie de repli
Symptôme : tous les éléments vont sur la sortie fallback au lieu des routes définies.
1. Ouvrir le Switch, vérifier la valeur évaluée.
2. L'afficher d'abord : ajouter un Set avant le Switch pour voir la valeur exacte.
3. Cas fréquent : espaces en trop, casse différente, ou valeur imbriquée un niveau plus bas.
4. Corriger l'expression ou normaliser la valeur dans un Set avant le Switch.

### Webhook qui ne reçoit pas la donnée
Symptôme : le déclencheur webhook part mais `$json` est vide ou incomplet.
1. Regarder la réponse du webhook dans l'onglet "Input" du premier nœud après le déclencheur.
2. Clay et la plupart des outils envoient la donnée dans `$json.body` : utiliser `$json.body.fieldName`.
3. Si c'est complètement vide : vérifier l'URL du webhook et que le workflow est actif.
4. Test : inspecter le payload brut envoyé avec un outil comme Webhook.site.

### Boucle qui ne traite pas tous les éléments
Symptôme : seul le premier élément est traité, ou des éléments sont sautés.
1. Vérifier le nœud qui alimente la boucle : il doit sortir un tableau.
2. S'il sort un seul objet : l'envelopper avec un Set et l'expression `{{ [$json] }}`.
3. Dans la boucle, lire l'élément courant avec `$json` (pas `$('Node').item.json`).

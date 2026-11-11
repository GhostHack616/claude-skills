# Livraison d'un workflow n8n : checklist, doc, plan de test

## Checklist avant de livrer le JSON
- [ ] Tous les nœuds ont un nom clair et descriptif (pas d'emoji, pas de nom par défaut)
- [ ] Nœud Error Trigger présent et relié à un canal (Slack, email, Notion ou webhook)
- [ ] Tous les nœuds HTTP Request ont le retry activé (3 essais maximum)
- [ ] Un nœud IF / validation avant chaque écriture
- [ ] Nœuds de log de début et de fin présents
- [ ] Destination des logs configurée (Notion, log n8n natif ou équivalent)
- [ ] Sticky Note de documentation en tête
- [ ] `"active": false` dans le workflow
- [ ] Noms d'identifiants clairs et cohérents
- [ ] Checklist de test incluse dans la réponse

## Bloc de documentation (à donner après le JSON)
```
## Workflow: [Nom]

**Description**: [1 ou 2 phrases]
**Trigger**: [type + condition]
**Integrations**: [liste]
**Sub-workflows required**: [liste ou "none"]
**Credentials needed**: [noms exacts utilisés dans le JSON]
**Expected execution time**: [estimation]
**Error notifications**: [canal : Slack #channel, email, Notion ou webhook]
**Logs to**: [base Notion / Slack / n8n natif]

### Test checklist
- [ ] Le déclencheur part bien avec un payload de test
- [ ] La validation attrape les champs manquants
- [ ] Tous les appels API renvoient la donnée attendue (tester avec un vrai enregistrement)
- [ ] L'Error Trigger part quand un nœud échoue (tester en désactivant une clé API)
- [ ] Notification d'erreur reçue
- [ ] Ligne de log créée
- [ ] Workflow désactivé avant de rendre la main
```

## Plan de test (toujours finir par là)
1. **Importer** le JSON dans n8n (Workflows → Import from JSON).
2. **Rattacher les identifiants** : remplacer les noms d'identifiants par les vrais.
3. **Essai à blanc** avec un enregistrement de test connu (vrai lead ou entrée sandbox).
4. **Forcer une erreur** : casser temporairement un appel API pour vérifier que la gestion d'erreurs se déclenche.
5. **Vérifier les logs** : ligne créée dans la destination de logs, alerte reçue.
6. **Activer** seulement quand toute la checklist passe.

## Schéma recommandé pour la base de logs Notion
| Champ | Type |
|---|---|
| Workflow Name | title |
| Status | select (Success / Error / Partial) |
| Trigger | text |
| Records In | number |
| Records Out | number |
| Error Message | text |
| Execution ID | text |
| Timestamp | datetime |

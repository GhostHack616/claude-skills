# Gabarit JSON et patterns d'intégration n8n

Les schémas ci-dessous décrivent l'enchaînement des nœuds. Les noms suivent la convention `[Catégorie] - [Action] [Contexte]`. `[notifier]` = le canal d'erreur choisi (Slack, email, Notion, webhook).

## Gabarit JSON
```json
{
  "name": "Workflow Name - v1.0",
  "nodes": [...],
  "connections": {...},
  "active": false,
  "settings": {
    "executionOrder": "v1",
    "saveManualExecutions": true,
    "callerPolicy": "workflowsFromSameOwner",
    "errorWorkflow": ""
  },
  "meta": {
    "templateCredsSetupCompleted": false
  }
}
```

Grille de positions :
```
Trigger:     x: 0,    y: 300
Validation:  x: 250,  y: 300
Main flow:   x: 500+, y: 300
Error path:  x: same, y: 550
Log nodes:   x: last, y: 300
```

## Patterns de gestion d'erreurs
Validation avant une écriture :
```
Check - Required Fields Present?
  ├─ YES → continue to action
  └─ NO  → Set - Log Missing Fields → End (skip, don't fail)
```
Sortie d'erreur sur un appel critique :
```
GET - API Call
  ├─ success → next step
  └─ error   → Error - Handle API Failure → [notifier]
```

## lemlist
Ajouter un lead à une campagne (avec contrôle de doublon) :
```
Check - Lead Already in Campaign
  ├─ NO  → lemlist - Add Lead to Campaign
  │          ├─ success → Log - Lead Added
  │          └─ error   → Error - lemlist API Failed → [notifier]
  └─ YES → Log - Skipped Duplicate
```
Retirer un lead d'une campagne :
```
lemlist - Search Lead by Email
  ├─ found     → lemlist - Unsubscribe Lead → Log - Lead Removed
  └─ not found → Log - Lead Not Found, Skip
```
Mettre à jour les variables personnalisées d'un lead :
```
Set - Build Variables Payload
→ lemlist - Update Lead Variables
  ├─ success → Log - Variables Updated
  └─ error   → Error - Update Failed
```
Marquer un lead intéressé / pas intéressé :
```
Check - Lead Status from Webhook
  ├─ interested     → HubSpot - Update Deal Stage + Log
  ├─ not interested → lemlist - Unsubscribe + CRM - Log Lost
  └─ unknown        → Log - Unhandled Status
```

## Clay
Enrichir une personne par URL LinkedIn :
```
Check - LinkedIn URL Present
  ├─ YES → Clay - Find Person by LinkedIn
  │          ├─ found     → Set - Extract Key Fields (name, title, company, email)
  │          └─ not found → Log - Enrichment Failed, Skip
  └─ NO  → Log - Missing LinkedIn URL, Skip
```
Enrichir une entreprise par domaine :
```
Clay - Find Company by Domain
  ├─ found     → Set - Extract Company Fields (size, industry, tech stack)
  └─ not found → Set - Flag as Unenriched → Log
```
Enrichissement en cascade (plusieurs fournisseurs) :
```
Clay - Enrich Email via Provider 1
  ├─ found → continue
  └─ empty → Clay - Enrich Email via Provider 2
               ├─ found → continue
               └─ empty → Log - No Email Found, Skip Lead
```

## HubSpot
Créer ou mettre à jour un contact :
```
HubSpot - Search Contact by Email
  ├─ exists → HubSpot - Update Contact Properties
  └─ new    → HubSpot - Create Contact
→ Set - Store HubSpot Contact ID
→ Log - HubSpot Contact Synced
```
Créer un deal lié à un contact :
```
HubSpot - Search Contact by Email
→ HubSpot - Create Deal
→ HubSpot - Associate Deal to Contact
→ Log - Deal Created
```
Mettre à jour l'étape d'un deal depuis un webhook :
```
Trigger - Webhook (lemlist reply event)
→ Set - Normalize Payload
→ HubSpot - Search Deal by Contact Email
  ├─ found → HubSpot - Update Deal Stage
  └─ none  → HubSpot - Create Deal (fallback)
→ Log - Deal Stage Updated
```
Synchroniser des contacts vers lemlist (planifié) :
```
Trigger - Schedule (daily)
→ HubSpot - Get Contacts (filter: list or property)
→ Loop - Process Contacts Batch
  → Check - Already in lemlist Campaign
    ├─ NO  → lemlist - Add to Campaign
    └─ YES → Log - Skipped
→ Log - Sync Complete (count in, count out)
```

## Salesforce
Créer ou mettre à jour un lead :
```
Salesforce - Search Lead by Email
  ├─ exists → Salesforce - Update Lead
  └─ new    → Salesforce - Create Lead
→ Log - Salesforce Lead Synced
```
Convertir un lead en contact + opportunité :
```
Salesforce - Get Lead by ID
→ Salesforce - Convert Lead
  ├─ success → Salesforce - Create Opportunity → Log
  └─ error   → Error - Conversion Failed → [notifier]
```
Répercuter l'étape d'une opportunité Salesforce dans lemlist :
```
Trigger - Salesforce Opportunity Updated (webhook or poll)
→ Check - Stage Changed to Target Value
  ├─ YES → lemlist - Add Contact to Re-engagement Campaign
  └─ NO  → Log - Stage Change Ignored
```

## Slack
Envoyer le résumé d'un lead enrichi dans un canal :
```
Set - Format Slack Message (name, title, company, source)
→ Slack - Post Message to Channel
→ Log - Notification Sent
```
Validation interactive avant ajout à une campagne :
```
Slack - Send Approval Message (Block Kit with Approve / Reject buttons)
→ Trigger - Slack Interaction Webhook
  ├─ approved → lemlist - Add to Campaign → Slack - Confirm to Requester
  └─ rejected → Log - Lead Rejected → Slack - Confirm Rejection
```

## Notion
Logger une exécution :
```
Set - Build Log Payload (workflow name, status, record count, timestamp)
→ Notion - Create Page in Log Database
```
Lire des données d'entrée depuis une base Notion :
```
Trigger - Schedule or Manual
→ Notion - Query Database (filter: Status = "To Process")
→ Loop - Process Items
  → [main logic]
  → Notion - Update Page Status to "Done"
```
Écrire des leads enrichis dans Notion :
```
Clay - Enrich Person
→ Set - Map Fields to Notion Schema
→ Notion - Create or Update Page
→ Log - Written to Notion
```

## Webhooks et API génériques
Webhook entrant vers plusieurs destinations :
```
Trigger - Webhook
→ Set - Validate and Normalize Payload
→ Check - Event Type
  ├─ "email_opened"  → HubSpot - Log Activity
  ├─ "replied"       → HubSpot - Update Deal + Slack Notify
  ├─ "unsubscribed"  → Salesforce - Update Lead Status + lemlist - Remove
  └─ unknown         → Log - Unhandled Event Type
```
Polling d'une API (pas de webhook dispo) :
```
Trigger - Schedule (every X minutes)
→ HTTP Request - GET API Endpoint
→ Check - New Records Since Last Run
  ├─ YES → Loop - Process New Records
  └─ NO  → Log - Nothing New, End
```
Rafraîchissement d'un token OAuth :
```
HTTP Request - Call API
  ├─ success (200) → continue
  └─ error (401)   → HTTP Request - Refresh Token
                   → Set - Store New Token
                   → HTTP Request - Retry Original Call
```
Gestion du rate limit :
```
HTTP Request - Call API
  ├─ success       → continue
  └─ error (429)   → Wait - 60 seconds
                   → HTTP Request - Retry (max 3 attempts)
                   → error after retries → Error - Rate Limit Exceeded
```

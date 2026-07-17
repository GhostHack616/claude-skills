# {{CLIENT}} — hub client ⭐ Bloc 0

Source de vérité de tout ce qu'on fait sur le compte **{{CLIENT}}** (`main` = la bible canonique). Conçu pour que Claude Code parte avec le contexte complet à chaque session, et branché sur la marketplace de skills `ghosthack-skills`.

> Grammaire du repo (duplicable sur tout client) : voir [DUPLICATION.md](DUPLICATION.md).

## Le client en une ligne
{{CLIENT}} — {{secteur, modèle de vente, ancienneté · CA · géo · particularité}}.

## Mission
{{Objectif du compte en 1-2 lignes : quoi construire, par quels leviers, et le frein n°1 à lever.}}

## État & priorités
- ✅ {{acquis}}
- 🟡 {{en cours}}
- 🔴 Frein n°1 : {{blocage principal}} → `bible/06`.

## Comment le repo marche
```
bible/        LE SAVOIR (8 blocs numérotés)
campaigns/    COLLECTION — 1 dossier / campagne
audits/       COLLECTION — 1 fichier / audit
docs/         RÉFÉRENCE BRUTE (IDs, champs, sources) — jamais de secret
inputs/       MATIÈRES BRUTES (gitignoré)
```

## La bible (`bible/`) — par où entrer dans le sujet

| Bloc | Contenu |
|---|---|
| `01-qui-est-le-client` | Identité, modèle de vente, chiffres, marques, charte |
| `02-offre-referentiel` | Gammes, services, verticales, positionnement, concurrents, SWOT |
| `03-stack-integrations` | Stack actuel vs dispositif cible |
| `04-acquisition-funnels` | ICP, personas, pains par métier, leviers |
| `05-automatisations` | Pipelines lead + système d'acquisition |
| `06-pilotage-mesure` | KPIs, attribution, roadmap, cadre stratégique |
| `07-preuves-resultats` | Références clients, chiffres, synthèse des audits |
| `08-capture-a-chaud` | Inbox datée (décisions, captures à chaud) |

## Skills & MCP
- Skills (`ghosthack-skills`) via `.claude/settings.json` : `lemlist` (GTM/outbound), `tools`, `productivity`. Appel `/<skill>` ou auto.
- MCP : voir `.mcp.json.example` (OAuth, zéro secret) — actif en nouvelle session après login.

## Règles
- `main` = source de vérité. **Feu vert avant chaque push** (résumé + véracité validée ensemble).
- **Aucune PII de leads ni secret en clair** (`.gitignore` · `.env`). Le repo dit OÙ vit un secret, jamais sa valeur.
- Donnée externe référencée dans `docs/sources.md`, pas copiée.
- Convention de confiance 🟢🟡🔴 (voir `bible/_TEMPLATE-bloc.md`).
- Dupliquer sur un nouveau client : [DUPLICATION.md](DUPLICATION.md).

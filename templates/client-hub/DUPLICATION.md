# DUPLICATION — monter un nouveau hub client

Grammaire commune à tous les repos clients. Un hub = **1 repo GitHub PRIVÉ** par client.

## Checklist (dans l'ordre)

1. **Créer le repo** : privé, nom `client-<nom>`, README ON (crée `main`).
   - Si ce template est un « Template repository » GitHub → *Use this template*.
   - Sinon : copier le contenu de `templates/client-hub/` dedans.
2. **Remplacer les placeholders** `{{...}}` : `README.md`, `CLAUDE.md` (client en une ligne, mission, état).
3. **Coller le bloc profil** (généré par le repo brain) dans `CLAUDE.md` → section *Bloc profil*.
4. **Interview de cadrage** (session Claude) : remplir `bible/01` à `04` a minima — identité, offre, stack, ICP/personas. Les blocs `05-08` se remplissent en travaillant.
5. **Brancher les skills** : `.claude/settings.json` est déjà prêt (marketplace `ghosthack-skills`).
6. **Brancher les MCP** : copier `.mcp.json.example` → `.mcp.json`, adapter (OAuth only, zéro secret commité).
7. **Vérifier `.gitignore`** : `inputs/`, `.env` — puis premier commit + push sur `main`.
8. **Test de persistance** : ouvrir une nouvelle session sur le repo → Claude doit connaître le client sans réexplication.

## Invariants (ne pas dévier)
- `bible/` numérotée 01→08, mêmes intitulés sur tous les clients (navigation réflexe).
- `08-capture-a-chaud.md` = seule inbox. On y jette, on range plus tard dans 01-07.
- Collections (`campaigns/`, `audits/`) : nommage `YYYY-MM-<slug>`.
- Règles secrets/PII identiques partout (voir README).

# Mémoire de Claude — repo client {{CLIENT}}

> Auto-chargé à chaque session. Court. Le savoir détaillé vit dans `bible/` (lire à la demande, pas tout d'un coup).

## Bloc profil (l'utilisateur)
{{BLOC_PROFIL — généré par le repo brain, ~10 lignes : qui je suis, français, réponses TRÈS concises, cloud-first, stack (n8n, lemlist, Claude Code web). Détail complet → repo brain privé.}}

## Le client en une ligne
{{CLIENT}} — {{une ligne}}. Mission : {{une ligne}}. Frein n°1 : {{une ligne}} (→ `bible/06`).

## Carte du repo
- `bible/01→08` = le savoir (entrer par le bloc pertinent, `08` = inbox à chaud).
- `campaigns/` `audits/` = collections. `docs/` = référence brute. `inputs/` = gitignoré.

## Règles (dures)
1. `main` = source de vérité. **Feu vert de l'utilisateur avant chaque push** (résumé + véracité validés).
2. **Jamais** de PII de leads, secret, token ou URL de webhook en clair. Le repo dit OÙ vit un secret, jamais sa valeur.
3. Info sensible ou incertaine → taguer 🟢 vérifié / 🟡 probable / 🔴 à confirmer (`bible/_TEMPLATE-bloc.md`).
4. **Capture** : décision prise ou leçon apprise en session → l'écrire dans `bible/08-capture-a-chaud.md` (daté), proposer le commit en fin de session.
5. Donnée externe : référencer dans `docs/sources.md`, ne pas copier.

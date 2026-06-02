# SESSION RECAP — Setup biblio de skills + connecteurs

> But de ce fichier : pouvoir reprendre dans une nouvelle session sans rien perdre.
> Dernière mise à jour : 2026-06-02

## Ce qu'on a construit (FAIT ✅)

Ce repo `GhostHack616/claude-skills` est devenu une **marketplace de plugins Claude Code**, **publique**.

- **Marketplace** : `ghosthack-skills` (déclarée dans `.claude-plugin/marketplace.json`)
- **Plugin `lemlist`** : 37 skills GTM/outbound (cold email, copywriting, ICP, sourcing, analyse…), source = `l3mpire/claude-skills` (lib officielle lemlist, MIT). Le skill `claap-*` a été exclu volontairement.
- **Plugin `tools`** : skill `youtube-transcript` (lecture de vidéos YouTube — voir limite plus bas).
- **Skill témoin** : `marketplace-sync-check` (sert à vérifier que la propagation marche).
- **Confidentialité** : les 2 rapports clients Noelse (`noelse/reports/`) ont été **supprimés partout, historique git inclus**. Le repo public ne contient rien de sensible.
- Branches `master` et `claude/inspiring-ride-CrIc8` alignées sur le même contenu.

## Comment un autre repo pioche dans la biblio

Mettre ce `.claude/settings.json` dans le repo client (ex: RomainPro) :
```json
{
  "extraKnownMarketplaces": {
    "ghosthack-skills": {
      "source": { "source": "github", "repo": "GhostHack616/claude-skills" }
    }
  },
  "enabledPlugins": {
    "lemlist@ghosthack-skills": true,
    "tools@ghosthack-skills": true
  }
}
```
Règle : **tout nouveau skill → poussé sur `master`** (branche par défaut). Pas de `ref` dans le settings.

## À TESTER dans une nouvelle session (EN ATTENTE ⏳)

1. **Connecteur YouTube** (MCP distant `https://youtube-transcript-mcp.ergut.workers.dev/sse`, ajouté côté compte) → tester : coller un lien YouTube, demander le transcript. Doit contourner le blocage 403 (fetch côté serveur Cloudflare).
2. **Connecteur n8n** (ajouté côté compte) → vérifier que les outils n8n apparaissent. ⚠️ Bug d'install vu : ne PAS coller l'URL de l'éditeur (`.../home/workflows`). Il faut l'URL d'un nœud **« MCP Server Trigger »** dans n8n.
3. Les connecteurs ne se chargent qu'au **démarrage** d'une session → il faut une session **fraîche** pour les voir.

## Limite connue : YouTube en cloud
Le scraping direct (yt-dlp / youtube-transcript-api) renvoie **403** depuis les IP datacenter (sessions cloud/webapp). Solution retenue = **MCP distant hébergé** (point 1 ci-dessus) car le fetch se fait sur leur serveur, pas sur l'IP bloquée.

## n8n
Hébergé sur VPS de l'utilisateur (`n8n.srv1599878.hstgr.cloud`). Peut servir de « bras exécutant » pour ce que le cloud bloque.

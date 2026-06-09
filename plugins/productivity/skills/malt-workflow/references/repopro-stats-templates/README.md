# Modèles stats à déposer dans RomainPro

Ces fichiers sont des **données privées** : ils vivent dans RomainPro (privé), jamais dans le repo public claude-skills.

## Installation
Copier les 4 fichiers dans `RomainPro/stats/` :
- `malt-plateforme.md` (volume et conversion des offres dans le temps)
- `historique-missions.md` (sweet spot réel, TJM par type)
- `win-loss.md` (journal des offres traitées, s'auto-remplit)
- `malt-profil-actuel.md` (contenu de ton compte Malt, audité en mode profil)

(Les résultats clients détaillés restent dans `mes-preuves.md`, pas besoin de les dupliquer ici.)

## Usage
Tu remplis `malt-plateforme.md` et `historique-missions.md` à la main quand tu as le temps.
`win-loss.md` se remplit tout seul : `malt-workflow` y ajoute une ligne à chaque offre traitée et relit le fichier pour s'adapter. Tu reviens juste mettre à jour la colonne "Gagnée ?" quand tu as le retour.

Plus c'est rempli, plus le skill juge le fit sur ta réalité et pas sur la théorie.

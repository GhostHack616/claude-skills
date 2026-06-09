# Dossier Malt (offres hors cible -> optimisation du profil)

But : transformer chaque offre hors cible en donnée. Une offre hors cœur qui arrive est le symptôme que le profil Malt rance trop large ("profil lu trop large"). On diagnostique pourquoi, on capitalise offre après offre, on resserre le profil.

Ce dossier est cumulatif : si un dossier existe déjà dans le repo, on l'enrichit (nouvelle entrée datée), on ne repart pas de zéro.

## Structure d'une entrée

### 1. Identité de l'offre
- Date :
- Intitulé du poste recherché :
- Entreprise / secteur :
- Pourquoi classée hors cible (en 1 phrase) :

### 2. Mots-clés extraits de l'offre
> Commencer par les **compétences obligatoires + préférées** affichées en bas du mail Malt : ce sont les mots-clés exacts que Malt a utilisés pour matcher, donc les premiers suspects du mis-ranking.
- **Compétences obligatoires (Malt)** : (ex: Construction, Négoce)
- **Compétences préférées (Malt)** : (ex: Amélioration des process, Acheteur)
- **Rôle** : (ex: community manager, SEO, dev, designer...)
- **Compétences / livrables** : 
- **Secteur** :
- **Outils / stack** :

### 3. Mapping mots-clés -> profil de Romain
Pour chaque mot-clé important, dire s'il matche le cœur (acquisition B2B, GTM, automatisation, outbound, paid, IA ops) ou si c'est du bruit :
| Mot-clé de l'offre | Présent dans le profil Malt ? | Cœur ou bruit ? |
|---|---|---|
| ... | oui/non | cœur / bruit / adjacent |

### 4. Diagnostic de mis-ranking
- Quel(s) terme(s) trop générique(s) du profil Malt a probablement déclenché ce matching ? (ex: "marketing", "digital", "consultant" tout court, un outil cité hors de son cœur...)
- Le profil envoie-t-il un signal trop large sur un axe précis ?

### 5. Recommandations d'évolution du profil Malt
- À resserrer / préciser :
- À retirer ou requalifier :
- Mots-clés cœur à renforcer pour mieux capter l'ICP (scale-up, SaaS B2B, fintech / acquisition, GTM, automatisation) :

### 6. Synthèse cumulée (à mettre à jour à chaque entrée)
- Termes récurrents qui font remonter à tort :
- Tendance : sur quels types d'offres hors cible Romain remonte le plus souvent ?
- Prochaine action concrète sur le profil Malt :

## Où le ranger
Si l'utilisateur travaille dans son repo pro, proposer de sauver / mettre à jour le dossier dans ce repo (ex: `malt/dossier-malt.md`). Ne pas écrire de données privées dans le repo public claude-skills.

# Bibliothèque de déclencheurs

Tous les déclencheurs ne conviennent pas à toutes les offres. Les relier à l'ICP avec discernement.

## Déclencheurs natifs Lemlist
Les libellés sont ceux de l'interface Lemlist.

| Déclencheur | Ce qu'il signale | Idéal pour |
|---|---|---|
| Company hiring a specific role | Direction d'investissement, douleur de passage à l'échelle, nouveau budget | Offres qui servent cette fonction ou les équipes recrutées |
| Company visited my website | Connaissance active, proche de l'achat | Relance, urgence de bas de funnel |
| Engaged on specific LinkedIn topics | Conscience du problème, recherche active | Haut de funnel, angle d'expertise |
| Custom signals (daily web content) | Tout événement repérable dans du contenu public | Signaux de niche, actualités, lancements de produit |
| Contact changed jobs | Nouveau mandat, envie de prouver sa valeur en 90 jours | Offres qui aident un nouveau dirigeant à aller vite |
| Competitor new connections | Un concurrent prospecte le compte | Intercepter avant que le concurrent signe |
| New hire joined the company | Nouveau décideur, regard neuf | Offres que les nouveaux arrivants portent d'habitude |
| Technology change | Évolution de la stack, fin de contrat, coût de changement | Déplacement d'un concurrent, intégrations |
| Company raised funds | Nouveau budget, pression pour grandir, nouveaux investisseurs attentifs | Outils de croissance, de recrutement, d'efficacité |
| Engaged with LinkedIn profile | Intérêt actif pour une personne ou une marque | Approche tiède, avec preuve d'attention |
| Engaged with LinkedIn company page | Connaissance de la marque, comparaison en cours | Approche qui s'appuie sur la communauté |
| Mergers & Acquisitions | Désorganisation, consolidation des fournisseurs | Outils d'infrastructure, d'intégration, de process |
| Promotion (annoncé "coming soon" dans la source, à vérifier dans Lemlist) | Nouvelle autorité, envie de marquer vite | Même logique que la nouvelle arrivée, en interne |

## Déclencheurs externes à forte valeur (hors Lemlist)
À détecter à la main ou avec d'autres outils.

| Déclencheur | Détection | Pourquoi il est fort |
|---|---|---|
| Nouveau VP ou C-level recruté à l'extérieur | Alertes LinkedIn, Crunchbase, Winmo | 90 premiers jours = fenêtre d'achat |
| Seuil d'effectif franchi (ex. 50 → 100 salariés) | Page entreprise LinkedIn, Crunchbase | Les besoins en process et en outils changent aux points d'inflexion |
| Lancement de produit ou annonce majeure | Google Alerts, ProductHunt, presse | Valide la croissance, ouvre les discussions de budget |
| Avis négatifs G2 / Capterra sur un concurrent | Flux RSS G2, veille d'avis | Occasion idéale de déplacement |
| Offre d'emploi pour un rôle que l'offre rend inutile | LinkedIn Jobs, sites d'emploi | Signal direct : ils s'apprêtent à dépenser sur un problème qu'on règle |
| Visite de la page prix sans conversion | Analytics du site (si dispo) | Moment de forte intention, il faut un coup de pouce humain |
| Participation ou intervention à une conférence | Sites d'événements, participants LinkedIn | Contexte commun, entrée en matière tiède |
| Article de presse sur une douleur que l'offre règle | Google Alerts | Bon moment pour proposer la solution |
| Période de renouvellement de contrat (estimée) | Connaissance du secteur (ex. contrats SaaS annuels renouvelés au T4) | Contacter 60 à 90 jours avant |

## Fenêtres (repères tirés des sources)
| Signal | Fenêtre |
|---|---|
| Levée de fonds | Contacter dans les 2 à 4 semaines après l'annonce (au plus strict : 2 semaines). Après, les budgets sont souvent déjà alloués. |
| Nouveau décideur arrivé | Les 30 à 60 premiers jours. Au-delà de 90 jours, il est installé et change moins volontiers. |
| Changement de poste d'un contact | Agir vite : la source cite 72 heures comme exemple de fenêtre. |
| Fusion-acquisition | 1 à 3 mois après l'annonce, quand l'intégration devient concrète. |
| Renouvellement de contrat | 60 à 90 jours avant. |

Les sources ne donnent pas toutes la même fenêtre. En cas de doute, prendre la plus courte.

## Modèle de fiche déclencheur (mode stratégique)
```
[Nom du déclencheur]
Signal : ce qui s'est passé, ce qu'il faut chercher
Pourquoi ça compte pour [ICP] : logique métier, propre à l'ICP
Fenêtre : durée avant que le moment passe
Qui contacter : persona le plus pertinent après ce signal
Angle : le "et alors" à mettre en avant
Dans Lemlist : oui (quel signal) / non
Détection externe : méthode si hors Lemlist
```

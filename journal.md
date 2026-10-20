# Journal de bord du projet encadré
 
# week 2 PPE TD1 (01/10/2026)

travail effectué sur git : création de mon dépôt PPE-2026, compréhension des termes employés dans l'utilisation de git et Github, pull de mon dépot PPE-2026 dans mon local, création de mon journal de bord journal.md sur GitHub, pull du dépôt pour voir la mise jour sur mon local (le journal de bord apparaît) ainsi évite les "conflits" (travailler avec un dépôt qui n'est pas à jour entre le local et le gitHub), git log effectué pour voir le commit effectué du journal de bord, utilisation de vim pour modifier/ éditer mon journal de bord journal.md depuis mon terminal afin d'indiquer le travail du TD1 Git-Introduction de la  séance 2 PPE.     

# TD01 Pipelines (02/10/2026)

J'ai effectué les exercices comme demandé, avec la création des fichiers .txt pour chaque question, afin d'effectuer le push du dossier Excercices sur mon repo. 

Remarque: lors des pipelines, est-ce possible d'éditer ses fichiers dans le terminal pendant que nous faisons nos pipelines ? 
Car lorsque je dois effectué une commande dans un dossier précis, et que je souhaite avoir le stdout dans un fichier texte directement (>>), dois-je faire une long chemin, c'est-à-dire depuis l'endroit où je fais ma pipeline jusqu'au fichier.txt ? Ce qui engendre un chemin relatif, il y a une technique pour suivre son arborescence lors de la création du chemin ?

Lors de la création des pipelines, le fait d'avoir déjà des indications des commandes à utiliser était pratiques pour notre raisonnement et la recherche des options nécessaire dans notre pipeline, que cela soit avec internet ou avec le guide de commande (man, --help). Cela permet l'apprentissage de nouvelles commandes et la compréhension de leurs combinaisons dans les pipelines.
 
# Week 4 et week 5, il n'y a pas eu cours en raison du blocus.  

# Séance 3 Exercices git (20/10/2026)

Quelques lignes ajoutées pour l'exercices 2)a).
Lorem ipsum.

Cette ligne doit rester après correction.


3)b) Les éléments qui étaient présents dans le oups.md :

Il est utilisé à la place du journal de bord pour le reste de la séance. On peut seulement faire
des add et des commit, mais aucun push.


L’idée de cet exercice est de voir comment il est possible de corriger des erreurs avant qu’elle ne soient poussées
vers le dépôt distant.

Les commandes utilisés pour le 3)a)


git stash -u => pour effectuer une sauvegarde complète dans le stash dans anciens et nouveaux fichiers.

git checkout "git-seance2-defaire" => pour consulter la version au temps de la capture du tag/commit.

Observations: après avoir ls, je remarque que oups n'existe pas.

git checkout main => pour revenir dans le présent après le voyage dans le temps de la consultation du dépôt au temps du tag.

Observations: après avoir ls, je remarque que oups.md n'existe pas. Il en est de même pour la ligne "Cette ligne doit rester après correction" après avoir cat le journal.md.

git stash pop => faire apparaître les modifications du présents (sans les avoir indexés avec git add qui est la chambre de préparation du commit, puisqu'ils sont dans le Stash).

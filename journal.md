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


4)a) et b)
 
a) Le conflit: J'ai expérimenté un conflit, c'est-à-dire un décalage entre mon git local et le serveur GitHub (distant). Comme indiqué dans les exercices précédents (le scénario pour nous expérimentés aux conflits GitHub), j'ai envoyé une sauvegarde en ligne (push), puis il nous a été demandé de le défaire. J'ai alors effectué la commande git reset SHA (id du commit en question). Résultat : le commit s'est défait dans le local, mais pas dans le distant (serveur GitHUB). Alors GitHub avait un commit d'avance par rapport au local.
Lorsque j'ai voulu envoyé mes nouvelles modifications (mon fichier journal.md), GitHub a bloqué mon push. Comme d'autres personnes consultent ce dépôt (les professeurs) je ne voulais pas forcer le passage du push avec un --force, car cela écrase de force et réorganise les commits; de même qu'il était indiqué dans la consigne de add, commit, mais de ne pas push lors de la correction des erreurs dans la consigne de l'exercice. Ainsi j'ai souhaité synchroniser le local et le distant proprement et en sécurtié, de sorte à ce que cela soit à jour des deux côtés tout en préservant les modifications que je voulais push au propre. 
 
b) Rétablir le conflit : Afin de rétablir la cohésion entre le local et le distan, j'ai configuré Git sur son mode "merge" avec la commande                       git config pull.rebase false 
et lancé un git pull origin main pour rapatrier l'historique du serveur, comme il était indiqué dans les consignes "hint" du Terminal.
Git a téléchargé le commit de GitHub mais a immédiatement détecté que les mêmes lignes du fichier journal.md avaient été modifiées des deux côtés, ce qui a déclenché un conflit de "merge" (de fusion entre le local et distant) et mis sur pause. Je devais donc ouvrir mon fichier journal.md dans mon éditeur Vim, où Git avait inséré des balises de sécurité comme "<<<<<<< HEAD" pour entourer la zone de désaccord entre la version du fichier en distant et en local. 
Ainsi j'ai supprimé toutes ces lignes de flèches de zone de cadrages sur vim  ainsi que l'ancienne version obsolète provenant de GitHub pour ne conserver que mon texte propre et le plus à jour, avant de sauvegarder et quitter avec :wq.
Une fois le fichier nettoyé dans mon local, j'ai indiqué à Git que l'arbitrage était rendu en tapant
        git add journal.md
pour cloturer officiellement le commit de procesus du " merge". Enfin, j'ai exécuté la commande de transfert final 
       git push origin main
 qui a été acceptée avec succès par GitHub avec la mention Writing objects: 100%. Grâce à cet enchaînement, mon git local et le serveur en ligne partagent désormais exactement la même ligne temporelle en cohésion absolue, et je peux  mettre à jour avec le push.
 



 
Même si les consignes du scénario avaient tendances à ne pas être claire sur la suite des étapes avec les commandes qu'on effectuait, j'ai tout de même pu suivre et effectuer l'essence même du scénario de l'exercice : rencontrer des erreurs Git entre local et distant (avec un commit qui se défait au local avec un reset, mais qui existe toujours dans le distant car il a été push et le reset ne se push pas pour défaire le commit aussi au niveau du distant); provoquant ainsi des conflits que l'on devait résoudre pour le maintient de la cohésion des deux mondes (local et distant) à la même époque (sur la même mise à jour, donc sans conflit). Et c'est ce que j'ai pu effectuer et parcourir à travers les commandes de la leçon. J'ai pu acquérir de même une meilleur compréhension du fonctionnement et de la structure de git add avec son Index, face au git stash avec son espace de sauvegarde de côté Stash. 
 
 
















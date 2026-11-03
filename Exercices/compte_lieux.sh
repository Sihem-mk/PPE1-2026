#!/bin/bash

annee="$1"
mois="$2"

# Validation de l'argument $1 : On accepte le chemin si c'est un dossier existant OU s'il contient une étoile
if [ ! -d "$annee" ] && [[ "$annee" != *"*"* ]]; then
    echo "Erreur : Le dossier $annee n'existe pas."
    exit 1
fi


# Validation de l'argument $2 (le mois dans le chemin de l'année) : On bloque uniquement si le dossier complet n'existe pas ET que le mois n'est pas une étoile
if [ ! -d "$annee/$mois" ] && [[ "$mois" != *"*"* ]]; then
    echo "Erreur : Le dossier mois '$annee/$mois' n'existe pas."
    exit 1
fi

CHEMIN_COMPLET="$annee/$mois"

echo "Recherche en cours dans le dossier : $CHEMIN_COMPLET"
echo "--------------------------------------------------------"

# 2. PLUS SIMPLE : Enlever les guillemets de $CHEMIN_COMPLET pour que le * fonctionne

# Extraction, nettoyage, comptage et classement
# grep -rh : -r recursive (effectue la recherche dans tous les dossiers). -h :supprime nom du fichier, et renvoie lignes propres.
# cut -f3 : garde que la 3ème colonne qui correspond au nom de la Location
# uniq -c : compter combien de fois chaque lieu apparaît. Donc calcule le score de chaque lieu.
# sort -rn : crée le classement du plus grand ay plus petit.


grep -rh "Location" $CHEMIN_COMPLET | cut -f3 | sort | uniq -c | sort -rn

# Récapitulatif :
# execution dans le terminal, depuis le dossier parent de année (2016 2017 2018) donc le dossier "ann", en indiquant le chemin absolu du script pour le lancer en bash.
# indiquer la variable $1 en cliquer déposer (ex: /home/sihem/Exercice1/ann/2017), et indiquer la variable $2 avec nom du dossier directement (ex:01)


#!bin/bash

#Configuration des variables
location="Paris"

#Script qui donne le nombre de "location" par année => fichiers .ann des dossiers 2016 2017 et 2018 ; soit 20*
#Avec la variable $location je peux utiliser le script plusieurs fois pour la recherche de différentes locations, car je n'ai qu'a mettre à jour la variable avec la location souhaitée.

# -r : recherche récursive dans les sous-dossiers
# -i : toutes les casses du mot
# -o :isole chaque occurrence si le lieu apparaît plusieurs fois sur la même ligne


for dossier in ~/Exercice1/ann/2016 ~/Exercice1/ann/2017 ~/Exercice1/ann/2018
do
   echo "Année $dossier :"

   echo " Nombre d'occurences pour $location : "

   grep -rio "$location" "$dossier" | wc

done

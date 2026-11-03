#!/bin/bash


# le script compte_par_type_par_an.sh qui lance le script précédent (compte_par_type.sh) trois fois, une fois pour chaque années (donc 2016 2017 2018), en prenant le type d’entité en argument (Location, Person, Organization...). Ce second script produira un formatage semblable à celui du premier exercice.

#Donc faire une boucle qui lance pour chaque dossier année (soit 3 fois : 2016 2017 2018)
# Il doit prendre alors qu'un argument : le type (Location, Person, Organization...)


#vérification qu'il y a bien un argument en entré avec le script => le type

if [ -z "$1" ]; then
    echo "veuillez entrer 1 argument => le TYPE"
    echo "$0script $1Type"
    exit 1 #pour indiquer l'arrêt du script
fi

#Variable qui comprends les 3 dossiers années (2016 2017 2018) pour éxectuer la tâche en boucle (donc 3 fois soit pour chaque dossier année)
# les () indique le début et la fin de la liste d'éléments independants, ici les chemins de chaque dossier année

type=$1

dossiers=(
"/home/sihem/Exercice1/ann/2016"
"/home/sihem/Exercice1/ann/2017"
"/home/sihem/Exercice1/ann/2018"
)


# "${DOSSIERS[@]}" = La liste complète des 3 dossiers, prête pour la boucle.
# Le symbole [@] signifie en Bash : "Je veux tous les éléments du tableau, séparés les uns des autres"
# les guillemets autour du bloc avec le [@], Bash est très intelligent. Il transforme le tableau exactement comme ceci : "dossier1" "dossier2" "dossier3" La boucle for voit alors 3 blocs distincts bien protégés (même s'ils contiennent des espaces). Elle sait donc qu'elle doit se répéter exactement 3 fois.
#les {} précise de le début et la fin de la variable

# Boucle qui se répète 3 fois (une fois par dossier année)

for dossier in "${dossiers[@]}"; do
    # Vérification de l'existance du dossier.
    if [ -d "$dossier" ]; then
    #le dossier existe on exécute le comptage de type dans le dossier année
    # GREP va ouvrir tous les fichiers de tous les sous-dossiers pour compter combien de fois le $type apparaît
       nombre=$(grep -ro "$type" "$dossier" | wc -l) #pipeline -r = recursive, -o compte plusieurs apparition sur une ligne, et wc -l = compteur affichage numérique ligne (raison pour laquelle à la fin de pipeline)
       echo "le type $1 apparaît $nombre fois dans $dossier "

    else #le dossier n'existe pas
       echo "Le dossier $dossier n'existe pas" #la variable $dossier indique le dossier appelé en question dans le string
    fi
done










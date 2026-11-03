#!/bin/bash

## 1. Vérification de la validité des arguments d'entrée. Car lorsque je vais lancer dans le Bash le script, $1 et $2 vont vérifier les arguments selon leur position et attribuer leur valeur aux variables pour exécuter le script. On doit alors vérifer le nombre d'argument avec $# est égal à 2 pour que le programme s'éxécute, sinon exit.

if [ "$#" -ne 2 ]; then
    exit 1
fi


# Attribution des valeurs de position $1 et $2 aux variables dans le script
# La valeur en position 1 est copiée dans la variable ANNEE qui correspond au dossier année (en donnant le chemin car pas dans le même dossier que le script ex: /home/sihem/Exercice1/ann/2017) dans lequel il faut chercher le type, pour faire le compte par type.
# La valeur en position 2 est copiée dans la variable TYPE (Location, Person, Organization...)
# exemple d'execution : ./compte_par_type.sh /home/sihem/Exercice1/ann/2018 Organization => 1355

DOSSIER_ANNEE=$1
TYPE=$2

# Vérification de l'existance du dossier. Si dossier de l'année n'existe pas, il echo O, au lieu d'un message d'erreur.

if [ ! -d "$DOSSIER_ANNEE" ]; then
    echo 0
    exit 0
fi

#Nombre d'occurance du type par année/dossier
#la pipeline pour effectuer la tâche
grep -rio "$2" "$DOSSIER_ANNEE" | wc -l




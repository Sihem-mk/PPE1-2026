#!/usr/bin/env bash


fichier=$1

#Vérifier l'existence d'un argument
if [ -z "$1" ]; then
    echo "veuillez entrer 1 argument => le fichier d'URLs"
    echo "$0 script $1 fichier URLs"
    exit 1 #pour indiquer l'arrêt du script
fi


#Vérifier l'argument
if [ ! -f "$1" ]; then
    echo "Ce fichier n'existe pas"
    exit 1 #pour indiquer l'arrêt du script
fi


#Afin de pouvoir ajouter un numéro de ligne à chaque ligne URL, on crée une variable compteur
#Initialisation de la variable compteur
numero=0

while read -r line;
do
    ((numero++)) # ou numero=$((numero+1)). (()) -> effectuer opérations arithmétiques avec opérateurs

      #récuperer le code HTTP, ()-> cherche sa valeur et l'attribue à la variable, avec curl
      # %{...} : Variable interne lue par curl // ${...} : variable lue par Bash ET "http_code" => vocab spécifique à curl (mot-clé)
      # -w "%{http_code}": affiche le chiffre de réponse du serveur
      # -o /dev/null : (-o output -> fichier de sortie) envoie le code HTML à la poubelle/ Trou noir Linux (dev/null)
      # -L :suit automatiquement les redirections (Si une adresse web renvoie un code 301 ou 302 (page déplacée)), curl suit le nouveau lien jusqu'à la destination finale.
      # -s :(silent mode) masque la barre de progression du téléchargement et les messages d'erreur techniques pour ne pas polluer le tableau TSV.
      code_http=$(curl -s -L -o /dev/null -w "%{http_code}" "${line}")

      #récupérer l'encodage, avec curl
      # -d : délimiter / couper au "="
      # -f2: garder que la colonne 2
      # content_type => vocab spécifique à curl pour l'encodage (mot-clé)
      encodage=$(curl -s -L -o /dev/null -w "%{content_type}" "${line}" | cut -s -d"=" -f2)

      #récupérer le nombre de mots, avec lynx
      # -dump: récupérer le contenu textuel d’une page pour l’afficher (sans navigation)
      # -nolist: retirer la liste des liens d’une page à l’affichage
      # 2>/dev/null: éventuels messages d'alerte sont jetés à la poubelle, et la commande wc -w renvoie simplement 0 sans abîmer le tableau.
      # wc -w: word count -w -> compter le nbre de mots
      nbre_mots=$(lynx -dump -nolist "${line}" 2>/dev/null | wc -w)

      # -e permet d'interprêter \t comme un opérateur et non du texte à afficher
      # $line agit comme un conteneur temporaire qui se met à jour automatiquement à chaque tour de boucle.
      # les {} -> emballage de nom de variable pour que Bash ne le mélange pas avec les lettres ou symboles collés juste après
      echo -e "${numero}\t${line}\t${code_http}\t${encodage}\t${nbre_mots}"

done < "$1" #pour que cela lise chaque ligne du fichier d'URLS $1


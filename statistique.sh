#!/bin/bash
# script Statistique 
PWD= pwd;
DIRECTORIES_NUMBER=$(find -type d | wc -l);
CACHED_DIRECTORIES=$(find -type d -name ".*" | wc -l);
EMPTY_DIRECTORIES=$(find -type d -empty | wc -l);
FILES_NUMBER=$(find -type f | wc -l);
EMPTY_FILES=$(find -type f -empty | wc -l);
CACHED_FILES=$(find -type f -name ".*" | wc -l);
MAX_LENGTH=$(du -hsx);
MINUS_THAN_512Kb=$(find . -type f -size -512k | wc -l)
GREATER_THAN_512Kb=$(find . -type f -size +15M | wc -l)
BIG_FILE=$(find -type f -exec du -h {} + | sort -rh | head -n 1);
PYTHON_FILES=$(find -type f -name "*.py" | wc -l);
IMAGE_FILES=$(find -type f -name "*.jpg" | wc -l);
MOVIE_FILES=$(find -type f -name "*.mp4" | wc -l);


echo "Analyse de" $PWD ": "

 if [ $1 -eq 1 ] || [ "$#" -eq 0 ] ; then
        echo -e "\t - $DIRECTORIES_NUMBER répertoires"
        echo -e "\t - $FILES_NUMBER fichiers"
        echo -e "\t - taille totale : $MAX_LENGTH"
	exit
    fi
 if [ $1 -eq 2 ]
    then
        echo -e "\t - $DIRECTORIES_NUMBER répertoires"
        echo -e "\t 	- $CACHED_DIRECTORIES répertoires caché"
        echo -e "\t 	- $EMPTY_DIRECTORIES répertoires vide"

        echo -e "\t - $FILES_NUMBER fichiers dont"
	echo -e "\t 	- $CACHED_FILES fichiers caché"
	echo -e "\t 	- $EMPTY_FILES fichiers vide"
        echo -e "\t - taille totale : $MAX_LENGTH"
	exit
    fi
 if [ $1 -eq 3 ]
    then
        echo -e "\t - $DIRECTORIES_NUMBER répertoires"
        echo -e "\t 	- $CACHED_DIRECTORIES répertoires caché"
        echo -e "\t 	- $EMPTY_DIRECTORIES répertoires vide"

        echo -e "\t - $FILES_NUMBER fichiers dont"
	echo -e "\t 	- $CACHED_FILES fichiers caché"
	echo -e "\t 	- $EMPTY_FILES fichiers vide"
	echo -e "\t 	- $MINUS_THAN_512Kb fichier de moins de 512kb"
	echo -e "\t 	- $GREATER_THAN_512Kb fichier de plus de 15Mio"
	echo -e "\t 	- le plus gros fichier est \n $BIG_FILE"

	echo -e "\t   Il y a : "
	echo -e "\t 	- $PYTHON_FILES fichier Python"
	echo -e "\t 	- $IMAGE_FILES fichier image"
	echo -e "\t 	- $MOVIE_FILES fichier vidéo"
        echo -e "\t - taille totale : $MAX_LENGTH"
	exit
    fi


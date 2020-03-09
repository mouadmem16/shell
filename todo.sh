#!/bin/bash
# script todo

TACHES=$HOME/.todo_list
monfichier=$(mktemp /tmp/test.XXX)

 if [ "$1" = "add" ]
    then
	chaine=${*:3}
	head -n  $(($2-1)) $TACHES > $monfichier;
	echo $chaine >> $monfichier;
	tail -n  +$2 $TACHES >> $monfichier;
	cat $monfichier > $TACHES;
	echo -e "la tache \"$chaine\" a été ajoutée en position $2"
	exit 1
    fi

 if [ "$1" = "list" ]
    then
	nl $TACHES -s " - "
	exit 1
    fi

 if [ "$1" = "done" ]
    then
	head -n $(($2-1)) $TACHES > $monfichier;
	tail -n +$(($2+1)) $TACHES >> $monfichier;
	monsubs=$(mktemp /tmp/monsubs.XXX)
	head -n $(($2)) $TACHES > $monsubs;	
	cat $monfichier > $TACHES;
	echo -e "la tache $2 ("$(tail -n 1 $monsubs)") est faite !"
	exit 1
    fi





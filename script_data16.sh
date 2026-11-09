#!/bin/bash

data=$(cat "data.txt")
cpt=0




#On fait des bloc de 16 octets pour les comparer (MD5)
for ((k=0; k<16; k++)); do	
	sortie="sortie$k.txt"
	echo "" > $sortie
	for i in $data; do
		length=${#i}
		for ((j=$k; j<$length; ((j+=32)))); do 
			var="${i:$j:32}"
			echo $var >> $sortie 
		done
		echo " " >> $sortie
	done
done
# Affiche uniquement les doublons
cat $sortie

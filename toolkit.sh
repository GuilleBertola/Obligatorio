#!/bin/bash

ruta=""

opcion3(){
#Muestra los permission denied

	df -h
	find / -type f -printf "%s %f\n" > auxiliar1.txt
	sort -nr auxiliar1.txt > auxiliar2.txt
	head -n2 auxiliar2.txt > auxiliar1.txt
        echo "Directorio mas pesado:"
	tail -n1 auxiliar1.txt
	rm auxiliar1.txt auxiliar2.txt
}

opcion5(){
	whoami
	uptime -p
	date #muestra hora UTC
}

#opcion7(){
#	echo "Ingrese ruta"
#	read ruta


#opcion1(){
#	if[ $ruta -eq "" ]; do
#	read ruta2
#	ls ruta2



opcion=0
while [ $opcion -ne 8 ]; do
	echo "1) "
	echo "2) "
	echo "3) Estado de disco duro "
	echo "4) "
	echo "5) "
	echo "6) "
	echo "7) "
	echo "8) Salir"
	read opcion
	if [ $opcion -eq 1 ] ;then
		echo "1"
	elif [ $opcion -eq 2 ] ;then
		echo "2"
	elif [ $opcion -eq 3 ] ;then
		opcion3
	elif [ $opcion -eq 4 ] ;then
		echo "4"
        elif [ $opcion -eq 5 ] ;then
		opcion5
	elif [ $opcion -eq 6 ] ;then
		echo "6"
        elif [ $opcion -eq 7 ] ;then
		echo "7"
	elif [ $opcion -eq 8 ] ;then
                echo ""
	else
		echo "No esta dentro de las opciones"
	fi
done


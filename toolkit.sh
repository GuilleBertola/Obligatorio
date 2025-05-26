#!/bin/bash

ruta=""

opcion3(){
#Muestra los permission denied
	echo "Espacio en discos:"
	df -h
	find / -type f -printf "%s %f\n" > auxiliar1.txt
	sort -nr auxiliar1.txt > auxiliar2.txt
	head -n2 auxiliar2.txt > auxiliar1.txt
        echo "Archivo mas pesado:"
	tail -n1 auxiliar1.txt
	rm auxiliar1.txt auxiliar2.txt
}

opcion5(){
	whoami
	uptime -p
	date
}

opcion7(){
	echo "Ingrese ruta"
	read ruta
}

opcion1(){
	if [ $ruta -n ]; then
	echo "Ingrese una ruta"
	read ruta2
	find "$ruta2" -maxdepth 1 -type f | wc -l #verificar que devuelve el numero correct
	find "$ruta2" -mindepth 2 -type f | wc -l
	find "$ruta2" -type f -printf "%s %f\n" > auxiliar1.txt
        sort -nr auxiliar1.txt > auxiliar2.txt
        head -n2 auxiliar2.txt > auxiliar1.txt
        echo "Archivo mas pesado"
        tail -n1 auxiliar1.txt
        rm auxiliar1.txt auxiliar2.txt
	find "$ruta2" -type f -printf "%s %f\n" > auxiliar1.txt
        sort -n auxiliar1.txt > auxiliar2.txt
        head -n2 auxiliar2.txt > auxiliar1.txt
        echo "Archivo mas ligero"
        tail -n1 auxiliar1.txt
        rm auxiliar1.txt auxiliar2.txt

	elif
	find "$ruta" -maxdepth 1 -type f | wc -l
	find "$ruta" -mindepth 1 -type f | wc -l
	find "$ruta" -type f -printf "%s %f\n" > auxiliar1.txt
        sort -nr auxiliar1.txt > auxiliar2.txt
        head -n2 auxiliar2.txt > auxiliar1.txt
        echo "Archivo mas pesado"
        tail -n1 auxiliar1.txt
        rm auxiliar1.txt auxiliar2.txt
	find "$ruta" -type f -printf "%s %f\n" > auxiliar1.txt
        sort -n auxiliar1.txt > auxiliar2.txt
        head -n2 auxiliar2.txt > auxiliar1.txt
        echo "Archivo mas ligero"
        tail -n1 auxiliar1.txt
        rm auxiliar1.txt auxiliar2.txt

}



opcion=0
while [ $opcion -ne 8 ]; do
	echo "1) Opcion 1 "
	echo "2) "
	echo "3) Opcion 3 "
	echo "4) "
	echo "5) Opcion 5 "
	echo "6) "
	echo "7) Opcion 7 "
	echo "8) Salir"
	read opcion
	if [ $opcion -eq 1 ] ;then
		opcion1
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
		opcion7
	elif [ $opcion -eq 8 ] ;then
                echo ""
	else
		echo "No esta dentro de las opciones"
	fi
done


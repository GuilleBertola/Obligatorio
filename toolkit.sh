#!/bin/bash


ruta=""

opcion1(){
	find "$ruta" -maxdepth 1 -type f | wc -l
	find "$ruta" -mindepth 2 -type f | wc -l


}

opcion5(){
	whoami
	uptime -p
	date
}

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

ruta_predeterminada=""
definir_ruta_predeterminada() {
    read -p "Ingresar ruta predeterminada: " ruta
    if [[ -d "$ruta" ]]; then #No es necesario validar rutas
        ruta_predeterminada="$ruta"
        echo "Ruta predeterminada: $ruta_predeterminada"
    else
        echo "Ruta no válida."
    fi
}

renombrar_archivos(){ 
   local ruta="$ruta_predeterminada" #que es local
   if [ -z "$ruta" ]; then
        read -p "Introducir ruta del directorio: " ruta
    fi
if [ ! -d "$ruta" ]; then
        echo "Error: La ruta no es un directorio válido."
        return
    fi
for archivo in "$ruta"/*; do
        if [ -f "$archivo" ]; then
            nuevo_nombre="${archivo}bckp"
            if mv "$archivo" "$nuevo_nombre"; then #como funciona este if 
            	echo "Renombrado: $(basename "$archivo") -> $(basename "$nuevo_nombre")"
	    else
		echo "Error renombrando : $(basename "$archivo")"
            fi
	fi
    done
}

buscar_palabra() {
    echo "Busque palabra en archivos"
    read -p "Ingrese palabra a buscar: " palabra
    local carpeta="$ruta_predeterminada"
    if [ -z "$carpeta" ]; then
    	read -p "Ingrese ruta de la carpeta: " carpeta
    fi

    if [ ! -d "$carpeta" ]; then
        echo "La carpeta no existe."
        return
    fi

    echo "Buscando '$palabra' en '$carpeta'..."
    grep -rnw "$carpeta" -e "$palabra"

    if [ -z "$resultados" ]; then
	echo "No hay resultados para '$palabra?."
    else
	echo "$resultados"
    fi
}

guardar_pagina_web() {
    echo "Guardar contenido en página web"
    read -p "Ingresar URL" url
    local carpeta="$ruta_predeterminada"
    if [ -z "$carpeta" ]; then
    	read -p "Ingresar ruta de carpeta donde guardar el archivo" carpeta
    fi

    if [ ! -d "$carpeta" ]; then
        echo "Carpeta no existe."
        return
    fi

    archivo="$carpeta/paginaweb.txt"

    echo "Descargando contenido..."
    if curl -s "$url" -o "$archivo"; then #explicame plis
	echo "Contenido guardado en: $archivo"
    else
	echo "Error guardando la página."
    fi
}


while true; do
    echo ""
    echo "===== TOOLKIT ====="
    echo "1) Definir ruta predeterminada"
    echo "2) Renombrar archivos agregando 'bckp'"
    echo "4) Buscar palabra en archivos"
    echo "6) Guardar contenido de una página web"
    echo "0) Salir"
    read -p "Elegir una opción: " opcion

    case "$opcion" in
	1) definir_ruta_predeterminada ;;
        2) renombrar_archivos ;;
        4) buscar_palabra ;;
  	6) guardar_pagina_web ;;
        0) echo "Saliendo"; break ;;
        *) echo "Opción inválida" ;;
    esac
done


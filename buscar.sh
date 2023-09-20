#!/bin/bash

ingresarDatos(){
    printf "Ingrese la carpeta donde cree que se encuentra su archivo\n"
    printf "NOTA: Su archivo se debe encontrar en su carpeta de usuario "
    read carpeta
    printf "Ingrese el nombre del archivo a buscar: "
    read archivo
    directorio=/home/$USER/$carpeta
    rutaArchivo=$directorio/$archivo
}

#Busqueda de carpeta 
busqueda(){
    if [ -d $directorio ]; then
        #Busqueda del archivo
        if [ -e $rutaArchivo ];then
            echo "El archivo sí se encuentra en la carpeta"  
        else
            echo "El archivo no se encuentra en la carpeta"
        fi  
    else 
        echo "La carptea no existe"
    fi
}

main(){
    ingresarDatos
    busqueda
}

main
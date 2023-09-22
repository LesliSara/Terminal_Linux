#!/bin/bash

logo(){
    printf "\n"
    echo -e "\e[40m\e[32m░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░\e[0m"
    echo -e "\e[40m\e[32m░░                                                                                        ░░\e[0m"
    echo -e "\e[40m\e[32m░░           ║██████   ╔██     ██  ║██████  ╔══█████  ╔╝████      ║██████                 ░░\e[0m"
    echo -e "\e[40m\e[32m░░          ╔╝██   ██ ╔╝██   ╔╝██  ║██   █ ╔╝██      ╔╝██  ██    ╔╝██   ██                ░░\e[0m"
    echo -e "\e[40m\e[32m░░          ║██████   ║██    ║██   ║███    ║██       ║████████   ║███████                 ░░\e[0m"
    echo -e "\e[40m\e[32m░░         ╔╝██   ██  ║██    ║██ ╔═╝ ███   ║██      ╔╝██    ██  ╔╝██  ██                  ░░\e[0m"
    echo -e "\e[40m\e[32m░░         ║███████   ╚══█████   ║██████   ╚══█████ ║██      ██ ║███   ██                 ░░\e[0m"
    echo -e "\e[40m\e[32m░░                                                                                        ░░\e[0m"
    echo -e "\e[40m\e[32m░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░\e[0m"
    printf "\n"
}

ingresarDatos(){
    echo -e "\e[31m\033[1mNOTA:\033[0m \e[32mSu carpeta se debe encontrar en guardada en el usuario actual\e[0m"
    printf "\e[32m\033[1mIngrese la carpeta donde cree que se encuentra su archivo: \e[0m"
    printf "\e[32m"
    read carpeta
    printf "\033[1mIngrese el nombre del archivo a buscar: \e[0m"
    printf "\e[32m"
    read archivo
    directorio=/home/$USER/$carpeta
    rutaArchivo=$directorio/$archivo
}

#Busqueda de carpeta 
busqueda(){
    if [ -d $directorio ]; then
        #Busqueda del archivo
        if [ -e $rutaArchivo ];then
            echo -e "\e[34m\033[1mEl archivo '$archivo' sí se encuentra en la carpeta '$carpeta'\e[0m"  
        else
            echo -e "\e[31m\033[1mEl archivo '$archivo' no se encuentra en la carpeta '$carpeta'\e[0m"
        fi  
    else 
        echo -e "\e[31m\033[1mLa carptea '$carpeta' no existe\e[0m"
    fi
}

main(){
    logo
    ingresarDatos
    echo ""
    busqueda
}

main
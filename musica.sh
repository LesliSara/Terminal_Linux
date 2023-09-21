#!/bin/bash

#logo
logo(){
    printf "\n"
    echo -e "\e[40m\e[32m░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░\e[0m"
    echo -e "\e[40m\e[32m░░                                                                                        ░░\e[0m"
    echo -e "\e[40m\e[32m░░           ║██     ╔╝███  ╔██     ██  ║██████  ║██  ╔══█████  ╔╝████                    ░░\e[0m"
    echo -e "\e[40m\e[32m░░          ╔╝███   ╔╝███  ╔╝██   ╔╝██  ║██   █ ╔╝██ ╔╝██      ╔╝██  ██                   ░░\e[0m"
    echo -e "\e[40m\e[32m░░          ║██ ██ ║██ ██  ║██    ║██   ║███    ║██  ║██       ║████████                  ░░\e[0m"
    echo -e "\e[40m\e[32m░░         ╔╝██  ███ ╔╝██  ║██    ║██ ╔═╝ ███  ╔╝██  ║██      ╔╝██    ██                  ░░\e[0m"
    echo -e "\e[40m\e[32m░░         ║██    █  ║██   ╚══█████   ║██████  ║██   ╚══█████ ║██      ██                 ░░\e[0m"
    echo -e "\e[40m\e[32m░░                                                                                        ░░\e[0m"
    echo -e "\e[40m\e[32m░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░\e[0m"
    printf "\n"
}

#Verificación de instalación de mpg123
verificacion(){
    if  which mpg123 &> /dev/null; then #&> sirve para redirigir salidas estandar y error
        echo "Está instalado, no es necesario su instalación"
    else
        echo "NO SE ENCUENTRA INSTALADO EL PROGRAMA"
        printf "¿Desea instalarlo para continuar con la reproducción [yes/no]?: "
        read opcion
        opcion=$(echo "$opcion" | tr '[:upper:]' '[:lower:]') #en caso de mayusculas las cambia a minusculas
        if [ $opcion == "yes" ]; then
            echo "NOTA: Solo se instalará si la distribución del dispositivo está basada en debian"
            sudo apt install mpg123
        elif [ $opcion == "no" ]; then
            echo "No se podrá instalar"
            exit
        else
            echo "No es una opción válida"
        fi
    fi
}



main(){
    logo
    verificacion
    mpg123 /home/lessara/Desktop/Terminal_Linux/Musica/Fantisize.mp3
}
main
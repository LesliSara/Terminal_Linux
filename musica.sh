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

comprobrarCanciones(){
    echo "Ingrese la ruta donde se encuentre su carpeta de música: "
    read ruta
    if [ -d $ruta ]; then
        canciones="canciones.m3u" #extensión para playlists
        find "$ruta" -type f -name "*.mp3" > "$canciones"
        if [ ! -s "$canciones" ]; then
            echo "No hay canciones en esta carpeta"
        fi
    else
        echo "La carpeta que ingreso no es válida"
    fi
}

menuCanciones(){
    logo
    echo -e "\e[40m\e[32m░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░\e[0m"
    echo -e "\e[40m\e[32m░░                                                                                        ░░\e[0m"
    echo -e "\e[40m\e[32m░░        \033[1m                          M U S I C   H O M E                                   ░░\e[0m"
    echo -e "\e[40m\e[32m░░        \033[1m      -----------------------------------------------------------               ░░\e[0m"
    echo -e "\e[40m\e[32m░░        \033[1m                1)Elegir una única canción                                      ░░\e[0m"
    echo -e "\e[40m\e[32m░░        \033[1m                2)Escuchar desde la primera canción                             ░░\e[0m"
    echo -e "\e[40m\e[32m░░        \033[1m                3)Salir                                                         ░░\e[0m"
    echo -e "\e[40m\e[32m░░                                                                                        ░░\e[0m"
    echo -e "\e[40m\e[32m░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░\e[0m"
    printf "\n"
}
#menu de controles al estar reproduciendo musica
menuControl(){
    echo -e "\e[40m\e[32m░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░\e[0m"
    echo -e "\e[40m\e[32m░░                                                                                        ░░\e[0m"
    echo -e "\e[40m\e[32m░░        \033[1m                      M U S I C   C O N T R O L E R                             ░░\e[0m"
    echo -e "\e[40m\e[32m░░        \033[1m      -----------------------------------------------------------               ░░\e[0m"
    echo -e "\e[40m\e[32m░░        \033[1m            ,)Retroceder                .)Adelantar                             ░░\e[0m"
    echo -e "\e[40m\e[32m░░        \033[1m            d)Canción anterior          f)SIguiente canción                     ░░\e[0m"
    echo -e "\e[40m\e[32m░░        \033[1m            +)Subir volumen             -)Bajar volumen                         ░░\e[0m"
    echo -e "\e[40m\e[32m░░        \033[1m                     [s/' ']) Pausar/Reproducir                                 ░░\e[0m"
    echo -e "\e[40m\e[32m░░        \033[1m                         l)Mostrar playlist                                     ░░\e[0m" 
    echo -e "\e[40m\e[32m░░        \033[1m                              q)Salir                                           ░░\e[0m"    
    echo -e "\e[40m\e[32m░░                                                                                        ░░\e[0m"
    echo -e "\e[40m\e[32m░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░\e[0m"
    printf "\n"
}

reproducirTotal(){
    menuControl
    mpg123 -q -@ "$canciones" 

    rm -f "$canciones"
}

menuControlIndividual(){
    echo -e "\e[40m\e[32m░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░\e[0m"
    echo -e "\e[40m\e[32m░░                                                                                        ░░\e[0m"
    echo -e "\e[40m\e[32m░░        \033[1m                      M U S I C   C O N T R O L E R                             ░░\e[0m"
    echo -e "\e[40m\e[32m░░        \033[1m      -----------------------------------------------------------               ░░\e[0m"
    echo -e "\e[40m\e[32m░░        \033[1m            ,)Retroceder                .)Adelantar                             ░░\e[0m"
    echo -e "\e[40m\e[32m░░        \033[1m            +)Subir volumen             -)Bajar volumen                         ░░\e[0m"
    echo -e "\e[40m\e[32m░░        \033[1m                     [s/' ']) Pausar/Reproducir                                 ░░\e[0m"
    echo -e "\e[40m\e[32m░░        \033[1m                         l)Mostrar playlist                                     ░░\e[0m" 
    echo -e "\e[40m\e[32m░░        \033[1m                              q)Salir                                           ░░\e[0m"    
    echo -e "\e[40m\e[32m░░                                                                                        ░░\e[0m"
    echo -e "\e[40m\e[32m░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░\e[0m"
    printf "\n"
}

reproduccionIndividual(){
    menuControlIndividual
    mapfile -t lista < "$canciones" #mapea las canciones del archivo m3u

    echo "Lista de canciones disponibles:"
    for i in "${!lista[@]}"; do
        echo "$i: ${lista[$i]}"
    done
    echo "Por favor, elija un número de canción para reproducirla:"
    read opcion

    # Verificar si la opción seleccionada es válida
    if [[ ! $opcion =~ ^[0-9]+$ || $opcion -lt 0 || $opcion -ge ${#lista[@]} ]]; then
        echo "Opción no válida. Por favor, seleccione un número válido."
        exit 1
    fi

    # Reproducir la canción seleccionada
    mpg123 -q "${lista[$opcion]}"
}


main(){
    clear
    opcion=0
    logo
    verificacion
    comprobrarCanciones
    
    while [ "$opcion" != 3 ]; do
		clear
        menuCanciones
        echo "Inserte opción: "
        read opcion
		case $opcion in
			1)				
				clear
                logo
                reproduccionIndividual
				;;
			2)				
				clear
                logo
                reproducirTotal
				;;
			3)	
                clear
                logo
                echo "Hasta luego! :)"	
				exit
				;;
			*)	
				echo "Opción no valida"
				;;
		esac
	done
    
}
main
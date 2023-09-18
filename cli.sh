#!/bin/bash

clear
#Le da permisos a todos los .sh del proyecto
permisos(){
    :
}

titulobonito(){
    echo "Título bonito"
}

#Para que el título bonito siga saliendo
clear(){
    /usr/bin/clear
    titulobonito
}

#Para evitar que se pueda salir con ^Z,^C y exit
trap 'echo -n -e "\nNada de eso te sacará de aquí \n$USER: ~$(basename "$PWD") > " ' SIGINT SIGTSTP
exit() {
    echo "Eso no funcionará"
}

titulobonito
while true; do
    echo -n -e "$USER: ~$(basename "$PWD") > "
    read comando
    if [ "$comando" == "salir" ]; then
        break
    fi
    #ejecuta el comando si existe el archivo con .sh, exceptuando access.sh
    if [ -e "$comando.sh" ] && [ "$comando" != "access" ]; then
	. "./$comando.sh"
    else
        eval $comando
    fi
done

trap - SIGTSTP SIGINT SIGTERM

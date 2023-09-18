#!/bin/bash

clear
echo "Aquí pondré un título de inicio de sesión bien bonito"

printf  "\n"


read -p "Ingresa tu nombre de usuario: " username

#getent passwd accede a los registros de los usuario,
#devuelve el registro del usuario enviado, si no existe no devuelve nada.
#La salida se manda a /dev/null (basura) para que no se imprima el 
#registro en pantalla
if ! getent passwd $username &>/dev/null ; then
    echo "Ese usuario no existe"
    exit
fi


if [ $(passwd -S $username | cut -d " " -f2) == "NP" ]; then
    echo "$username no tiene contraseña, por seguridad no se le permite el acceso"
    exit
fi

#-s es para ocultar la contraseña mientras se ingresa.
#-p es para imprimir el text antes de leer la variable.
read -s -p "Ingresa tu contraseña: " password
printf "\n"

if [ $(passwd -S $username | cut -d " " -f2) == "P" ]; then
    if ! echo "$password" | su "$username" &>/dev/null && echo "" &>/dev/null ; then
        echo "La contraseña no es correcta"
        exit
    fi
    echo "La contraseña es correcta"
    . ./cli.sh
else
    echo "Esto no debería de sueder en ningún caso"
fi

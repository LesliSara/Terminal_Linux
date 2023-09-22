#!/bin/bash

clear
echo -e  "\e[40m\e[35m                                                      \e[0m"
echo -e  "\e[40m\e[35m       ██░     ██████░  ██████░  ██░  ███░  ██░       \e[0m"
echo -e  "\e[40m\e[35m       ██░     ██░ ██░  ██░      ██░  ████░ ██░       \e[0m"
echo -e  "\e[40m\e[35m       ██░     ██░ ██░  ██░███░  ██░  ██░██░██░       \e[0m"
echo -e  "\e[40m\e[35m       ██░     ██░ ██░  ██░ ██░  ██░  ██░ ████░       \e[0m"
echo -e  "\e[40m\e[35m       ██████░ ██████░  ██████░  ██░  ██░  ███░       \e[0m"
echo -e  "\e[40m\e[35m                                                      \e[0m"

printf "\n"
read -p "Ingresa tu nombre de usuario: " username

#getent passwd accede a los registros de los usuario,
#devuelve el registro del usuario enviado, si no existe no devuelve nada.
#La salida se manda a /dev/null (basura) para que no se imprima el 
#registro en pantalla
if ! getent passwd $username &>/dev/null ; then
    echo "Ese usuario no existe"
    exit
fi

#Consulta la info de la contraseña, especificamente el campo de P o NP
if [ $(passwd -S $username | cut -d " " -f2) == "NP" ]; then
    echo "$username no tiene contraseña, por seguridad no se le permite el acceso"
    exit
fi

#-s es para ocultar la contraseña mientras se ingresa.
#-p es para imprimir el text antes de leer la variable.
printf "\n"
read -s -p "Ingresa tu contraseña: " password
printf "\n"

#P significa que el usuario tiene contraseña, NP que no, NP suele usarse
#para indicar que el usuario no debe poder entrar.
if [ $(passwd -S $username | cut -d " " -f2) == "P" ]; then
    #Si es posible cambiar de usuario y ejecutar el comando, significa que 
    #la contraseña es correcta.
    if ! echo "$password" | su "$username" &>/dev/null && echo "" &>/dev/null ; then
        echo "La contraseña no es correcta"
        exit
    fi
    #Ejecuta la CLI desde el contexto de esta misma shell.
    chmod +x cli.sh
    . ./cli.sh
else
    echo "Esto no debería de sueder en ningún caso"
fi

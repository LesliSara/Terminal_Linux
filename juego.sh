#!/bin/bash
juegar(){
    #crear e inicializar los "subarreglos"
    for elt in "${categorias[@]}";do eval $elt;done
    
    #Adquirir el nombre del subarreglo
    categoria=$( echo ${categorias[$1]} | cut -d "=" -f1 )

    #Escoger una de las palabras aleatoriamente
    ind=$(($RANDOM%20))
    respuesta=$(eval echo "\${${categoria}[$ind]}") #Para usar el string con el nombre del arreglo como el arreglo, y acceder a la posición
    
    #Hacer la palabra oculta
    palabra=()
    for i in $(seq 0 $((${#respuesta}-1 ))); do
        #Si es espacio, da un output quejándose por el !=, por eso lo envío a /dev/null
        if [ ${respuesta:$i:1} != " " &>/dev/null ]; then
            palabra+=("_")
        else
            palabra+=(" ")
        fi 
    done
    #iterar sobre los intentos
    i=1
    while true ; do
        dibujo $i $1
        #Checa si ya perdiste
        if [ $i -eq 6 ]; then
            read -p "Presiona enter para continuar, \"1\" para jugar otra vez: " enter
            if [ $enter -eq 1 &>/dev/null ]; then
                source juego.sh
            fi
            return
        fi

        read -p "Ingresa un caracter (todas las letras deben ser mayúsculas): " caracter
        aciertos=0
        aciertosNuevos=0
        #comparar la palabra y el nuevo caracter con la respuesta
        for ((j=0; j<${#palabra[@]}; j++ )); do
            #La segunda condición es porque tiene problemas para comparar los espacios
            if [ ${palabra[j]} != ${respuesta[@]:$j:1} ] && [ ${respuesta[@]:$j:1} != " " &>/dev/null ]; then
                #Los /dev/null es porque da una salida quejándose por el uso del == y !=
                if [ $caracter == ${respuesta[@]:$j:1} &>/dev/null ]; then
                    palabra[j]=$caracter
                    ((aciertosNuevos++))
                fi
            else
                aciertos=$((aciertos+1))
            fi
        done

        #Verifica si ya ganaste
        if [ $(($aciertos + $aciertosNuevos)) -eq ${#respuesta} ]; then
            /usr/bin/clear
            echo -e "\e[1m\e[40m\e[32m░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░                                                                              ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░     ║██████  ║██ ║██  ║██████  ║██████  ║█████  ║██████  ║████    ║██████    ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░    ╔╝██  ██ ╔╝██ ║██ ╔╝██╔╝██ ╔╝██  ██ ╔╝██    ╔╝██  ██ ╔╝██ ██  ╔╝██╔╝██    ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░    ║██████  ║██████  ║██ ║██  ║██████  ║██     ║██████  ║██  ██  ║██ ║██     ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░   ╔╝██╔╝██ ╔╝██╔╝██ ╔╝██ ║██ ╔╝████   ╔╝██    ╔╝██╔╝██ ╔╝██ ██  ╔╝██ ║██     ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░   ║██ ║██  ║██ ║██  ║██████  ║██  ██  ║█████  ║██ ║██  ║████    ║██████      ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░                                                                              ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░                           ░░                                                 ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░              |            ░░             .------.       .------.             ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░         \    |   /        ░░            |      _  \   /  _      |            ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░     .     \  |  /    .    ░░            |    / _'._) (_.'_ \    |            ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░      '-.__|\/_\/|_.-'     ░░            |     (o) |   | (o)     |            ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░    .__  \ /     './       ░░             \____    |   |    ____/             ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░       '-                  ░░            .'\     /_|   |_\     /'.            ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░      .-''.  !!     -      ░░            |  |   ' |     | '   |  |            ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░     '     '  !  __.'      ░░            |  |    /. . . .\    |  |            ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░           _)___(          ░░            |.      \       /      .|            ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░          / ____ \         ░░            |_\______|     |______/_|            ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░         | /  _ \ \        ░░                                                 ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░         | |(\o/)| \       ░░                                                 ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░         | | /_\ |  )      ░░    G    A    N    A    S    T    E    !    !    ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░         | |     | /       ░░                                                 ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░                           ░░                                                 ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░\e[0m"
            read -p "Presiona enter para continuar, \"1\" para jugar otra vez: " enter
            if [ $enter -eq 1 &>/dev/null ]; then
                source juego.sh
            fi
            return
        fi

        #Verifica si hubo avances
        if [ $aciertosNuevos -eq 0 ]; then
            i=$((i+1))
        fi
    done
    echo "perdiste"

}

dibujo(){
    /usr/bin/clear
    echo -e "\e[40m\e[32m░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░\e[0m"
    echo -e "\e[40m\e[32m░░                                                                              ░░\e[0m"
    echo -e "\e[40m\e[32m░░     ║██████  ║██ ║██  ║██████  ║██████  ║█████  ║██████  ║████    ║██████    ░░\e[0m"
    echo -e "\e[40m\e[32m░░    ╔╝██  ██ ╔╝██ ║██ ╔╝██╔╝██ ╔╝██  ██ ╔╝██    ╔╝██  ██ ╔╝██ ██  ╔╝██╔╝██    ░░\e[0m"
    echo -e "\e[40m\e[32m░░    ║██████  ║██████  ║██ ║██  ║██████  ║██     ║██████  ║██  ██  ║██ ║██     ░░\e[0m"
    echo -e "\e[40m\e[32m░░   ╔╝██╔╝██ ╔╝██╔╝██ ╔╝██ ║██ ╔╝████   ╔╝██    ╔╝██╔╝██ ╔╝██ ██  ╔╝██ ║██     ░░\e[0m"
    echo -e "\e[40m\e[32m░░   ║██ ║██  ║██ ║██  ║██████  ║██  ██  ║█████  ║██ ║██  ║████    ║██████      ░░\e[0m"
    echo -e "\e[40m\e[32m░░                                                                              ░░\e[0m"
    echo -e "\e[40m\e[32m░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░\e[0m"
    echo -e -n "\e[40m\e[32m░░    \e[0m"
    p=${pista[$2]}
    echo -e -n "\e[40m\e[32m$p\e[0m"
    for k in $(seq 1  $((74-${#p}))); do
        echo -e -n "\e[40m\e[32m \e[0m"
    done
    echo -e "\e[40m\e[32m░░\e[0m"
    echo -e "\e[40m\e[32m░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░\e[0m"
    case $1 in 
        1)
            echo -e "\e[1m\e[40m\e[32m░░                                                                              ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░                         ┌──────────┐                                         ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░                         ||         |                                         ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░                         ||                                                   ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░                         ||                                                   ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░                         ||                                                   ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░                         ||                                                   ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░                         ||                                                   ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░                         ||                                                   ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░                         ||                                                   ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░                         ||                                                   ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░                         ||                                                   ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░                        /||\                                                  ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░                       / || \                                                 ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░                                                                              ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░\e[0m"
            ;;
        2)
            echo -e "\e[1m\e[40m\e[32m░░                                                                              ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░                         ┌──────────┐                                         ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░                         ||         |                                         ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░                         ||        ◢◣┐                                        ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░                         ||       (--)‣                                       ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░                         ||                                                   ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░                         ||                                                   ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░                         ||                                                   ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░                         ||                                                   ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░                         ||                                                   ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░                         ||                                                   ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░                         ||                                                   ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░                        /||\                                                  ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░                       / || \                                                 ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░                                                                              ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░\e[0m"
            ;;
        3)
            echo -e "\e[1m\e[40m\e[32m░░                                                                              ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░                         ┌──────────┐                                         ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░                         ||         |                                         ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░                         ||        ◢◣┐                                        ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░                         ||       (--)‣                                       ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░                         ||        ||                                         ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░                         ||        ┤├                                         ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░                         ||        ||                                         ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░                         ||                                                   ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░                         ||                                                   ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░                         ||                                                   ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░                         ||                                                   ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░                        /||\                                                  ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░                       / || \                                                 ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░                                                                              ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░\e[0m"
            ;;
        4)
            echo -e "\e[1m\e[40m\e[32m░░                                                                              ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░                         ┌──────────┐                                         ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░                         ||         |                                         ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░                         ||        ◢◣┐                                        ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░                         ||       (--)‣                                       ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░                         ||        ||                                         ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░                         ||        ┤├                                         ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░                         ||        ||                                         ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░                         ||        /\                                         ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░                         ||       /  \                                        ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░                         ||     _/    \_                                      ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░                         ||                                                   ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░                        /||\                                                  ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░                       / || \                                                 ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░                                                                              ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░\e[0m"
            ;;
        5)
            echo -e "\e[1m\e[40m\e[32m░░                                                                              ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░                         ┌──────────┐                                         ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░                         ||         |                                         ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░                         ||        ◢◣┐                                        ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░                         ||       (--)‣                                       ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░                         ||        ||                                         ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░                         ||      ┌─┤├                                         ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░                         ||      0 ||                                         ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░                         ||        /\                                         ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░                         ||       /  \                                        ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░                         ||     _/    \_                                      ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░                         ||                                                   ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░                        /||\                                                  ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░                       / || \                                                 ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░                                                                              ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░\e[0m"
            ;;
        6)
            echo -e "\e[1m\e[40m\e[32m░░                                                                              ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░                         ┌──────────┐                                         ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░                         ||         |                                         ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░                         ||        ◢◣┐                                        ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░                         ||       (--)‣       P E R D I S T E   S O N S @     ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░                         ||        ||   ╷                L  A                 ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░                         ||      ┌─┤├───0       P A L A B R A   E R A :       ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░                         ||      0 ||                                         ░░\e[0m"
            echo -e -n "\e[1m\e[40m\e[32m░░                         ||        /\           $respuesta\e[0m"
            for k in $(seq 1  $((30-${#respuesta}))); do
                echo -e -n "\e[40m\e[32m \e[0m"
            done
            echo -e "\e[40m\e[32m░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░                         ||       /  \                                        ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░                         ||     _/    \_                                      ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░                         ||                                                   ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░                        /||\                                                  ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░                       / || \                                                 ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░                                                                              ░░\e[0m"
            echo -e "\e[1m\e[40m\e[32m░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░\e[0m"
            return
            ;;
        *)
            ;;
    esac
    #impresión aestetik de la palabra hasta ahora
    echo -e "\e[1m\e[40m\e[32m░░                                                                              ░░\e[0m"
    echo -e -n "\e[40m\e[32m░░    ${palabra[@]}\e[0m"
    for k in $(seq 1  $((75-${#palabra[@]}-${#palabra[@]}))); do
        echo -e -n "\e[40m\e[32m \e[0m"
    done
    echo -e "\e[40m\e[32m░░\e[0m"
    echo -e "\e[1m\e[40m\e[32m░░                                                                              ░░\e[0m"
    echo -e "\e[40m\e[32m░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░\e[0m"
}

pista=( "DISTRIBUCION DE LINUX" "LENGUAJE DE PROGRAMACIÓN" "BECARIO DE PROTECO" "FACULTAD/ESCUELA" "MATERIA DE ING.COMPUTACIÓN" "CIUDAD")
categorias=(
    "distros=( \"DEBIAN\" \"FEDORA\" \"REDHAT\" \"UBUNTU\" \"ARCH\" \"KALI\" \"ORACLE\" \"MINT\" \"LITE\" \"MANJARO\" \"ELEMENTARY\" \"DEEPIN\" \"HANNAH MONTANA\" \"TURBO\" \"KNOPPIX\" \"CENTOS\" \"MANDRIVA\" \"SUSE\" \"GENTOO\" \"SLACKWARE\")"
    "lenguajes=( \"R\" \"C#\" \"C++\" \"C\" \"PYTHON\" \"JAVA\" \"JAVASCRIPT\" \"JULIA\" \"POSTGRESQL\" \"ELIXIR\" \"MATLAB\" \"PHP\" \"RUBY\" \"SWIFT\" \"KOTLIN\" \"GO\" \"SHELL\" \"PERL\" \"PASCAL\" \"COBOL\")"
    "becarios=( \"BRIAN\" \"PAMELA\" \"ABRAHAM\" \"JAVIER\" \"EITHAN\" \"LEONARDO\" \"DEIVI\" \"JOHN\" \"ALEJANDRO\" \"PAULA\" \"ALBANYA\" \"MARTIN\" \"CHILPA\" \"ENFRIJOLADA\" \"SAMUEL\" \"ATHENAS\" \"ALAN\" \"JIMENA\" \"CYNTHIA\" \"JON\")"
    "facultades=( \"INGENIERIA\" \"PSICOLOGIA\" \"MEDICINA\" \"CIENCIAS\" \"DERECHO\" \"ECONOMIA\" \"ARTE Y DISEÑO\" \"FILOSOFIA\" \"POLITICAS Y SOCIALES\" \"VETERINARIA\" \"CONTADURIA Y ADMINISTRACION\" \"ARQUITECTURA\" \"MUSICA\" \"QUÍMICA\" \"FES IZTACALA\" \"FES ARAGON\" \"FES ZARAGOZA\" \"FES ACATLAN\" \"FES CUAUTITLAN\" \"ODONTOLOGIA\")"
    "materias=( \"EDA\" \"POO\" \"SEÑALES Y SISTEMAS\" \"BASES DE DATOS\" \"MATEMATICAS AVANZADAS\" \"ALGEBRA LINEAL\" \"CALCULO VECTORIAL\" \"INTELIGENCIA ARTIFICIAL\" \"SISTEMAS OPERATIVOS\" \"ESTRUCTURAS DISCRETAS\" \"REDES DE DATOS\" \"MECANICA\" \"ANALISIS NUMERICO\" \"PROBABILIDAD\" \"REDACCION\" \"ECONOMIA\" \"FINANZAS\" \"ETICA\" \"ECUACIONES DIFERENCIALES\" \"CIRCUITOS ELECTRICOS\")"
    "ciudades=( \"ROMA\" \"MENDOZA\" \"PORTLAND\" \"BERLIN\" \"CHICAGO\" \"ERITREA\" \"LIMA\" \"SANTIAGO\" \"KUALA LUMPUR\" \"EL CAIRO\" \"MADRID\" \"BARCELONA\" \"NUEVA DELHI\" \"PORTO\" \"MOSCU\" \"TOKIO\" \"QUEBEC\" \"SEUL\" \"PRAGA\" \"HONG KONG\")"
)

/usr/bin/clear
echo -e "\e[40m\e[32m░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░\e[0m"
echo -e "\e[40m\e[32m░░                                                                              ░░\e[0m"
echo -e "\e[40m\e[32m░░     ║██████  ║██ ║██  ║██████  ║██████  ║█████  ║██████  ║████    ║██████    ░░\e[0m"
echo -e "\e[40m\e[32m░░    ╔╝██  ██ ╔╝██ ║██ ╔╝██╔╝██ ╔╝██  ██ ╔╝██    ╔╝██  ██ ╔╝██ ██  ╔╝██╔╝██    ░░\e[0m"
echo -e "\e[40m\e[32m░░    ║██████  ║██████  ║██ ║██  ║██████  ║██     ║██████  ║██  ██  ║██ ║██     ░░\e[0m"
echo -e "\e[40m\e[32m░░   ╔╝██╔╝██ ╔╝██╔╝██ ╔╝██ ║██ ╔╝████   ╔╝██    ╔╝██╔╝██ ╔╝██ ██  ╔╝██ ║██     ░░\e[0m"
echo -e "\e[40m\e[32m░░   ║██ ║██  ║██ ║██  ║██████  ║██  ██  ║█████  ║██ ║██  ║████    ║██████      ░░\e[0m"
echo -e "\e[40m\e[32m░░                                                                              ░░\e[0m"
echo -e "\e[40m\e[32m░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░\e[0m"
echo -e "\e[40m\e[32m░░                                                                              ░░\e[0m"
echo -e "\e[40m\e[32m░░    ELIGE UNA CATEGORÍA:                                                      ░░\e[0m"
echo -e "\e[40m\e[32m░░    1) DISTRIBUCIONES DE LINUX                                                ░░\e[0m"
echo -e "\e[40m\e[32m░░    2) LENGUAJES DE PROGRAMACIÓN                                              ░░\e[0m"
echo -e "\e[40m\e[32m░░    3) BECARIOS DE PROTECO                                                    ░░\e[0m"
echo -e "\e[40m\e[32m░░    4) FACULTADES Y ESCUELAS DE LA UNAM                                       ░░\e[0m"
echo -e "\e[40m\e[32m░░    5) MATERIAS DE INGENIERÍA EN COMPUTACIÓN                                  ░░\e[0m"
echo -e "\e[40m\e[32m░░    6) CIUDADES                                                               ░░\e[0m"
echo -e "\e[40m\e[32m░░    PARA SALIR PRESIONA CUALQUIER NUMERO MAYOR                                ░░\e[0m"
echo -e "\e[40m\e[32m░░                                                                              ░░\e[0m"
echo -e "\e[40m\e[32m░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░\e[0m"
echo -n "NÚMERO DE LA OPCIÓN ELEGIDA: "
read opcion

opcion=$((opcion-1))
if [ $opcion -lt  6 ]; then
    juegar $opcion 
else
    clear
fi




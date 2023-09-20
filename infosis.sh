#!/bin/bash

echo "$(whoami)@$(hostname)"
echo "---------------------------------------------"

#SISTEMA OPERATIVO
arq_sis=$(uname --machine) #ARQUITECTURA
distro=$(cat /etc/os-release | grep PRETTY_NAME)
distroBien=${distro:12} #SISTEMA OPERATIVO

printf "OS: $(uname -o) $distroBien $arq_sis\n"

#Host modelo de compu
manufacturer=$(sudo dmidecode -t 1 | grep Manufacturer)
man=${manufacturer:15}
productName=$(sudo dmidecode -t 1 | grep Product)
product=${productName:15}
version=$(sudo dmidecode -t 1 | grep Version)
ver=${version:10}
echo "Host: $man $product $ver"

#Mem: total used free shared buff/cache available
meminfo=$(free --mega | grep Mem) #Obtiene información de la ram en MB

ram_total=${meminfo:15:5} #se obtiene subcadena de la cadena de meminfo sobre el total
ram_used=${meminfo:27:5} #se obtiene subcadena de la cadena de meminfo sobre el usado

printf "Memoria del sistema: $ram_used MB / $ram_total MB\n"

#KERNEL
echo "Kernel: $(uname -r)"

#Shell
shell=$SHELL
shellver=$(${shell:5} --version | grep version)
pos=$(expr index "$shellver" "version")-1
versionsh=${shellver:$pos+12:6}
echo "Shell: ${shell:5} $versionsh"

#CPU
modelname=$(grep "model name" /proc/cpuinfo | uniq)
cpu=${modelname:13}
echo "CPU: $cpu"

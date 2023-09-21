#!/bin/bash


#SISTEMA OPERATIVO
arq_sis=$(uname --machine) #ARQUITECTURA
distro=$(cat /etc/os-release | grep PRETTY_NAME)
distroBien=${distro:12} #SISTEMA OPERATIVO

#Host modelo de compu
manufacturer=$(sudo dmidecode -t 1 | grep Manufacturer)
man=${manufacturer:15}
productName=$(sudo dmidecode -t 1 | grep Product)
product=${productName:15}
version=$(sudo dmidecode -t 1 | grep Version)
ver=${version:10}

#Mem: total used free shared buff/cache available
meminfo=$(free --mega | grep Mem) #Obtiene información de la ram en MB

ram_total=${meminfo:15:5} #se obtiene subcadena de la cadena de meminfo sobre el total
ram_used=${meminfo:27:5} #se obtiene subcadena de la cadena de meminfo sobre el usado

#KERNEL
#echo "Kernel: $(uname -r)"

#Shell
shell=$SHELL
shellver=$(${shell:5} --version | grep version)
pos=$(expr index "$shellver" "version")-1
versionsh=${shellver:$pos+12:6}

#CPU
modelname=$(grep "model name" /proc/cpuinfo | uniq)
cpu=${modelname:13}

#IMPRESION DEL INFOSIS
printf "\n"
echo -e "\e[40m\e[32m░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░\e[0m"
echo -e "\e[40m\e[32m░░                                                                                        ░░\e[0m"
echo -e "\e[40m\e[32m░░           ║██  ║██   ║██  ║██████ ╔═╝█████    ║██████  ║██  ║██████                    ░░\e[0m"
echo -e "\e[40m\e[32m░░          ╔╝██ ╔╝███  ╝██ ╔╝██    ╔╝██   ╔╝██  ║██   █ ╔╝██  ║██   █                    ░░\e[0m"
echo -e "\e[40m\e[32m░░          ║██  ║██ ██ ██  ║██████ ║██    ║██   ║███    ║██   ║███                       ░░\e[0m"
echo -e "\e[40m\e[32m░░         ╔╝██ ╔╝██  ████ ╔╝██     ║██    ║██ ╔═╝ ███  ╔╝██ ╔═╝ ███                      ░░\e[0m"
echo -e "\e[40m\e[32m░░         ║██  ║██    ██  ║███     ╚══█████   ║██████  ║██  ║██████                      ░░\e[0m"
echo -e "\e[40m\e[32m░░                                                                                        ░░\e[0m"
echo -e "\e[40m\e[32m░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░\e[0m"
echo -e "\e[40m\e[32m░░                                                                                        ░░\e[0m"
echo -e "\e[40m\e[32m░░                                                                                        ░░\e[0m"
echo -e "\e[40m\e[32m░░                ███                                                                     ░░\e[0m"
echo -e "\e[40m\e[32m░░                  █████                                                                 ░░\e[0m"
echo -e "\e[40m\e[32m░░               ███████████                                                              ░░\e[0m"
echo -e "\e[40m\e[32m░░             ██           ██                  \033[1m$(whoami)@$(hostname)           ░░\033[0m\e[0m"
echo -e "\e[40m\e[32m░░            ██             ██           \033[1m----------------------------------------------  ░░\033[0m\e[0m" 
echo -e "\e[40m\e[32m░░           ██    ██   ██    ██                                                          ░░\e[0m"
echo -e "\e[40m\e[32m░░          ██                 ██         \033[1mOS:\033[0m\e[40m\e[37m $(uname -o) $distroBien $arq_sis\e[32m             ░░\e[0m"
echo -e "\e[40m\e[32m░░         █         ===         █                                                        ░░\e[0m"
echo -e "\e[40m\e[32m░░       ██                       ██      \033[1mHost:\033[0m\e[40m\e[37m $man $product $ver\e[32m                 ░░\e[0m"
echo -e "\e[40m\e[32m░░      ██       ████████████       ██                                                    ░░\e[0m"
echo -e "\e[40m\e[32m░░     █       ██   ███████████       █   \033[1mMemoria del sistema: \033[0m\e[40m\e[37m $ram_used MB / $ram_total MB\e[32m       ░░\e[0m"
echo -e "\e[40m\e[32m░░    ██      ██      ██████████     ██                                                   ░░\e[0m"
echo -e "\e[40m\e[32m░░     █       ██    ██████████      █    \033[1mKernel:\033[0m\e[40m\e[37m $(uname -r) \e[32m                       ░░\e[0m"
echo -e "\e[40m\e[32m░░     ██       ██████████████      ██                                                    ░░\e[0m"
echo -e "\e[40m\e[32m░░      ██       ████████████      ██     \033[1mShell:\033[0m\e[40m\e[37m ${shell:5} $versionsh \e[32m                             ░░\e[0m"
echo -e "\e[40m\e[32m░░        ██       ████████      ██                                                       ░░\e[0m"
echo -e "\e[40m\e[32m░░          ██                ██          \033[1mCPU:\033[0m\e[40m\e[37m $cpu\e[32m  ░░\e[0m"
echo -e "\e[40m\e[32m░░            ██            ██                                                            ░░\e[0m"
echo -e "\e[40m\e[32m░░              ████████████                                                              ░░\e[0m"
echo -e "\e[40m\e[32m░░                                                                                        ░░\e[0m"
echo -e "\e[40m\e[32m░░                                                                                        ░░\e[0m"
echo -e "\e[40m\e[32m░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░\e[0m"
printf "\n"



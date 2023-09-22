#!/bin/bash


#SISTEMA OPERATIVO
arq_sis=$(uname --machine) #ARQUITECTURA
distro=$(cat /etc/os-release | grep PRETTY_NAME)
distroBien=${distro:12} #SISTEMA OPERATIVO

#Host modelo de compu
manufacturer=$(hostnamectl | grep "Hardware Vendor")
man=${manufacturer:18}
productName=$(hostnamectl | grep "Hardware Model")
product=${productName:18}
version=$(hostnamectl | grep "Firmware Version")
ver=${version:18}

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
echo -e "\e[40m\e[32m░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░\e[0m"
echo -e "\e[40m\e[32m░░                                                                                          ░░\e[0m"
echo -e "\e[40m\e[32m░░      ║██  ║██   ║██  ║██████ ╔═╝█████    ║██████  ║██  ║██████                           ░░\e[0m"
echo -e "\e[40m\e[32m░░     ╔╝██ ╔╝███  ╝██ ╔╝██    ╔╝██   ╔╝██  ║██   █ ╔╝██  ║██   █                           ░░\e[0m"
echo -e "\e[40m\e[32m░░     ║██  ║██ ██ ██  ║██████ ║██    ║██   ║███    ║██   ║███                              ░░\e[0m"
echo -e "\e[40m\e[32m░░    ╔╝██ ╔╝██  ████ ╔╝██     ║██    ║██ ╔═╝ ███  ╔╝██ ╔═╝ ███                             ░░\e[0m"
echo -e "\e[40m\e[32m░░    ║██  ║██    ██  ║███     ╚══█████   ║██████  ║██  ║██████                             ░░\e[0m"
echo -e "\e[40m\e[32m░░                                                                                          ░░\e[0m"
echo -e "\e[40m\e[32m░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░\e[0m"
echo -e "\e[40m\e[32m░░                                                                                          ░░\e[0m"
echo -e "\e[40m\e[32m░░                                                                                          ░░\e[0m"
echo -e "\e[40m\e[32m░░                ███                                                                       ░░\e[0m"
echo -e "\e[40m\e[32m░░                  █████                                                                   ░░\e[0m"
echo -e "\e[40m\e[32m░░               ███████████                                                                ░░\e[0m"
echo -e -n "\e[40m\e[32m░░             ██           ██                  \033[1m$(whoami)@$(hostname)\033[0m\e[0m"
resta1=$(echo $(whoami) | wc -c)
resta2=$(echo $(hostname) | wc -c)
for k in $(seq 1  $((45-$resta1-$resta2))); do
    echo -e -n "\e[40m\e[32m \e[0m"
done
echo -e "\e[40m\e[32m░░\e[0m"
echo -e "\e[40m\e[32m░░            ██             ██           \033[1m------------------------------------------------  ░░\033[0m\e[0m" 
echo -e "\e[40m\e[32m░░           ██    ██   ██    ██                                                            ░░\e[0m"
echo -e -n "\e[40m\e[32m░░          ██                 ██         \033[1mOS:\033[0m\e[40m\e[37m $(uname -o) $distroBien $arq_sis\e[0m"
resta1=$(echo $(uname -o) | wc -c)
for k in $(seq 1  $((45-$resta1-${#distroBien}-${#arq_sis}))); do
    echo -e -n "\e[40m\e[32m \e[0m"
done
echo -e "\e[40m\e[32m░░\e[0m"
echo -e "\e[40m\e[32m░░         █         ===         █                                                          ░░\e[0m"
echo -e -n "\e[40m\e[32m░░       ██                       ██      \033[1mHost:\033[0m\e[40m\e[37m $man $product $ver\e[0m"
for k in $(seq 1  $((42-${#man}-${#product}-${#ver}))); do
    echo -e -n "\e[40m\e[32m \e[0m"
done
echo -e "\e[40m\e[32m░░\e[0m"
echo -e "\e[40m\e[32m░░      ██       ████████████       ██                                                      ░░\e[0m"
echo -e -n "\e[40m\e[32m░░     █       ██   ███████████       █   \033[1mMemoria del sistema: \033[0m\e[40m\e[37m $ram_used MB / $ram_total MB\e[0m"
for k in $(seq 1  $((19-${#ram_used}-${#ram_total}))); do
    echo -e -n "\e[40m\e[32m \e[0m"
done
echo -e "\e[40m\e[32m░░\e[0m"
echo -e "\e[40m\e[32m░░    ██      ██      ██████████     ██                                                     ░░\e[0m"
echo -e -n "\e[40m\e[32m░░     █       ██    ██████████      █    \033[1mKernel:\033[0m\e[40m\e[37m $(uname -r)\e[0m"
resta1=$(echo $(uname -r) | wc -c)
for k in $(seq 1  $((43-$resta1))); do
    echo -e -n "\e[40m\e[32m \e[0m"
done
echo -e "\e[40m\e[32m░░\e[0m"
echo -e "\e[40m\e[32m░░     ██       ██████████████      ██                                                      ░░\e[0m"
echo -e -n "\e[40m\e[32m░░      ██       ████████████      ██     \033[1mShell:\033[0m\e[40m\e[37m ${shell:5} $versionsh\e[0m"
resta1=${shell:5}
for k in $(seq 1  $((42-${#resta1}-${#versionsh}))); do
    echo -e -n "\e[40m\e[32m \e[0m"
done
echo -e "\e[40m\e[32m░░\e[0m"
echo -e "\e[40m\e[32m░░        ██       ████████      ██                                                         ░░\e[0m"
echo -e -n "\e[40m\e[32m░░          ██                ██          \033[1mCPU:\033[0m\e[40m\e[37m $cpu\e[0m"
for k in $(seq 1  $((45-${#cpu}))); do
    echo -e -n "\e[40m\e[32m \e[0m"
done
echo -e "\e[40m\e[32m░░\e[0m"
echo -e "\e[40m\e[32m░░            ██            ██                                                              ░░\e[0m"
echo -e "\e[40m\e[32m░░              ████████████                                                                ░░\e[0m"
echo -e "\e[40m\e[32m░░                                                                                          ░░\e[0m"
echo -e "\e[40m\e[32m░░                                                                                          ░░\e[0m"
echo -e "\e[40m\e[32m░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░\e[0m"
printf "\n"



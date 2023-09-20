#!/bin/bash

#Ruta /sys/class/rtc/rtc contiene archivos de fecha y hora. Sin embargo, la hora está establecida en utc

timedatectl set-local-rtc 1 #Set el reloj as local time

printf "\n"
echo -e "\e[40m\e[32m░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░\e[0m"
echo -e "\e[40m\e[32m░░                                                                             ░░\e[0m"
echo -e "\e[40m\e[32m░░          ║██████  ║██   ║█████   ║██     ╔╝███  ║█████   ╔═╝█████           ░░\e[0m"
echo -e "\e[40m\e[32m░░           ╔╝██   ╔╝██  ╔╝██     ╔╝███   ╔╝███  ╔╝██  ██ ╔╝██   ╔╝██         ░░\e[0m"
echo -e "\e[40m\e[32m░░           ║██    ║██   ║█████   ║██ ██ ║██ ██  ║██████  ║██    ║██          ░░\e[0m"
echo -e "\e[40m\e[32m░░          ╔╝██   ╔╝██  ╔╝██     ╔╝██  ███ ╔╝██ ╔╝██      ║██    ║██          ░░\e[0m"
echo -e "\e[40m\e[32m░░          ║██    ║██   ║█████   ║██    █  ║██  ║██       ╚══█████            ░░\e[0m"
echo -e "\e[40m\e[32m░░                                                                             ░░\e[0m"
echo -e "\e[40m\e[32m░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░\e[0m"
echo -e "\e[40m\e[32m                                                                                 \e[0m"

date=$(cat /sys/class/rtc/rtc0/date)
hora=$(cat /sys/class/rtc/rtc0/time)

echo -e "\e[40m\e[32m\033[1mFECHA: $date                                                                \033[0m\e[0m" 
echo -e "\e[40m\e[32m\033[1mHORA: $hora                                                                   \033[0m\e[0m" 
printf "\n"
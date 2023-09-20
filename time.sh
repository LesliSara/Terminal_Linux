#!/bin/bash

#Ruta /sys/class/rtc/rtc contiene archivos de fecha y hora. Sin embargo, la hora está establecida en utc

timedatectl set-local-rtc 1 #Set el reloj as local time

printf "Fecha: " && cat /sys/class/rtc/rtc0/date
printf "Hora: " && cat /sys/class/rtc/rtc0/time
#!/bin/bash
#################################################################################################################
# Autor: Nestor
# Fecha: 2024-6-20
# Descripcion: Genera los archivos de backup de Postgres y de MariaDB para que despues se copien afuera.
#################################################################################################################
#Nombre de archivo
day=$(date '+%Y-%m-%d')
hostname=$(hostname -s)
archive="$day"

log="/home/procesos/respaldos/logs/"$archive".log"
err="/home/procesos/respaldos/logs/"$archive".err"

/home/procesos/respaldos/scripts/backup1.sh 1>$log 2>$err

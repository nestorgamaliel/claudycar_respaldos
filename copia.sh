#!/bin/bash
########################################################################################
# Autor: Nestor
# Fecha: 2024-5-21
# Descripcion: Genera los archivos de backup de Postgres y de MariaDB para que despues se copien afuera.
#######################################################################################

#Nombre de archivo
day=$(date '+%Y-%m-%d')
hostname=$(hostname -s)
archive_pg="pg_$day.sql"
archive_ma="maria_$hostname-$day.sql"

dest="/home/procesos/respaldos/archives"

# Inicio
echo "Inicio \Eliminar"
date
echo

# Eliminar archivos actuales para evitar llenar disco
#rm -rf "$dest/b*.gz"
rm -rf `find $dest -name *.gz`
echo "$dest/*.gz"




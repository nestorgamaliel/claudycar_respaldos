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
echo "Eliminando archivos anteriores $dest/*.gz"
date
echo
rm -rf `find $dest -name *.gz`

# Copiar PG 
echo "Iniciando copia a $dest/$archive_pg"
date
echo
sudo docker exec claudycar_db_1 /usr/lib/postgresql/13/bin/pg_dump -U odoo claudycar | gzip -9  > "$dest/$archive_pg.gz" 

echo "Iniciando copia a $dest/$archive_ma"
date
echo
sudo docker exec claudycar_mariadb_1 mysqldump -u bn_jasperreports bitnami_jasperreports | gzip -9 > "$dest/$archive_ma.gz" 

echo "Fin de generacion archivos"
date



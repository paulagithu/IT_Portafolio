#!/bin/bash
# Script de backup y restore básico en MySQL
# Autor: Paula Bolaños

DB_NAME="mi_base_mysql"
BACKUP_DIR="/home/usuario/backups"
BACKUP_FILE="$BACKUP_DIR/${DB_NAME}_backup_$(date +%Y%m%d).sql"

mkdir -p $BACKUP_DIR

echo "===== Inicio de Backup MySQL ====="
mysqldump -u root -p $DB_NAME > $BACKUP_FILE
echo "Backup MySQL completado: $BACKUP_FILE"

# ===== Restore ejemplo =====
echo "Para restaurar:"
echo "mysql -u root -p < $BACKUP_FILE"
echo "===== Fin del script ====="

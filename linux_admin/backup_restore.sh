#!/bin/bash
# Script de backup y restore básico en Linux
# Autor: Paula Bolaños

# Directorio a respaldar
SOURCE_DIR="/home/usuario/datos_importantes"
# Directorio donde se guardarán los backups
BACKUP_DIR="/home/usuario/backups"
# Nombre del archivo de backup con fecha
BACKUP_FILE="backup_$(date +%Y%m%d_%H%M%S).tar.gz"

# Crear directorio de backup si no existe
mkdir -p $BACKUP_DIR

echo "===== Inicio de Backup ====="
echo "Respaldando $SOURCE_DIR a $BACKUP_DIR/$BACKUP_FILE"

# Crear el backup
tar -czvf $BACKUP_DIR/$BACKUP_FILE $SOURCE_DIR

echo "Backup completado exitosamente."

# ===== Ejemplo de restore =====
# Para restaurar:
# tar -xzvf /ruta/al/backup.tar.gz -C /ruta/de/restauracion
echo "Para restaurar el backup, use el comando tar -xzvf <backup_file> -C <directorio_destino>"

echo "===== Fin del script ====="

#!/bin/bash
# =====================================================
# Script: collect_logs.sh
# Descripción: Crea una cuenta de almacenamiento y sube logs de la VM.
# =====================================================

# Variables
RG_NAME="RG-MiniProyecto"
STORAGE_ACCOUNT="stminiproyecto$(date +%s)"
CONTAINER_NAME="logs"

echo "Creando cuenta de almacenamiento..."
az storage account create \
  --name $STORAGE_ACCOUNT \
  --resource-group $RG_NAME \
  --location canadacentral \
  --sku Standard_LRS

echo "Creando contenedor para logs..."
CONN_STRING=$(az storage account show-connection-string -g $RG_NAME -n $STORAGE_ACCOUNT --query connectionString -o tsv)

az storage container create \
  --name $CONTAINER_NAME \
  --connection-string "$CONN_STRING"

echo "Subiendo logs locales..."
az storage blob upload \
  --container-name $CONTAINER_NAME \
  --file ./vm_status.log \
  --name vm_status.log \
  --connection-string "$CONN_STRING"

echo "Logs subidos correctamente al contenedor $CONTAINER_NAME."

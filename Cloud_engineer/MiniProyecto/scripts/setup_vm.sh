#!/bin/bash
# =====================================================
# Script: setup_vm.sh
# Descripción: Crea una VM Linux en la VNet y Subred creadas.
# =====================================================

# Variables
RG_NAME="RG-MiniProyecto"
VM_NAME="vm-miniproyecto"
VNET_NAME="vnet-miniproyecto"
SUBNET_NAME="subnet-miniproyecto"
USERNAME="paula"
IMAGE="Ubuntu2204"
SIZE="Standard_B1s"

echo "Creando VM Linux..."
az vm create \
  --resource-group $RG_NAME \
  --name $VM_NAME \
  --image $IMAGE \
  --size $SIZE \
  --admin-username $USERNAME \
  --generate-ssh-keys \
  --vnet-name $VNET_NAME \
  --subnet $SUBNET_NAME

echo "Abriendo puerto 22 para SSH..."
az vm open-port --port 22 --resource-group $RG_NAME --name $VM_NAME

echo "VM creada correctamente."

#!/bin/bash
# =====================================================
# Script: deploy_network.sh
# Descripción: Crea el grupo de recursos, red virtual y subred.
# =====================================================

# Variables
RG_NAME="RG-MiniProyecto"
LOCATION="canadacentral"
VNET_NAME="vnet-miniproyecto"
SUBNET_NAME="subnet-miniproyecto"

echo "Creando Resource Group..."
az group create --name $RG_NAME --location $LOCATION

echo "Creando Red Virtual..."
az network vnet create \
  --resource-group $RG_NAME \
  --name $VNET_NAME \
  --address-prefix 10.0.0.0/16 \
  --subnet-name $SUBNET_NAME \
  --subnet-prefix 10.0.1.0/24

echo "Red y Subred creadas correctamente."

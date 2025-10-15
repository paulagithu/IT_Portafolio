# Mini-Proyecto Azure

Este mini-proyecto integra los conocimientos de VM, redes, almacenamiento, automatización y monitoreo en un entorno funcional en Azure.

## Objetivos

- Crear un Resource Group único
- Desplegar una Red Virtual y subred
- Crear una VM Linux dentro de la subred
- Configurar almacenamiento para logs y datos
- Automatizar tareas mediante scripts
- Implementar monitoreo y alertas
- Documentar todo con capturas y logs

## Scripts y su descripción

| Script | Descripción |
|--------|------------|
| [`deploy_network.sh`](scripts/deploy_network.sh) | Crea Resource Group, Virtual Network y Subnet. 
| [`setup_vm.sh`](scripts/setup_vm.sh) | Despliega la VM Linux con username `paula`, abre puerto 22 y conecta a la subred. 
| [`collect_logs.sh`](scripts/collect_logs.sh) | Crea Storage Account, contenedor `logs` y sube archivos de evidencia (`vm_status.log`).

> 🔹 Al hacer clic en los enlaces, GitHub abrirá el contenido del archivo `.sh`.

## Ejecución de scripts (Azure CLI)

1. Abrir **Azure CLI** o Cloud Shell.
2. Ejecutar scripts en orden:

```bash
bash deploy_network.sh
bash setup_vm.sh
bash collect_logs.sh
````
## Evidencia 

![Resource Group](images/resource_group.png)  
![VNet y Subnet](images/vnet_subnet.png)  
![Vista VM](images/vm_overview.png)  
![Red VM](images/vm_networking.png)  
![Contenedor Storage](images/storage_container.png)  
![Logs subidos](images/blob_uploaded.png)

## 🏗️ Arquitectura del proyecto

La infraestructura se implementó dentro de un único **Resource Group**, que contiene todos los recursos principales del entorno.

### 🔹 Componentes

- **Resource Group:** `RG-MiniProject`
- **Virtual Network:** `VNet-Paula` (10.0.0.0/16)
  - **Subnet:** `Subnet-VM` (10.0.1.0/24)
    - **Virtual Machine:** `VM-Linux`
      - Sistema operativo: Ubuntu Server  
      - Usuario: `paula`  
      - Puerto SSH: 22 (acceso remoto)
- **Storage Account:** `stminiprojectlogs`
  - Contenedor: `logs`
  - Uso: almacenamiento de archivos y logs de monitoreo
- **Azure Monitor & Alerts**
  - Recolecta métricas de la VM  
  - Envía alertas por correo electrónico si la VM se apaga o presenta fallos

### 🧩 Esquema lógico del entorno

RG-MiniProject
├─ VNet-Paula
│ └─ Subnet-VM
│ └─ VM-Linux (Ubuntu, user=paula)
├─ Storage Account (logs)
└─ Azure Monitor & Alerts

# Infraestructura como Código (IaC) con Terraform

## Recursos definidos
- Resource Group
- Virtual Network + Subnet
- VM Linux (usuario: paula)
- Public IP + Network Interface
- Storage Account

## Instrucciones conceptuales
1. Terraform leería los archivos `.tf`.
2. `terraform plan` mostraría los recursos a crear.
3. `terraform apply` los crearía en Azure automáticamente.
4. `outputs.tf` mostraría la IP pública de la VM.

# Integración Terraform + Scripts de Administración

Este proyecto incluye scripts de administración (`vm_admon.sh`, `vm_status.sh`) para monitoreo y tareas rutinarias de la VM Linux.  

## Concepto
- La VM puede crearse **manualmente** desde el portal de Azure  o **automáticamente** usando Terraform (Infraestructura como Código).  
- **Los scripts funcionan exactamente igual**, sin importar cómo se creó la VM, siempre que:
  - El usuario administrador sea `paula`.
  - Las rutas y permisos de los scripts se mantengan iguales.

## Beneficio
- Terraform permite desplegar toda la infraestructura automáticamente: Resource Group, VNet, Subnet, VM, Storage Account.  
- Los scripts permiten **administrar la VM y verificar estado, logs y alertas**, manteniendo tu flujo de trabajo probado.  

## Flujo sugerido
1. Desplegar la infraestructura con Terraform .  
2. Conectar a la VM con SSH (`ssh paula@<public_ip>`).  
3. Ejecutar los scripts para administración o monitoreo:
   ```bash
   ./vm_status.sh
   ./vm_admon.sh


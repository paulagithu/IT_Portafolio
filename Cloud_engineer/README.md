# Cloud Engineer – Azure Virtual Machines and Monitoring


Este portafolio muestra proyectos prácticos realizados para demostrar habilidades en administración de Azure, automatización, monitoreo y despliegue de infraestructura.

---

## 1️⃣ Carpeta Fundamentos
Incluye recursos básicos creados y administrados en Azure:

- **VM Linux**  
- **Red Virtual (VNet) y Subredes**  
- **Blob Storage**  

Documentación y capturas en `images/`.

---

## 2️⃣ Carpeta Administración
Scripts y herramientas para la gestión de la VM y monitoreo:

- `vm_admon.sh` → administración de usuarios y tareas rutinarias  
- `vm_status.sh` → verifica estado y logs de la VM  
- Monitoreo y alertas configuradas en Azure  
- Evidencia visual: `images/activity_log_vm.png`  

> Los scripts se ejecutan directamente en la VM (usuario: paula) y funcionan con cualquier VM creada manualmente o mediante Terraform.

---

## 3️⃣ Mini-Proyecto
Integración de todo lo aprendido en un solo proyecto conceptual:

- **Resource Group único**  
- **VNet y Subnet**  
- **VM Linux con usuario paula**  
- **Storage Account para logs**  
- **Automatización y scripts de administración**  
- **Monitoreo y alertas**  
- **Documentación completa con capturas y diagramas**

### Diagrama conceptual
![Arquitectura Mini-Proyecto](images/project_diagram.png)

### Nota profesional
> La infraestructura también se puede desplegar automáticamente con **Terraform (IaC)**. Los scripts de administración y monitoreo funcionan sin cambios, demostrando automatización y control profesional de la VM.

---

## 4️⃣ Carpeta IaC - Terraform
- Contiene archivos `.tf` para desplegar toda la infraestructura:
  - `main.tf` → define recursos (RG, VNet, Subnet, VM, Storage)  
  - `variables.tf` → variables de configuración  
  - `outputs.tf` → información de salida, como IP pública de la VM  

### Flujo conceptual
1. Terraform lee los archivos `.tf`  
2. `terraform plan` muestra los recursos que se crearían  
3. `terraform apply` los desplegaría en Azure  
4. Los scripts se ejecutan en la VM creada, usando Storage para logs

---

## 5️⃣ Evidencia visual
Todas las capturas se encuentran en la carpeta `images/` y muestran:

- Creación de recursos en el portal de Azure  
- Ejecución de scripts de administración  
- Logs y alertas configuradas  
- Diagrama conceptual de la infraestructura

# Infraestructura Segura para Mipymes - Fase 4 (TRL 5)
**Autor:** Elio Ramiro Diaz  
**Metodología:** AEGIS-MD + S-SDLC  
**Proyecto:** Fortalecimiento de la ciberresiliencia en Mipymes bogotanas.

## Descripción
Este repositorio contiene el artefacto técnico de la **Fase de Construcción**. Es un script de automatización en Bash diseñado para realizar el *Hardening* (endurecimiento) de servidores Ubuntu/Debian en entornos VirtualBox.

#!/bin/bash
# Proyecto: Infraestructura Segura para Mipymes - Fase 4
# Autor: Elio Ramiro Diaz
# Objetivo: Implementar Hardening y mitigar amenazas STRIDE (TRL 5)
# NOTA: Se mantiene PasswordAuthentication en 'yes' para evitar bloqueo de acceso remoto.

echo "Iniciando proceso de endurecimiento (Hardening) del servidor de Elio..."

# 1. ACTUALIZACIÓN DEL SISTEMA Y LIMPIEZA
# Justificación: Eliminar vulnerabilidades conocidas [S-SDLC]
sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get autoremove -y
sudo apt-get autoclean

# 2. ASEGURAMIENTO DE SSH (Configuración Segura pero con Acceso)
# Justificación: Se bloquea Root pero se permite usuario con contraseña por ahora.
sudo sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin no/' /etc/ssh/sshd_config
sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
sudo sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

# Reiniciar servicio para aplicar cambios
sudo systemctl restart ssh

# 3. CONFIGURACIÓN DE FIREWALL (UFW)
# Justificación: Defensa contra Denegación de Servicio (DoS)
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow 22/tcp   # SSH (Tu conexión actual)
sudo ufw allow 80/tcp   # HTTP
sudo ufw allow 443/tcp  # HTTPS
echo "y" | sudo ufw enable

# 4. INSTALACIÓN DE FAIL2BAN (Protección Activa)
# Justificación: Mitigación de fuerza bruta bloqueando IPs atacantes
sudo apt-get install fail2ban -y
sudo systemctl enable fail2ban
sudo systemctl start fail2ban

echo "---------------------------------------------------------------"

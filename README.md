Infraestructura Segura para Mipymes - Fase 4 (TRL 5)

Autor: Elio_Diaz

Metodología: AEGIS-MD integrada con S-SDLC

Institución: Universidad Nacional Abierta y a Distancia (UNAD)
1. Descripción del Proyecto

Este repositorio contiene el artefacto técnico desarrollado para la Fase 4 (Componente Práctico) del curso Proyecto de Grado. El prototipo consiste en un script de automatización para el Hardening (endurecimiento) de servidores Linux en entornos virtuales, alcanzando un nivel de madurez tecnológica TRL 5.
2. Sustento Metodológico y Técnico

La implementación sigue el Ciclo de Vida de Desarrollo de Software Seguro (S-SDLC) propuesto por Miguel & Luis Eduardo (2020), integrando los siguientes controles de seguridad:

    Modelado de Amenazas (STRIDE): Mitigación activa de Denegación de Servicio (DoS) y suplantación de identidad.

    Defensa en Profundidad: Configuración automatizada de firewall perimetral y políticas de acceso restrictivas.

    Protección Activa: Implementación de fail2ban para la detección y bloqueo de ataques de fuerza bruta.

3. Métricas de Calidad

De acuerdo con Armijos Carrión et al. (2021) y la norma ISO/IEC 25010, el prototipo es evaluado bajo las métricas de:

    Eficiencia: Optimización del consumo de recursos en el hardware simulado.

    Fiabilidad: Garantía de disponibilidad de servicios críticos bajo políticas de seguridad.

    Seguridad: Protección de la integridad y confidencialidad de los datos de la Mipyme.

4. Instrucciones de Ejecución

    Clonar este repositorio.

    Otorgar permisos de ejecución: chmod +x hardening_elio.sh.txt

    Ejecutar como superusuario: sudo ./hardening_elio.sh.txt

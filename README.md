# Hirata Fleet Management System (v2.0 Aiven Edition) 🚛

**Sistema Profesional de Gestión de Flota y Mantenimiento Preventivo**

Hirata es una aplicación de escritorio diseñada para automatizar el control logístico y mitigar fallas mecánicas imprevistas. El sistema centraliza el monitoreo de kilometraje, la gestión de conductores y la programación de servicios técnicos bajo una arquitectura robusta y escalable.

---

## 🛠️ Stack Tecnológico

* **Lenguaje:** Java 11 (LTS).
* **Interfaz Gráfica:** Java Swing (Desktop GUI).
* **Base de Datos:** MySQL 8.0 alojada en **Aiven Cloud** (Acceso remoto vía SSL/TLS).
* **Gestión de Dependencias:** Apache Maven.
* **Patrones de Diseño:** MVC (Modelo-Vista-Controlador) y DAO (Data Access Object).
* **Distribución:** Ejecutable Windows (.exe) generado con `Launch4j`.

---

## ✨ Características Principales

### 🔔 Motor de Alertas Inteligente (Core)
El sistema transforma el ingreso de datos en un motor predictivo. Implementa una regla de negocio crítica que genera **notificaciones automáticas** en tiempo real cuando un vehículo cruza el umbral de los **5.000 km**, asegurando que ningún camión opere sin su revisión preventiva.

### 🔐 Seguridad y Control de Acceso
Autenticación basada en roles para proteger la integridad de los datos:
* **Administrador:** Control total (CRUD) sobre vehículos, conductores, mantenimientos y gestión de usuarios.
* **Operador:** Interfaz simplificada para lectura y registro de métricas diarias.

### 📊 Gestión Integral de Datos
* **Módulo de Flota:** Registro detallado de camiones (Patente, Marca, Modelo, Año, Km).
* **Gestión de Personal:** Vinculación de conductores a vehículos específicos con reglas de integridad referencial.
* **Historial de Costos:** Seguimiento financiero de cada intervención técnica realizada.

---

## 🏗️ Arquitectura del Proyecto

El código está organizado de forma modular para facilitar el mantenimiento y la extensibilidad:

* `com.hirata.modelo`: Entidades y POJOs.
* `com.hirata.vista`: Componentes Swing optimizados para NetBeans.
* `com.hirata.controlador`: Lógica de negocio y manejo de eventos.
* `com.hirata.dao`: Capa de persistencia JDBC conectada a Aiven MySQL.

---

## 📈 Roadmap de Escalabilidad

Próximas mejoras planificadas para el ciclo 2026:
1.  **Cifrado de Seguridad:** Implementación de BCrypt para el almacenamiento de credenciales.
2.  **Telemetría en Tiempo Real:** Integración con APIs de GPS para actualización automática de kilometraje.
3.  **Módulo de Business Intelligence:** Generación de reportes exportables en PDF y Excel.
4.  **Evolución Cloud:** Migración de la capa visual a plataforma Web mediante **Spring Boot**.

---

## 👥 Equipo de Desarrollo
* **Italo Sabattini** - *Ingeniería y Desarrollo Core*
* **Roberto Fuentes** - *Análisis de Requerimientos y Documentación*
* **Sebastian Cornejo** - *Análisis de Requerimientos y Documentación*

---
> **Nota:** Este proyecto ha sido desarrollado como parte del hito de integración para la asignatura **IEI-091 (Integración de Competencias I)**.

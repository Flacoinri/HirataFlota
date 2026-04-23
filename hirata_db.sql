-- ============================================================
--  Base de datos: Sistema de Gestión de Flota - Empresa Hirata
-- ============================================================

CREATE DATABASE IF NOT EXISTS hirata_db
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_spanish_ci;

USE hirata_db;

-- ------------------------------------------------------------
-- Tabla: usuarios (para el login del sistema)
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS usuarios (
    id_usuario  INT AUTO_INCREMENT PRIMARY KEY,
    username    VARCHAR(50)  NOT NULL UNIQUE,
    password    VARCHAR(100) NOT NULL,
    nombre      VARCHAR(100) NOT NULL,
    rol         ENUM('admin','operador') NOT NULL DEFAULT 'operador',
    activo      TINYINT(1)   NOT NULL DEFAULT 1
);

-- ------------------------------------------------------------
-- Tabla: conductores
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS conductores (
    id_conductor   INT AUTO_INCREMENT PRIMARY KEY,
    nombre         VARCHAR(100) NOT NULL,
    rut            VARCHAR(12)  NOT NULL UNIQUE,
    telefono       VARCHAR(20),
    email          VARCHAR(100),
    fecha_registro DATE         NOT NULL DEFAULT (CURRENT_DATE)
);

-- ------------------------------------------------------------
-- Tabla: camiones
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS camiones (
    id_camion    INT AUTO_INCREMENT PRIMARY KEY,
    patente      VARCHAR(10)   NOT NULL UNIQUE,
    marca        VARCHAR(60)   NOT NULL,
    modelo       VARCHAR(60)   NOT NULL,
    anio         YEAR          NOT NULL,
    kilometraje  DECIMAL(10,2) NOT NULL DEFAULT 0,
    id_conductor INT,
    CONSTRAINT fk_camion_conductor
        FOREIGN KEY (id_conductor) REFERENCES conductores(id_conductor)
        ON UPDATE CASCADE ON DELETE SET NULL
);

-- ------------------------------------------------------------
-- Tabla: mantenimientos
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS mantenimientos (
    id_mantenimiento INT AUTO_INCREMENT PRIMARY KEY,
    id_camion        INT          NOT NULL,
    tipo             VARCHAR(100) NOT NULL,
    descripcion      TEXT,
    fecha            DATE         NOT NULL DEFAULT (CURRENT_DATE),
    km_al_momento    DECIMAL(10,2) NOT NULL,
    costo            DECIMAL(10,2) DEFAULT 0,
    CONSTRAINT fk_mant_camion
        FOREIGN KEY (id_camion) REFERENCES camiones(id_camion)
        ON UPDATE CASCADE ON DELETE CASCADE
);

-- ------------------------------------------------------------
-- Tabla: registros_kilometraje
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS registros_kilometraje (
    id_registro   INT AUTO_INCREMENT PRIMARY KEY,
    id_camion     INT           NOT NULL,
    km_registrado DECIMAL(10,2) NOT NULL,
    fecha         DATE          NOT NULL DEFAULT (CURRENT_DATE),
    observacion   VARCHAR(255),
    CONSTRAINT fk_reg_camion
        FOREIGN KEY (id_camion) REFERENCES camiones(id_camion)
        ON UPDATE CASCADE ON DELETE CASCADE
);

-- ------------------------------------------------------------
-- Datos de ejemplo
-- ------------------------------------------------------------

-- Usuarios del sistema
-- Contraseñas en texto plano para facilitar las pruebas:
--   admin   → password: admin123
--   operador → password: op123
INSERT INTO usuarios (username, password, nombre, rol) VALUES
('admin',    'admin123',  'Administrador Sistema', 'admin'),
('operador', 'op123',     'Juan Operador',         'operador');

-- Conductores
INSERT INTO conductores (nombre, rut, telefono, email) VALUES
('Juan Pérez',     '12.345.678-9', '+56912345678', 'jperez@hirata.cl'),
('María González', '9.876.543-2',  '+56987654321', 'mgonzalez@hirata.cl'),
('Carlos Rojas',   '15.111.222-3', '+56911112222', 'crojas@hirata.cl');

-- Camiones
INSERT INTO camiones (patente, marca, modelo, anio, kilometraje, id_conductor) VALUES
('BCDF12', 'Volvo',    'FH 460',      2021, 4800, 1),
('GHJK34', 'Mercedes', 'Actros 1845', 2020, 5100, 2),
('LMNO56', 'Scania',   'R 450',       2022,  320, 3),
('PQRS78', 'Kenworth', 'T680',        2019, 9750, NULL);

-- Mantenimientos
INSERT INTO mantenimientos (id_camion, tipo, descripcion, fecha, km_al_momento, costo) VALUES
(2, 'Preventivo', 'Cambio de aceite y filtros',     '2024-09-15', 5000, 150000),
(4, 'Preventivo', 'Revisión de frenos y suspensión','2024-06-10', 5000, 320000),
(4, 'Correctivo', 'Cambio de neumáticos traseros',  '2024-08-20', 7800, 480000);

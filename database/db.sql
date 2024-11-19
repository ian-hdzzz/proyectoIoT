CREATE DATABASE database_PSB;
USE database_PSB;
-- Datos Usuario
CREATE TABLE `usuarios` (
  `ID` int(11) NOT NULL,
  `Username` varchar(20) NOT NULL,
  `Correo` varchar(30) NOT NULL,
  `Contrasena` varchar(32) NOT NULL,
  `Nombre` varchar(50) NOT NULL,
  `Apellido1` varchar(50) NOT NULL,
  `Apellido2` varchar(50) DEFAULT NULL,
  `Edad` int(11) NOT NULL,
  `Direccion_ID` int(11) NOT NULL
) ;
ALTER TABLE usuarios
    ADD PRIMARY KEY (ID);

ALTER TABLE usuarios
    MODIFY ID INT(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT = 2;

DESCRIBE usuarios;
-- Direccion 
CREATE TABLE `direcciones` (
  `ID` int(11) NOT NULL,
  `Calle` varchar(50) NOT NULL,
  `Codigo_postal` varchar(10) NOT NULL,
  `Ciudad` varchar(50) NOT NULL,
  `Estado` varchar(50) NOT NULL,
  `Pais` varchar(50) NOT NULL
);

-- Detalle ataques
 CREATE TABLE `ataques` (
  `ID` int(11) NOT NULL,
  `Latitud` float NOT NULL,
  `Longitud` float NOT NULL,
  `Altitud` float NOT NULL,
  `FrecuenciaCardiacaMax` int(11) NOT NULL,
  `Hora` timestamp NOT NULL DEFAULT current_timestamp(),
  `User_ID` int(11) NOT NULL,
  created_at timestamp NOT NULL DEFAULT current_timestamp,
  CONSTRAINT fk_user FOREIGN KEY (User_ID) REFERENCES usuarios(ID)
);

ALTER TABLE ataques
    ADD PRIMARY KEY (ID);
ALTER TABLE ataques
    MODIFY ID INT(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT = 1;

-- Contactos de emergencia
CREATE TABLE `contactos_usuario` (
  `Usuario_ID` int(11) NOT NULL,
  `Contacto_ID` int(11) NOT NULL
);
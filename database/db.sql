CREATE DATABASE database_PSB;
USE database_PSB;

-- Datos Usuario
CREATE TABLE `user` (
  `ID` int(11) NOT NULL
  `email` varchar(30) NOT NULL,
  `password` varchar(32) NOT NULL,
  `name` varchar(30) NOT NULL,
) ;
ALTER TABLE user
    ADD PRIMARY KEY (ID);

ALTER TABLE user
    MODIFY ID INT(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT = 2;

CREATE TABLE datos_personales (
    id_datos INT AUTO_INCREMENT PRIMARY KEY,
    id_user INT NOT NULL,
    lastname varchar(50) NOT NULL,
    adress VARCHAR(255),
    age int(11) NOT NULL,
    FOREIGN KEY (id_user) REFERENCES user(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

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
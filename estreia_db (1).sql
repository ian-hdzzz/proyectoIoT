-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-11-2024 a las 23:56:59
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `estreia_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ataques`
--

CREATE TABLE `ataques` (
  `ID` int(11) NOT NULL,
  `Latitud` float NOT NULL,
  `Longitud` float NOT NULL,
  `Altitud` float NOT NULL,
  `FrecuenciaCardiacaMax` int(11) NOT NULL,
  `Hora` timestamp NOT NULL DEFAULT current_timestamp(),
  `User_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ataques`
--

INSERT INTO `ataques` (`ID`, `Latitud`, `Longitud`, `Altitud`, `FrecuenciaCardiacaMax`, `Hora`, `User_ID`) VALUES
(1, 40.7128, -74.006, 33, 120, '2024-11-07 22:52:01', 1),
(2, 34.0522, -118.244, 50, 130, '2024-11-07 22:52:01', 5),
(3, 51.5074, -0.1278, 20, 140, '2024-11-07 22:52:01', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contactos_usuario`
--

CREATE TABLE `contactos_usuario` (
  `Usuario_ID` int(11) NOT NULL,
  `Contacto_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `contactos_usuario`
--

INSERT INTO `contactos_usuario` (`Usuario_ID`, `Contacto_ID`) VALUES
(1, 2),
(1, 3),
(1, 4),
(2, 3),
(5, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direcciones`
--

CREATE TABLE `direcciones` (
  `ID` int(11) NOT NULL,
  `Calle` varchar(50) NOT NULL,
  `Codigo_postal` varchar(10) NOT NULL,
  `Ciudad` varchar(50) NOT NULL,
  `Estado` varchar(50) NOT NULL,
  `Pais` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `direcciones`
--

INSERT INTO `direcciones` (`ID`, `Calle`, `Codigo_postal`, `Ciudad`, `Estado`, `Pais`) VALUES
(1, 'Calle 1', '10001', 'Ciudad 1', 'Estado 1', 'Pais 1'),
(2, 'Calle 2', '20002', 'Ciudad 2', 'Estado 2', 'Pais 2'),
(3, 'Calle 3', '30003', 'Ciudad 3', 'Estado 3', 'Pais 3'),
(4, 'Calle 4', '40004', 'Ciudad 4', 'Estado 4', 'Pais 4'),
(5, 'Calle 5', '50005', 'Ciudad 5', 'Estado 5', 'Pais 5'),
(6, 'Calle 1', '10001', 'Ciudad 1', 'Estado 1', 'Pais 1'),
(7, 'Calle 2', '20002', 'Ciudad 2', 'Estado 2', 'Pais 2'),
(8, 'Calle 3', '30003', 'Ciudad 3', 'Estado 3', 'Pais 3'),
(9, 'Calle 4', '40004', 'Ciudad 4', 'Estado 4', 'Pais 4'),
(10, 'Calle 5', '50005', 'Ciudad 5', 'Estado 5', 'Pais 5');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimiento_ataque`
--

CREATE TABLE `movimiento_ataque` (
  `ID` int(11) NOT NULL,
  `entrada` int(11) NOT NULL,
  `Ataque_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `movimiento_ataque`
--

INSERT INTO `movimiento_ataque` (`ID`, `entrada`, `Ataque_ID`) VALUES
(1, 5, 1),
(2, 6, 1),
(3, 7, 1),
(4, 10, 2),
(5, 11, 2),
(6, 12, 2),
(7, 13, 2),
(8, 15, 3),
(9, 16, 3),
(10, 17, 3),
(11, 18, 3),
(12, 19, 3),
(13, 20, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `telefonos`
--

CREATE TABLE `telefonos` (
  `ID` int(11) NOT NULL,
  `Telefono` varchar(14) DEFAULT NULL,
  `User_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `telefonos`
--

INSERT INTO `telefonos` (`ID`, `Telefono`, `User_ID`) VALUES
(1, '1234567890', 1),
(2, '7475174155', 2),
(3, '2147483647', 3),
(4, '2147483647', 4),
(5, '1230984567', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

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

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`ID`, `Username`, `Correo`, `Contrasena`, `Nombre`, `Apellido1`, `Apellido2`, `Edad`, `Direccion_ID`) VALUES
(1, 'samantha_m', 'samantha@correo.com', 'a722c63db8ec8625af6cf71cb8c2d939', 'Samantha', 'Medina', NULL, 25, 1),
(2, 'roberto_s', 'roberto@correo.com', 'c1572d05424d0ecb2a65ec6a82aeacbf', 'Roberto', 'Serna', 'Niño', 30, 2),
(3, 'jorge_m', 'jorge@correo.com', '3afc79b597f88a72528e864cf81856d2', 'Jorge Manuel', 'Oyoqui', NULL, 28, 3),
(4, 'ian_h', 'ian@correo.com', 'fc2921d9057ac44e549efaf0048b2512', 'Ian', 'Hernández', 'Hernández', 22, 4),
(5, 'pedro_pe', 'practicamentepedro@correo.com', 'd35f6fa9a79434bcd17f8049714ebfcb', 'Pedro', 'Pedro', 'Pedro', 26, 5);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ataques`
--
ALTER TABLE `ataques`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `User_ID` (`User_ID`);

--
-- Indices de la tabla `contactos_usuario`
--
ALTER TABLE `contactos_usuario`
  ADD PRIMARY KEY (`Usuario_ID`,`Contacto_ID`),
  ADD KEY `Contacto_ID` (`Contacto_ID`);

--
-- Indices de la tabla `direcciones`
--
ALTER TABLE `direcciones`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `movimiento_ataque`
--
ALTER TABLE `movimiento_ataque`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Ataque_ID` (`Ataque_ID`);

--
-- Indices de la tabla `telefonos`
--
ALTER TABLE `telefonos`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `fk_user` (`User_ID`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `unique_username` (`Username`),
  ADD UNIQUE KEY `unique_email` (`Correo`),
  ADD KEY `fk_direccion` (`Direccion_ID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ataques`
--
ALTER TABLE `ataques`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `direcciones`
--
ALTER TABLE `direcciones`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `movimiento_ataque`
--
ALTER TABLE `movimiento_ataque`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `telefonos`
--
ALTER TABLE `telefonos`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `ataques`
--
ALTER TABLE `ataques`
  ADD CONSTRAINT `ataques_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `usuarios` (`ID`) ON DELETE CASCADE;

--
-- Filtros para la tabla `contactos_usuario`
--
ALTER TABLE `contactos_usuario`
  ADD CONSTRAINT `contactos_usuario_ibfk_1` FOREIGN KEY (`Usuario_ID`) REFERENCES `usuarios` (`ID`) ON DELETE CASCADE,
  ADD CONSTRAINT `contactos_usuario_ibfk_2` FOREIGN KEY (`Contacto_ID`) REFERENCES `usuarios` (`ID`) ON DELETE CASCADE;

--
-- Filtros para la tabla `movimiento_ataque`
--
ALTER TABLE `movimiento_ataque`
  ADD CONSTRAINT `movimiento_ataque_ibfk_1` FOREIGN KEY (`Ataque_ID`) REFERENCES `ataques` (`ID`) ON DELETE CASCADE;

--
-- Filtros para la tabla `telefonos`
--
ALTER TABLE `telefonos`
  ADD CONSTRAINT `fk_user` FOREIGN KEY (`User_ID`) REFERENCES `usuarios` (`ID`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `fk_direccion` FOREIGN KEY (`Direccion_ID`) REFERENCES `direcciones` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 12-12-2024 a las 07:49:02
-- Versión del servidor: 10.6.19-MariaDB-log
-- Versión de PHP: 8.1.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `duralitc_billetera`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `area_trabajo`
--

CREATE TABLE `area_trabajo` (
  `Id_Area` int(11) NOT NULL,
  `Nombres` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `area_trabajo`
--

INSERT INTO `area_trabajo` (`Id_Area`, `Nombres`) VALUES
(1, 'Produccion'),

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consumo`
--

CREATE TABLE `consumo` (
  `Id_Consumo` int(11) NOT NULL,
  `Id_Importe` int(11) NOT NULL,
  `Id_Usuario` int(11) NOT NULL,
  `Importe_Total` decimal(10,2) DEFAULT 0.00,
  `Gastos` decimal(10,2) DEFAULT 0.00,
  `Ultimo_Agregado` datetime DEFAULT NULL,
  `Id_Empresa` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado_importe`
--

CREATE TABLE `empleado_importe` (
  `Id_Importe` int(11) NOT NULL,
  `Id_Usuario` int(11) NOT NULL,
  `Codigo_empleado` varchar(255) NOT NULL,
  `Nombre_Completo` varchar(255) NOT NULL,
  `Importes` decimal(10,2) DEFAULT 0.00,
  `Importe_total` decimal(10,2) DEFAULT 0.00,
  `Ultimo_agregado` datetime DEFAULT NULL,
  `Id_Empresa` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empresa`
--

CREATE TABLE `empresa` (
  `Id_Empresa` int(11) NOT NULL,
  `Nombre` varchar(250) NOT NULL,
  `Usuario` varchar(250) NOT NULL,
  `Password` varchar(250) NOT NULL,
  `Foto` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `puesto`
--

CREATE TABLE `puesto` (
  `Id_Puesto` int(11) NOT NULL,
  `Nombre` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `puesto`
--

INSERT INTO `puesto` (`Id_Puesto`, `Nombre`) VALUES
(1, 'Mecanico'),

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `Id_Rol` int(11) NOT NULL,
  `Nombres` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`Id_Rol`, `Nombres`) VALUES
(1, 'Administrador'),
(2, 'Usuario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transferencias_enviadas`
--

CREATE TABLE `transferencias_enviadas` (
  `Id_Transferencia` int(11) NOT NULL,
  `Id_Usuario_Emisor` int(11) NOT NULL,
  `Id_Usuario_Receptor` int(11) NOT NULL,
  `Id_Empresa` int(11) NOT NULL,
  `Monto` decimal(10,2) NOT NULL,
  `Fecha` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `transferencias_recibidas`
--

CREATE TABLE `transferencias_recibidas` (
  `Id_Transferencia` int(11) NOT NULL,
  `Id_Usuario_Receptor` int(11) NOT NULL,
  `Id_Usuario_Emisor` int(11) NOT NULL,
  `Id_Empresa` int(11) NOT NULL,
  `Monto` decimal(10,2) NOT NULL,
  `Fecha` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_pins`
--

CREATE TABLE `user_pins` (
  `Id_PIN` int(11) NOT NULL,
  `Id_Usuario` int(11) NOT NULL,
  `PIN` varchar(6) NOT NULL,
  `Fecha_Creacion` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `Id_Usuario` int(11) NOT NULL,
  `Rol` int(11) DEFAULT NULL,
  `Area` int(11) DEFAULT NULL,
  `Puesto` int(11) DEFAULT NULL,
  `Codigo_empleado` varchar(255) NOT NULL,
  `CI` int(11) NOT NULL,
  `Nombre_Completo` varchar(100) NOT NULL,
  `Estado` tinyint(1) NOT NULL,
  `Fecha_Nacimiento` date DEFAULT NULL,
  `Correo_Electronico` varchar(255) DEFAULT NULL,
  `Telefono` int(11) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `Foto` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`Id_Usuario`, `Rol`, `Area`, `Puesto`, `Codigo_empleado`, `CI`, `Nombre_Completo`, `Estado`, `Fecha_Nacimiento`, `Correo_Electronico`, `Telefono`, `Password`, `Foto`) VALUES
(1, 1, 1, 1, '11223344', 11223344, 'Admin', 1, '2003-04-17', 'admin@gmail.com', 60776373, '11223344', '../../src/sinfoto.png');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `area_trabajo`
--
ALTER TABLE `area_trabajo`
  ADD PRIMARY KEY (`Id_Area`);

--
-- Indices de la tabla `consumo`
--
ALTER TABLE `consumo`
  ADD PRIMARY KEY (`Id_Consumo`),
  ADD KEY `fk_user_c` (`Id_Usuario`),
  ADD KEY `fk_import_c` (`Id_Importe`),
  ADD KEY `fk_empre` (`Id_Empresa`);

--
-- Indices de la tabla `empleado_importe`
--
ALTER TABLE `empleado_importe`
  ADD PRIMARY KEY (`Id_Importe`),
  ADD KEY `fk_user` (`Id_Usuario`),
  ADD KEY `fk_empresa` (`Id_Empresa`);

--
-- Indices de la tabla `empresa`
--
ALTER TABLE `empresa`
  ADD PRIMARY KEY (`Id_Empresa`);

--
-- Indices de la tabla `puesto`
--
ALTER TABLE `puesto`
  ADD PRIMARY KEY (`Id_Puesto`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`Id_Rol`);

--
-- Indices de la tabla `user_pins`
--
ALTER TABLE `user_pins`
  ADD PRIMARY KEY (`Id_PIN`),
  ADD KEY `Id_Usuario` (`Id_Usuario`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`Id_Usuario`),
  ADD KEY `fk_roles` (`Rol`),
  ADD KEY `fk_areas` (`Area`),
  ADD KEY `fk_puestos` (`Puesto`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `area_trabajo`
--
ALTER TABLE `area_trabajo`
  MODIFY `Id_Area` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `consumo`
--
ALTER TABLE `consumo`
  MODIFY `Id_Consumo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `empleado_importe`
--
ALTER TABLE `empleado_importe`
  MODIFY `Id_Importe` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `empresa`
--
ALTER TABLE `empresa`
  MODIFY `Id_Empresa` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `puesto`
--
ALTER TABLE `puesto`
  MODIFY `Id_Puesto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `Id_Rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `user_pins`
--
ALTER TABLE `user_pins`
  MODIFY `Id_PIN` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `Id_Usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `consumo`
--
ALTER TABLE `consumo`
  ADD CONSTRAINT `fk_empre` FOREIGN KEY (`Id_Empresa`) REFERENCES `empresa` (`Id_Empresa`),
  ADD CONSTRAINT `fk_import_c` FOREIGN KEY (`Id_Importe`) REFERENCES `empleado_importe` (`Id_Importe`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_user_c` FOREIGN KEY (`Id_Usuario`) REFERENCES `usuario` (`Id_Usuario`) ON DELETE CASCADE;

--
-- Filtros para la tabla `empleado_importe`
--
ALTER TABLE `empleado_importe`
  ADD CONSTRAINT `fk_empresa` FOREIGN KEY (`Id_Empresa`) REFERENCES `empresa` (`Id_Empresa`),
  ADD CONSTRAINT `fk_user` FOREIGN KEY (`Id_Usuario`) REFERENCES `usuario` (`Id_Usuario`) ON DELETE CASCADE;

--
-- Filtros para la tabla `user_pins`
--
ALTER TABLE `user_pins`
  ADD CONSTRAINT `user_pins_ibfk_1` FOREIGN KEY (`Id_Usuario`) REFERENCES `usuario` (`Id_Usuario`) ON DELETE CASCADE;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_areas` FOREIGN KEY (`Area`) REFERENCES `area_trabajo` (`Id_Area`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_puestos` FOREIGN KEY (`Puesto`) REFERENCES `puesto` (`Id_Puesto`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_roles` FOREIGN KEY (`Rol`) REFERENCES `roles` (`Id_Rol`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

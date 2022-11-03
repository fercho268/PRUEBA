-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-11-2022 a las 00:06:49
-- Versión del servidor: 10.4.24-MariaDB
-- Versión de PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `ddbb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_departamentos`
--

CREATE TABLE `tbl_departamentos` (
  `id_departamentos` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_departamentos`
--

INSERT INTO `tbl_departamentos` (`id_departamentos`, `nombre`) VALUES
(1, 'Huila'),
(2, 'cundinamarca'),
(3, 'guaviare'),
(4, 'Magdalena'),
(5, 'Meta');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_genero`
--

CREATE TABLE `tbl_genero` (
  `id_genero` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_genero`
--

INSERT INTO `tbl_genero` (`id_genero`, `nombre`) VALUES
(1, 'Masculino'),
(2, 'Femenino'),
(3, 'Otro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_municipios`
--

CREATE TABLE `tbl_municipios` (
  `id_municipio` int(11) NOT NULL,
  `fk_departamento` int(11) NOT NULL DEFAULT 0,
  `nombre` varchar(50) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_municipios`
--

INSERT INTO `tbl_municipios` (`id_municipio`, `fk_departamento`, `nombre`) VALUES
(1, 1, 'neiva'),
(2, 1, 'iquira'),
(3, 4, 'Fundacion '),
(4, 4, 'El banco'),
(5, 5, 'El calvario'),
(6, 5, 'El Dorado'),
(7, 2, 'zipaquira'),
(8, 2, 'Soacha'),
(9, 3, 'El retorno'),
(10, 3, 'Miraflores');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_paciente`
--

CREATE TABLE `tbl_paciente` (
  `id_paciente` int(11) NOT NULL,
  `fk_tipo_documento` int(11) NOT NULL DEFAULT 0,
  `documento` varchar(50) NOT NULL DEFAULT '0',
  `nombre1` varchar(50) NOT NULL DEFAULT '0',
  `nombre2` varchar(50) NOT NULL DEFAULT '0',
  `apellido1` varchar(50) NOT NULL DEFAULT '0',
  `apellido2` varchar(50) NOT NULL DEFAULT '0',
  `fk_genero` int(11) NOT NULL DEFAULT 0,
  `fk_departamento` int(11) NOT NULL DEFAULT 0,
  `fk_municipio` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_paciente`
--

INSERT INTO `tbl_paciente` (`id_paciente`, `fk_tipo_documento`, `documento`, `nombre1`, `nombre2`, `apellido1`, `apellido2`, `fk_genero`, `fk_departamento`, `fk_municipio`) VALUES
(1, 1, '123456789', 'jose', 'federico', 'martines', 'tono', 1, 1, 2),
(7, 2, '987654321', 'marithza', 'fernanda', 'perez', 'perez', 2, 1, 1),
(9, 1, '134585634', 'maicol', 'jose', 'gonzales', 'prada', 1, 2, 9),
(12, 1, '875148965', 'Jferson', 'Rozo', 'Covaleda ', 'Perez', 1, 5, 4),
(13, 2, '912837465', 'Yesica', 'M', 'Pizo', 'F', 2, 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_tipo_documento`
--

CREATE TABLE `tbl_tipo_documento` (
  `id_tipo_documento` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tbl_tipo_documento`
--

INSERT INTO `tbl_tipo_documento` (`id_tipo_documento`, `nombre`) VALUES
(1, 'Cedula de Ciudadnia '),
(2, 'Targeta de Identidad');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_usuario`
--

CREATE TABLE `tbl_usuario` (
  `id_usuario` int(11) NOT NULL,
  `documento` varchar(10) COLLATE utf8_spanish2_ci NOT NULL,
  `password` varchar(280) COLLATE utf8_spanish2_ci NOT NULL DEFAULT '0',
  `rol` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish2_ci;

--
-- Volcado de datos para la tabla `tbl_usuario`
--

INSERT INTO `tbl_usuario` (`id_usuario`, `documento`, `password`, `rol`) VALUES
(41091, '1084869277', '$argon2i$v=19$m=65536,t=4,p=1$MWpIY1JrVVlXQlU2Vkw2eg$uG9tSl/hUysS//IeqvVGJ+T7NdR7zD+ZjpBxZy2rg4Q', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `tbl_departamentos`
--
ALTER TABLE `tbl_departamentos`
  ADD PRIMARY KEY (`id_departamentos`);

--
-- Indices de la tabla `tbl_genero`
--
ALTER TABLE `tbl_genero`
  ADD PRIMARY KEY (`id_genero`);

--
-- Indices de la tabla `tbl_municipios`
--
ALTER TABLE `tbl_municipios`
  ADD PRIMARY KEY (`id_municipio`),
  ADD KEY `fk_departamento` (`fk_departamento`);

--
-- Indices de la tabla `tbl_paciente`
--
ALTER TABLE `tbl_paciente`
  ADD PRIMARY KEY (`id_paciente`),
  ADD KEY `fk_tipo_documento` (`fk_tipo_documento`),
  ADD KEY `fk_genero` (`fk_genero`),
  ADD KEY `fk_departamento` (`fk_departamento`),
  ADD KEY `fk_municipio` (`fk_municipio`);

--
-- Indices de la tabla `tbl_tipo_documento`
--
ALTER TABLE `tbl_tipo_documento`
  ADD PRIMARY KEY (`id_tipo_documento`);

--
-- Indices de la tabla `tbl_usuario`
--
ALTER TABLE `tbl_usuario`
  ADD PRIMARY KEY (`id_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `tbl_departamentos`
--
ALTER TABLE `tbl_departamentos`
  MODIFY `id_departamentos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tbl_genero`
--
ALTER TABLE `tbl_genero`
  MODIFY `id_genero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tbl_municipios`
--
ALTER TABLE `tbl_municipios`
  MODIFY `id_municipio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `tbl_paciente`
--
ALTER TABLE `tbl_paciente`
  MODIFY `id_paciente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `tbl_tipo_documento`
--
ALTER TABLE `tbl_tipo_documento`
  MODIFY `id_tipo_documento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tbl_usuario`
--
ALTER TABLE `tbl_usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41092;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `tbl_municipios`
--
ALTER TABLE `tbl_municipios`
  ADD CONSTRAINT `FK_tbl_municipios_tbl_departamentos` FOREIGN KEY (`fk_departamento`) REFERENCES `tbl_departamentos` (`id_departamentos`);

--
-- Filtros para la tabla `tbl_paciente`
--
ALTER TABLE `tbl_paciente`
  ADD CONSTRAINT `FK_tbl_paciente_tbl_departamentos` FOREIGN KEY (`fk_departamento`) REFERENCES `tbl_departamentos` (`id_departamentos`),
  ADD CONSTRAINT `FK_tbl_paciente_tbl_genero` FOREIGN KEY (`fk_genero`) REFERENCES `tbl_genero` (`id_genero`),
  ADD CONSTRAINT `FK_tbl_paciente_tbl_municipios` FOREIGN KEY (`fk_municipio`) REFERENCES `tbl_municipios` (`id_municipio`),
  ADD CONSTRAINT `FK_tbl_paciente_tbl_tipo_documento` FOREIGN KEY (`fk_tipo_documento`) REFERENCES `tbl_tipo_documento` (`id_tipo_documento`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

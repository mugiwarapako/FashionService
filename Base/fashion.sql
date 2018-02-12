-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 18-01-2018 a las 02:32:38
-- Versión del servidor: 10.1.16-MariaDB
-- Versión de PHP: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `fashion`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evento`
--

CREATE TABLE `evento` (
  `id` int(8) NOT NULL,
  `nombreEvento` varchar(150) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `fecha` timestamp NULL DEFAULT NULL,
  `numeroLugares` int(8) DEFAULT NULL,
  `numeroParticipantes` int(8) DEFAULT NULL,
  `hora` time DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `evento`
--

INSERT INTO `evento` (`id`, `nombreEvento`, `direccion`, `fecha`, `numeroLugares`, `numeroParticipantes`, `hora`) VALUES
(11, 'Gala', 'SAASsssD', '2018-01-28 01:00:00', 200, 150, '08:00:00'),
(12, 'Gala', 'SAASsssssssssD', '2018-01-28 01:00:00', 200, 150, '08:00:00'),
(13, 'Gala', 'eessssD', '2018-01-28 01:00:00', 200, 150, '08:00:00'),
(17, NULL, 'zxczxc', '0000-00-00 00:00:00', 2343, 1, NULL),
(18, 'dsf', 'sdf', '0000-00-00 00:00:00', 4, 1, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modelo`
--

CREATE TABLE `modelo` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `imagen` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `id_evento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `modelo`
--

INSERT INTO `modelo` (`id`, `descripcion`, `imagen`, `id_evento`) VALUES
(1, 'verano', '', 11),
(2, 'invierno', '', 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(8) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `apellidoP` varchar(100) DEFAULT NULL,
  `apellidoM` varchar(100) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `telefono` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `nombre`, `apellidoP`, `apellidoM`, `correo`, `telefono`) VALUES
(1, 'Francisco', 'Diaz', 'Castillo', 'pakodiazcastillo@gmail.com', '5523435434'),
(5, 'Francisco', 'Diaz', 'Castillo', 'pakodiazcasti@gmail.com', '5523435434'),
(6, 'Francisco', 'Diaz', 'Castillo', 'pakodiazcastsi@gmail.com', '5523435434'),
(7, 'Francisco', 'Diaz', 'Castillo', 'pakodiazcastssi@gmail.com', '5523435434'),
(8, 'Pamela', 'Velasco', 'Diaz', 'pam@gmail.com', '22320991'),
(9, 'Pamela', 'Gutierrez', 'Diaz', 'pam@gmail.com', '22320991'),
(10, 'sadsss', NULL, NULL, 'pako@gmail.com', '23234324'),
(11, 'as', NULL, NULL, 'pa@gmail.com', '445678'),
(12, 'sss', NULL, NULL, 'as@gmail.com', '456'),
(13, 'd', NULL, NULL, 'as@d', '55'),
(14, 'Pamela', NULL, NULL, 'puuam@gmail.com', '22320991'),
(15, 'Pamela', NULL, NULL, 'puuiiim@gmail.com', '22320991'),
(16, 'xzzxczxc', NULL, NULL, 'jk@sdf.com', '4564');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_evento`
--

CREATE TABLE `usuario_evento` (
  `id_usuario` int(11) DEFAULT NULL,
  `id_evento` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuario_evento`
--

INSERT INTO `usuario_evento` (`id_usuario`, `id_evento`) VALUES
(1, 11),
(5, 12),
(1, 11),
(5, 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario_modelo`
--

CREATE TABLE `usuario_modelo` (
  `id_usuario` int(11) NOT NULL,
  `id_modelo` int(11) NOT NULL,
  `calf_arriba` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `calf_media` varchar(255) COLLATE utf8_spanish_ci NOT NULL,
  `calif_bajo` varchar(255) COLLATE utf8_spanish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuario_modelo`
--

INSERT INTO `usuario_modelo` (`id_usuario`, `id_modelo`, `calf_arriba`, `calf_media`, `calif_bajo`) VALUES
(1, 1, '1', '1', '1'),
(6, 2, '2', '2', '2'),
(1, 1, '2', '1', '1'),
(1, 1, '1', '2', '1');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `evento`
--
ALTER TABLE `evento`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `modelo`
--
ALTER TABLE `modelo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_evento` (`id_evento`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario_evento`
--
ALTER TABLE `usuario_evento`
  ADD KEY `fk_sisg_u1` (`id_evento`),
  ADD KEY `fk_sisg_u2` (`id_usuario`);

--
-- Indices de la tabla `usuario_modelo`
--
ALTER TABLE `usuario_modelo`
  ADD KEY `fk_usuario` (`id_usuario`),
  ADD KEY `fk_modelo` (`id_modelo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `evento`
--
ALTER TABLE `evento`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT de la tabla `modelo`
--
ALTER TABLE `modelo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `modelo`
--
ALTER TABLE `modelo`
  ADD CONSTRAINT `fk_evento` FOREIGN KEY (`id_evento`) REFERENCES `evento` (`id`);

--
-- Filtros para la tabla `usuario_evento`
--
ALTER TABLE `usuario_evento`
  ADD CONSTRAINT `fk_sisg_u1` FOREIGN KEY (`id_evento`) REFERENCES `evento` (`id`),
  ADD CONSTRAINT `fk_sisg_u2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`);

--
-- Filtros para la tabla `usuario_modelo`
--
ALTER TABLE `usuario_modelo`
  ADD CONSTRAINT `fk_modelo` FOREIGN KEY (`id_modelo`) REFERENCES `modelo` (`id`),
  ADD CONSTRAINT `fk_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

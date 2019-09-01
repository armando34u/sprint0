-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 01-09-2019 a las 09:24:02
-- Versión del servidor: 5.7.27-0ubuntu0.18.04.1
-- Versión de PHP: 7.2.21-1+ubuntu18.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `Niño_Mensajero`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carta`
--

CREATE TABLE `carta` (
  `codigo_carta` int(11) NOT NULL,
  `cartacol` varchar(45) DEFAULT NULL,
  `imagen_idimagennombre` int(11) DEFAULT NULL,
  `escritor_codigo_escritor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `escritor`
--

CREATE TABLE `escritor` (
  `codigo_escritor` int(11) NOT NULL,
  `sobre_nombre` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `escritor_has_carta`
--

CREATE TABLE `escritor_has_carta` (
  `escritor_codigo_escritor` int(11) NOT NULL,
  `carta_codigo_carta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `imagen`
--

CREATE TABLE `imagen` (
  `idimagennombre` int(11) NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `tipo` varchar(45) DEFAULT NULL,
  `imagencol` bigint(12) DEFAULT NULL,
  `pixel` tinyblob
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respuesta`
--

CREATE TABLE `respuesta` (
  `codigo_respuesta` int(11) NOT NULL,
  `respuesta` varchar(100) DEFAULT NULL,
  `carta_codigo_carta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carta`
--
ALTER TABLE `carta`
  ADD PRIMARY KEY (`codigo_carta`),
  ADD KEY `fk_carta_imagen` (`imagen_idimagennombre`),
  ADD KEY `fk_carta_escritor1` (`escritor_codigo_escritor`);

--
-- Indices de la tabla `escritor`
--
ALTER TABLE `escritor`
  ADD PRIMARY KEY (`codigo_escritor`);

--
-- Indices de la tabla `escritor_has_carta`
--
ALTER TABLE `escritor_has_carta`
  ADD PRIMARY KEY (`escritor_codigo_escritor`,`carta_codigo_carta`),
  ADD KEY `fk_escritor_has_carta_carta1` (`carta_codigo_carta`);

--
-- Indices de la tabla `imagen`
--
ALTER TABLE `imagen`
  ADD PRIMARY KEY (`idimagennombre`);

--
-- Indices de la tabla `respuesta`
--
ALTER TABLE `respuesta`
  ADD PRIMARY KEY (`codigo_respuesta`),
  ADD KEY `fk_respuesta_carta1` (`carta_codigo_carta`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `carta`
--
ALTER TABLE `carta`
  ADD CONSTRAINT `fk_carta_escritor1` FOREIGN KEY (`escritor_codigo_escritor`) REFERENCES `escritor` (`codigo_escritor`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_carta_imagen` FOREIGN KEY (`imagen_idimagennombre`) REFERENCES `imagen` (`idimagennombre`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `escritor_has_carta`
--
ALTER TABLE `escritor_has_carta`
  ADD CONSTRAINT `fk_escritor_has_carta_carta1` FOREIGN KEY (`carta_codigo_carta`) REFERENCES `carta` (`codigo_carta`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_escritor_has_carta_escritor1` FOREIGN KEY (`escritor_codigo_escritor`) REFERENCES `escritor` (`codigo_escritor`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `respuesta`
--
ALTER TABLE `respuesta`
  ADD CONSTRAINT `fk_respuesta_carta1` FOREIGN KEY (`carta_codigo_carta`) REFERENCES `carta` (`codigo_carta`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 12-08-2022 a las 20:46:44
-- Versión del servidor: 5.7.36
-- Versión de PHP: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `mydb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dueno`
--

DROP TABLE IF EXISTS `dueno`;
CREATE TABLE IF NOT EXISTS `dueno` (
  `DNI` int(11) NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Apellido` varchar(45) NOT NULL,
  `Telefono` int(11) NOT NULL,
  `Direccion` varchar(200) NOT NULL,
  PRIMARY KEY (`DNI`),
  UNIQUE KEY `DNI_UNIQUE` (`DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial`
--

DROP TABLE IF EXISTS `historial`;
CREATE TABLE IF NOT EXISTS `historial` (
  `ID_Historial` int(11) NOT NULL AUTO_INCREMENT,
  `Fecha` date NOT NULL,
  `Descripcion` varchar(200) NOT NULL,
  `Monto` float NOT NULL,
  `Perro_ID_Perro` int(11) NOT NULL,
  PRIMARY KEY (`ID_Historial`),
  UNIQUE KEY `ID_Historial_UNIQUE` (`ID_Historial`),
  KEY `fk_Historial_Perro_idx` (`Perro_ID_Perro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perro`
--

DROP TABLE IF EXISTS `perro`;
CREATE TABLE IF NOT EXISTS `perro` (
  `ID_Perro` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) NOT NULL,
  `Fecha_nac` date NOT NULL,
  `Sexo` varchar(45) NOT NULL,
  `Dueno_DNI` int(11) NOT NULL,
  PRIMARY KEY (`ID_Perro`),
  UNIQUE KEY `ID_Perro_UNIQUE` (`ID_Perro`),
  KEY `fk_Perro_Dueno_idx` (`Dueno_DNI`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `historial`
--
ALTER TABLE `historial`
  ADD CONSTRAINT `fk_Historial_Perro1` FOREIGN KEY (`Perro_ID_Perro`) REFERENCES `perro` (`ID_Perro`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `perro`
--
ALTER TABLE `perro`
  ADD CONSTRAINT `fk_Perro_Dueno` FOREIGN KEY (`Dueno_DNI`) REFERENCES `dueno` (`DNI`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;


--
-- Insert de datos genericos
--
INSERT INTO `dueno` (`DNI`, `Nombre`, `Apellido`, `Telefono`, `Direccion`) VALUES ('23444553', 'Raul', 'Gomez', '1155556666', 'Montes de Oca 234'), ('30554332', 'Paula', 'Alvarez', '1133334444', 'Alsina 1120');

--
-- Ejercicio 2 
--- Valor NULL de ID_Perro ya que es AUTO_INCREMENT
--

INSERT INTO `perro` (`ID_Perro`, `Nombre`, `Fecha_nac`, `Sexo`, `Dueno_DNI`) VALUES (NULL, 'Solo', '2019-04-04', 'Macho', '23444553');


--
-- Ejercicio 9
-- Escriba una consulta que permita actualizar la dirección de un dueño. Su nueva dirección es Libertad 123
--

UPDATE `dueno` SET `Direccion` = 'Libertad 123' WHERE `dueno`.`DNI` = 23444553;


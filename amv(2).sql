-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-06-2023 a las 13:09:24
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
-- Base de datos: `amv`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evolucion_piz`
--

CREATE TABLE `evolucion_piz` (
  `id_var_piz` int(4) NOT NULL,
  `id_pac` varchar(4) NOT NULL,
  `tiempo_real` time(6) NOT NULL,
  `estado` varchar(5) NOT NULL,
  `numpiz` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `evolucion_piz`
--

INSERT INTO `evolucion_piz` (`id_var_piz`, `id_pac`, `tiempo_real`, `estado`, `numpiz`) VALUES
(1, '1', '00:00:00.000000', 'pend', 1),
(2, '1', '00:00:40.000000', 'pend', 1),
(3, '1', '00:00:12.000000', 'real', 1),
(3, '2', '838:59:59.999999', 'pend', 1),
(3, '3', '00:00:18.000000', 'pend', 1),
(3, '4', '00:00:34.000000', 'real', 1),
(3, '7', '00:00:00.000000', 'pend', 1),
(4, '2', '00:00:40.000000', 'pend', 1),
(5, '1', '00:00:57.000000', 'pend', 1),
(6, '1', '00:00:20.000000', 'pend', 2),
(6, '2', '00:00:40.000000', 'pend', 2),
(7, '2', '00:00:40.000000', 'pend', 2),
(8, '1', '00:14:00.000000', 'pend', 2),
(10, '1', '00:40:00.000000', 'pend', 2),
(11, '1', '00:00:20.000000', 'pend', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evolucion_vict`
--

CREATE TABLE `evolucion_vict` (
  `idvict_e` varchar(4) NOT NULL,
  `codigo_color` varchar(4) NOT NULL,
  `tiempo_codigo` time(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `evolucion_vict`
--

INSERT INTO `evolucion_vict` (`idvict_e`, `codigo_color`, `tiempo_codigo`) VALUES
('1', 'am', '00:01:23.000000'),
('10', 'ver', '00:00:00.000000'),
('100', 'am', '00:00:40.000000'),
('11', 'am', '02:35:52.000000'),
('12', 'am', '00:36:17.000000'),
('13', 'roj', '00:00:00.000000'),
('14', 'am', '00:00:32.000000'),
('15', 'neg', '00:00:05.000000'),
('16', 'am', '00:00:10.000000'),
('17', 'roj', '00:00:00.000000'),
('18', 'ver', '00:00:32.000000'),
('19', 'am', '00:00:17.000000'),
('2', 'am', '00:00:12.000000'),
('20', 'roj', '00:00:05.000000'),
('21', 'am', '00:00:40.000000'),
('22', 'ver', '00:00:40.000000'),
('23', 'ver', '00:00:40.000000'),
('24', 'am', '00:00:40.000000'),
('25', 'am', '00:00:40.000000'),
('26', 'roj', '00:00:40.000000'),
('27', 'am', '00:00:40.000000'),
('28', 'am', '00:00:40.000000'),
('29', 'ver', '00:00:40.000000'),
('3', 'ver', '00:00:00.000000'),
('30', 'am', '00:00:40.000000'),
('31', 'am', '00:00:40.000000'),
('32', 'roj', '00:00:20.000000'),
('33', 'roj', '00:00:20.000000'),
('34', 'am', '00:00:40.000000'),
('35', 'ver', '00:00:00.000000'),
('36', 'am', '00:00:40.000000'),
('37', 'am', '00:00:40.000000'),
('38', 'am', '00:00:40.000000'),
('39', 'neg', '00:01:20.000000'),
('4', 'am', '00:00:00.000000'),
('40', 'roj', '00:00:20.000000'),
('41', 'roj', '00:00:10.000000'),
('42', 'am', '00:00:40.000000'),
('43', 'ver', '00:00:00.000000'),
('44', 'neg', '00:01:20.000000'),
('45', 'roj', '00:00:20.000000'),
('46', 'roj', '00:00:20.000000'),
('47', 'am', '00:00:40.000000'),
('48', 'ver', '00:00:00.000000'),
('49', 'am', '00:00:40.000000'),
('5', 'am', '00:02:56.000000'),
('50', 'am', '00:00:40.000000'),
('51', 'roj', '00:00:20.000000'),
('52', 'ver', '00:00:00.000000'),
('53', 'am', '00:00:40.000000'),
('54', 'ver', '00:00:00.000000'),
('55', 'ver', '00:00:00.000000'),
('56', 'ver', '00:00:00.000000'),
('57', 'am', '00:00:40.000000'),
('58', 'am', '00:00:40.000000'),
('59', 'roj', '00:00:10.000000'),
('6', 'neg', '00:32:51.000000'),
('60', 'neg', '00:01:20.000000'),
('61', 'neg', '00:01:20.000000'),
('62', 'neg', '00:01:20.000000'),
('63', 'neg', '00:01:20.000000'),
('64', 'am', '00:00:00.000000'),
('65', 'roj', '00:00:20.000000'),
('66', 'neg', '00:01:20.000000'),
('67', 'roj', '00:00:10.000000'),
('68', 'roj', '00:00:10.000000'),
('69', 'roj', '00:00:10.000000'),
('7', 'am', '00:39:51.000000'),
('70', 'neg', '00:01:20.000000'),
('71', 'neg', '00:01:20.000000'),
('72', 'roj', '00:00:15.000000'),
('73', 'ver', '00:00:00.000000'),
('74', 'neg', '00:01:20.000000'),
('75', 'am', '00:00:40.000000'),
('76', 'am', '00:00:40.000000'),
('77', 'am', '00:00:40.000000'),
('78', 'am', '00:00:40.000000'),
('79', 'am', '00:00:40.000000'),
('8', 'roj', '00:00:45.000000'),
('80', 'ver', '00:00:00.000000'),
('81', 'ver', '00:00:00.000000'),
('82', 'neg', '00:01:20.000000'),
('83', 'neg', '00:01:20.000000'),
('84', 'neg', '00:01:20.000000'),
('85', 'neg', '00:01:20.000000'),
('86', 'neg', '00:01:20.000000'),
('87', 'neg', '00:01:20.000000'),
('88', 'neg', '00:01:20.000000'),
('89', 'neg', '00:01:20.000000'),
('9', 'neg', '00:00:06.000000'),
('90', 'neg', '00:01:20.000000'),
('91', 'neg', '00:01:20.000000'),
('92', 'neg', '00:01:20.000000'),
('93', 'neg', '00:01:20.000000'),
('94', 'ver', '00:00:00.000000'),
('95', 'am', '00:00:40.000000'),
('96', 'ver', '00:00:00.000000'),
('97', 'roj', '00:00:15.000000'),
('98', 'ver', '00:00:00.000000'),
('99', 'roj', '00:00:15.000000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pizarras`
--

CREATE TABLE `pizarras` (
  `variables` varchar(20) NOT NULL,
  `pizarra` int(2) NOT NULL,
  `tiempo_vars` time(6) NOT NULL,
  `id_var` int(20) NOT NULL,
  `id_v_piz` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pizarras`
--

INSERT INTO `pizarras` (`variables`, `pizarra`, `tiempo_vars`, `id_var`, `id_v_piz`) VALUES
('Drenaje toracico', 1, '00:05:00.000000', 1, '16'),
('Drenaje toracico', 1, '00:20:00.000000', 1, '46'),
('Drenaje toracico', 1, '00:10:00.000000', 1, '67'),
('Compresion sangrado', 1, '00:40:00.000000', 2, '25'),
('Compresión sangrado', 1, '00:40:00.000000', 2, '28'),
('Compresión sangrado', 1, '00:20:00.000000', 2, '32'),
('Compresión sangrado', 1, '00:10:00.000000', 2, '40'),
('Compresión sangrado', 1, '00:10:00.000000', 2, '41'),
('Compresión sangrado', 1, '00:40:00.000000', 2, '49'),
('Compresión sangrado', 1, '00:40:00.000000', 2, '77'),
('Compresión sangrado', 1, '00:40:00.000000', 2, '95'),
('Collarin cervical', 1, '00:40:00.503000', 3, '1'),
('Collarin cervical', 1, '00:00:40.000000', 3, '10'),
('Collarin cervical', 1, '00:40:00.000000', 3, '100'),
('Collarin cervical', 1, '00:20:00.000000', 3, '11'),
('Collarin cervical', 1, '01:00:00.000000', 3, '12'),
('Collarin cervical', 1, '01:00:00.000000', 3, '13'),
('Collarin cervical', 1, '00:05:00.000000', 3, '14'),
('Collarin cervical', 1, '00:05:00.000000', 3, '15'),
('Collarin cervical', 1, '00:05:00.000000', 3, '16'),
('Collarin cervical', 1, '01:00:00.000000', 3, '17'),
('Collarin cervical', 1, '01:00:00.000000', 3, '18'),
('Collarin cervical', 1, '00:20:00.000000', 3, '19'),
('Collarin cervical', 1, '00:00:00.000000', 3, '2'),
('Collarin cervical', 1, '00:40:00.000000', 3, '20'),
('Collarin cervical', 1, '00:40:00.000000', 3, '21'),
('Collarin cervical', 1, '01:00:00.000000', 3, '22'),
('Collarin cervical', 1, '01:00:00.000000', 3, '23'),
('Collarin cervical', 1, '00:40:00.000000', 3, '24'),
('Collarin cervical', 1, '00:40:00.000000', 3, '25'),
('Collarin cervical', 1, '00:20:00.000000', 3, '26'),
('Collarin cervical', 1, '00:40:00.000000', 3, '27'),
('Collarin cervical', 1, '00:40:00.000000', 3, '28'),
('Collarin cervical', 1, '01:00:00.000000', 3, '29'),
('Collarin cervical', 1, '00:00:07.000000', 3, '3'),
('Collarin cervical', 1, '00:40:00.000000', 3, '30'),
('Collarin cervical', 1, '00:40:00.000000', 3, '31'),
('Collarin cervical', 1, '00:40:00.000000', 3, '32'),
('Collarin cervical', 1, '00:20:00.000000', 3, '33'),
('Collarin cervical', 1, '00:40:00.000000', 3, '34'),
('Collarin cervical', 1, '01:00:00.000000', 3, '35'),
('Collarin cervical', 1, '00:40:00.000000', 3, '36'),
('Collarin cervical', 1, '00:40:00.000000', 3, '37'),
('Collarin cervical', 1, '00:40:00.000000', 3, '38'),
('Collarin cervical', 1, '01:30:00.000000', 3, '39'),
('Collarin cervical', 1, '00:00:22.000000', 3, '4'),
('Collarin cervical', 1, '00:10:00.000000', 3, '40'),
('Collarin cervical', 1, '00:10:00.000000', 3, '41'),
('Collarin cervical', 1, '00:40:00.000000', 3, '42'),
('Collarin cervical', 1, '01:00:00.000000', 3, '43'),
('Collarin cervical', 1, '01:30:00.000000', 3, '44'),
('Collarin cervical', 1, '00:20:00.000000', 3, '45'),
('Collarin cervical', 1, '00:20:00.000000', 3, '46'),
('Collarin cervical', 1, '00:40:00.000000', 3, '47'),
('Collarin cervical', 1, '01:00:00.000000', 3, '48'),
('Collarin cervical', 1, '00:40:00.000000', 3, '49'),
('Collarin cervical', 1, '00:00:25.000000', 3, '5'),
(' Collarin cervical', 1, '00:20:00.000000', 3, '50'),
('Collarin cervical', 1, '00:20:00.000000', 3, '51'),
('Collarin cervical', 1, '01:00:00.000000', 3, '52'),
('Collarin cervical', 1, '00:40:00.000000', 3, '53'),
('Collarin cervical', 1, '01:00:00.000000', 3, '54'),
('Collarin cervical', 1, '01:00:00.000000', 3, '55'),
('Collarin cervical', 1, '01:00:00.000000', 3, '56'),
('Collarin cervical', 1, '00:40:00.000000', 3, '57'),
('Collarin cervical', 1, '00:40:00.000000', 3, '58'),
('Collarin cervical', 1, '00:10:00.000000', 3, '59'),
('Collarin cervical', 1, '00:40:00.000000', 3, '6'),
('Collarin cervical', 1, '00:40:00.000000', 3, '64'),
('Collarin cervical', 1, '00:20:00.000000', 3, '65'),
('Collarin cervical', 1, '00:10:00.000000', 3, '67'),
('Collarin cervical', 1, '00:10:00.000000', 3, '68'),
('Collarin cervical', 1, '00:20:00.000000', 3, '69'),
('Collarin cervical', 1, '00:40:00.000000', 3, '7'),
('Collarin cervical', 1, '00:20:00.000000', 3, '72'),
('Collarin cervical', 1, '01:00:00.000000', 3, '73'),
('Collarin cervical', 1, '00:40:00.000000', 3, '75'),
('Collarin cervical', 1, '00:40:00.000000', 3, '76'),
('Collarin cervical', 1, '00:40:00.000000', 3, '77'),
('Collarin cervical', 1, '00:40:00.000000', 3, '78'),
('Collarin cervical', 1, '00:40:00.000000', 3, '79'),
('Collarin cervical', 1, '01:00:00.000000', 3, '8'),
('Collarin cervical', 1, '01:00:00.000000', 3, '80'),
('Collarin cervical', 1, '01:00:00.000000', 3, '81'),
('Collarin cervical', 1, '01:00:00.000000', 3, '9'),
('Collarin cervical', 1, '01:00:00.000000', 3, '94'),
('Collarin cervical', 1, '00:40:00.000000', 3, '95'),
('Collarin cervical', 1, '01:00:00.000000', 3, '96'),
('Collarin cervical', 1, '00:20:00.000000', 3, '97'),
('Collarin cervical', 1, '01:00:00.000000', 3, '98'),
('Collarin cervical', 1, '00:10:00.000000', 3, '99'),
('Guedel', 1, '00:20:00.000000', 4, '19'),
('Guedel', 1, '00:20:00.000000', 4, '45'),
('Guedel', 1, '00:20:00.000000', 4, '46'),
('PLS', 1, '00:10:00.000000', 5, '14'),
('PLS', 1, '00:20:00.000000', 5, '15'),
('PLS', 1, '00:10:00.000000', 5, '16'),
('PLS', 1, '00:20:00.000000', 5, '19'),
('PLS', 1, '00:20:00.000000', 5, '26'),
('PLS', 1, '00:20:00.000000', 5, '32'),
('PLS', 1, '00:20:00.000000', 5, '33'),
('PLS', 1, '00:10:00.000000', 5, '40'),
('PLS', 1, '00:10:00.000000', 5, '41'),
('PLS', 1, '00:20:00.000000', 5, '45'),
('PLS', 1, '00:20:00.000000', 5, '46'),
('PLS', 1, '00:10:00.000000', 5, '59'),
('PLS', 1, '00:10:00.000000', 5, '68'),
('PLS', 1, '00:20:00.000000', 5, '72'),
('PLS', 1, '00:10:00.000000', 5, '99'),
('Constantes', 2, '838:59:59.999999', 6, '1'),
('Constantes', 2, '06:00:00.000000', 6, '10'),
('Constantes', 2, '00:40:00.000000', 6, '100'),
('Constantes', 2, '06:00:00.000000', 6, '11'),
('Constantes', 2, '06:00:00.000000', 6, '12'),
('Constantes', 2, '06:00:00.000000', 6, '13'),
('Constantes', 2, '06:00:00.000000', 6, '17'),
('Constantes', 2, '06:00:00.000000', 6, '18'),
('Constantes', 2, '838:59:59.999999', 6, '2'),
('Constantes', 2, '06:00:00.000000', 6, '20'),
('Constantes', 2, '06:00:00.000000', 6, '21'),
('Constantes', 2, '01:00:00.000000', 6, '23'),
('Constantes', 2, '01:20:00.000000', 6, '24'),
('Constantes', 2, '01:20:00.000000', 6, '25'),
('Constantes', 2, '06:00:00.000000', 6, '27'),
('Constantes', 2, '06:00:00.000000', 6, '28'),
('Constantes', 2, '06:00:00.000000', 6, '29'),
('Constantes', 2, '06:00:00.516000', 6, '3'),
('Constantes', 2, '06:00:00.000000', 6, '30'),
('Constantes', 2, '06:00:00.000000', 6, '31'),
('Constantes', 2, '06:00:00.000000', 6, '34'),
('Constantes', 2, '06:00:00.000000', 6, '35'),
('Constantes', 2, '06:00:00.000000', 6, '36'),
('Constantes', 2, '06:00:00.000000', 6, '37'),
('Constantes', 2, '06:00:00.000000', 6, '38'),
('Constantes', 2, '06:00:00.000000', 6, '4'),
('Constantes', 2, '06:00:00.000000', 6, '42'),
('Constantes', 2, '06:00:00.000000', 6, '43'),
('Constantes', 2, '06:00:00.000000', 6, '47'),
('Constantes', 2, '06:00:00.000000', 6, '48'),
('Constantes', 2, '06:00:00.000000', 6, '49'),
('Constantes', 2, '06:00:00.000000', 6, '5'),
('Constantes', 2, '06:00:00.000000', 6, '50'),
('Constantes', 2, '00:40:00.000000', 6, '51'),
('Constantes', 2, '06:00:00.000000', 6, '52'),
('Constantes', 2, '01:00:00.000000', 6, '53'),
('Constantes', 2, '06:00:00.000000', 6, '54'),
('Constantes', 2, '06:00:00.000000', 6, '55'),
('Constantes', 2, '06:00:00.000000', 6, '56'),
('Constantes', 2, '01:20:00.000000', 6, '57'),
('Constantes', 2, '02:00:00.000000', 6, '58'),
('Constantes', 2, '00:40:00.637000', 6, '6'),
('Constantes', 2, '00:40:00.000000', 6, '64'),
('Constantes', 2, '01:00:00.000000', 6, '65'),
('Constantes', 2, '00:40:00.000000', 6, '67'),
('Constantes', 2, '06:00:00.000000', 6, '7'),
('Constantes', 2, '06:00:00.000000', 6, '73'),
('Constantes', 2, '01:00:00.000000', 6, '75'),
('Constantes', 2, '06:00:00.000000', 6, '76'),
('Constantes', 2, '00:40:00.000000', 6, '78'),
('Constantes', 2, '06:00:00.000000', 6, '79'),
('Constantes', 2, '06:00:00.000000', 6, '8'),
('Constantes', 2, '00:40:00.000000', 6, '80'),
('Constantes', 2, '06:00:00.000000', 6, '81'),
('Constantes', 2, '06:00:00.000000', 6, '9'),
('Constantes', 2, '06:00:00.000000', 6, '94'),
('Constantes', 2, '06:00:00.000000', 6, '95'),
('Constantes', 2, '06:00:00.000000', 6, '96'),
('Constantes', 2, '00:40:00.000000', 6, '97'),
('Constantes', 2, '06:00:00.000000', 6, '98'),
('Constantes', 2, '00:40:00.000000', 6, '99'),
('Via venosa', 2, '838:59:59.999999', 7, '1'),
('Via venosa', 2, '06:00:00.000000', 7, '10'),
('Via venosa', 2, '06:00:00.000000', 7, '11'),
('Via venosa', 2, '06:00:00.000000', 7, '12'),
('Via venosa', 2, '06:00:00.000000', 7, '13'),
('Via venosa', 2, '06:00:00.000000', 7, '17'),
('Via venosa', 2, '06:00:00.000000', 7, '2'),
('Via venosa', 2, '06:00:00.000000', 7, '3'),
('Via venosa', 2, '06:00:00.000000', 7, '4'),
('Via venosa', 2, '06:00:00.000000', 7, '47'),
('Via venosa', 2, '06:00:00.000000', 7, '48'),
('Via venosa', 2, '06:00:00.000000', 7, '49'),
('Via venosa', 2, '06:00:00.000000', 7, '5'),
('Via venosa', 2, '06:00:00.000000', 7, '50'),
('Via venosa', 2, '00:40:00.000000', 7, '51'),
('Via venosa', 2, '06:00:00.000000', 7, '52'),
('Via venosa', 2, '01:00:00.000000', 7, '53'),
('Via venosa', 2, '06:00:00.000000', 7, '54'),
('Via venosa', 2, '06:00:00.000000', 7, '55'),
('Via venosa', 2, '06:00:00.000000', 7, '56'),
('Via venosa', 2, '01:20:00.000000', 7, '57'),
('Via venosa', 2, '02:00:00.000000', 7, '58'),
('Via venosa', 2, '00:40:00.000000', 7, '64'),
('Via venosa', 2, '01:00:00.000000', 7, '65'),
('Via venosa', 2, '00:40:00.000000', 7, '67'),
('Via venosa', 2, '06:00:00.000000', 7, '7'),
('Via venosa', 2, '06:00:00.000000', 7, '8'),
('Via venosa', 2, '06:00:00.000000', 7, '9'),
('Analgesia', 2, '06:00:00.000000', 8, '47'),
('Analgesia', 2, '06:00:00.000000', 8, '48'),
('Analgesia', 2, '06:00:00.000000', 8, '49'),
('Analgesia', 2, '06:00:00.000000', 8, '50'),
('Analgesia', 2, '00:40:00.000000', 8, '51'),
('Analgesia', 2, '06:00:00.000000', 8, '52'),
('Analgesia', 2, '01:00:00.000000', 8, '53'),
('Analgesia', 2, '06:00:00.000000', 8, '54'),
('Analgesia', 2, '06:00:00.000000', 8, '55'),
('Analgesia', 2, '06:00:00.000000', 8, '56'),
('Analgesia', 2, '01:20:00.000000', 8, '57'),
('Analgesia', 2, '02:00:00.000000', 8, '58'),
('Analgesia', 2, '00:40:00.000000', 8, '64'),
('Analgesia', 2, '01:00:00.000000', 8, '65'),
('Analgesia', 2, '00:40:00.000000', 8, '67'),
('Paciente quirúrgico', 2, '00:40:00.000000', 10, '100'),
('Paciente quirúrgico', 2, '00:40:00.000000', 10, '16'),
('Paciente quirúrgico', 2, '00:40:00.000000', 10, '41'),
('Paciente quirúrgico', 2, '00:40:00.000000', 10, '51'),
('Paciente quirúrgico', 2, '00:40:00.000000', 10, '6'),
('Paciente quirúrgico', 2, '00:40:00.000000', 10, '67'),
('Paciente quirúrgico', 2, '00:40:00.000000', 10, '68'),
('Paciente quirúrgico', 2, '00:40:00.000000', 10, '69'),
('Paciente quirúrgico', 2, '00:40:00.000000', 10, '72'),
('Paciente quirúrgico', 2, '00:40:00.000000', 10, '78'),
('Helicoptero', 4, '00:20:00.000000', 11, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tiempos_piz`
--

CREATE TABLE `tiempos_piz` (
  `pizarra` int(2) NOT NULL,
  `id_pac` varchar(4) NOT NULL,
  `i_pizarra` time(6) NOT NULL,
  `f_pizarra` time(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tiempos_piz`
--

INSERT INTO `tiempos_piz` (`pizarra`, `id_pac`, `i_pizarra`, `f_pizarra`) VALUES
(1, '1', '00:01:00.000000', '00:00:00.000000'),
(1, '2', '00:01:00.000000', '00:00:00.000000'),
(2, '2', '00:04:00.000000', '00:00:00.000000'),
(1, '4', '00:01:00.000000', '00:00:34.305000'),
(1, '40', '00:04:00.000000', '00:00:26.233000'),
(1, '5', '00:01:00.000000', '00:00:37.923000'),
(1, '7', '00:01:00.000000', '00:00:00.000000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idusuario` varchar(4) NOT NULL,
  `puesto` varchar(20) NOT NULL,
  `login` varchar(8) NOT NULL,
  `password` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`idusuario`, `puesto`, `login`, `password`) VALUES
('1', 'director', 'd1', '1234'),
('10', 'director', 'd3', '1234'),
('11', 'director', 'd4', '1234'),
('12', 'instructor', 'i8', '1234'),
('13', 'instructor', 'i9', '1234'),
('14', 'instructor', 'i10', '1234'),
('15', 'instructor', 'i11', '1234'),
('16', 'supervisor', 's1', '1234'),
('17', 'supervisor', 's2', '1234'),
('2', 'instructor', 'i1', '1234'),
('3', 'instructor', 'i2', '1234'),
('4', 'director', 'd2', '1234'),
('5', 'instructor', 'i3', '1234'),
('6', 'instructor', 'i4', '1234'),
('7', 'instructor', 'i5', '1234'),
('8', 'instructor', 'i6', '1234'),
('9', 'instructor', 'i7', '1234');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `victimas`
--

CREATE TABLE `victimas` (
  `id_v` varchar(4) NOT NULL,
  `evol_v` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `victimas`
--

INSERT INTO `victimas` (`id_v`, `evol_v`) VALUES
('1', 'roj'),
('10', 'ver'),
('100', 'am'),
('11', 'am'),
('12', 'am'),
('13', 'roj'),
('14', 'am'),
('15', 'neg'),
('16', 'am'),
('17', 'roj'),
('18', 'ver'),
('19', 'am'),
('2', 'roj'),
('20', 'roj'),
('21', 'am'),
('22', 'ver'),
('23', 'ver'),
('24', 'am'),
('25', 'am'),
('26', 'roj'),
('27', 'am'),
('28', 'am'),
('29', 'ver'),
('3', 'ver'),
('30', 'am'),
('31', 'am'),
('32', 'roj'),
('33', 'roj'),
('34', 'am'),
('35', 'ver'),
('36', 'am'),
('37', 'am'),
('38', 'am'),
('39', 'neg'),
('4', 'am'),
('40', 'roj'),
('41', 'roj'),
('42', 'am'),
('43', 'ver'),
('44', 'neg'),
('45', 'roj'),
('46', 'roj'),
('47', 'am'),
('48', 'ver'),
('49', 'am'),
('5', 'am'),
('50', 'am'),
('51', 'roj'),
('52', 'ver'),
('53', 'am'),
('54', 'ver'),
('55', 'ver'),
('56', 'ver'),
('57', 'am'),
('58', 'am'),
('59', 'roj'),
('6', 'neg'),
('60', 'neg'),
('61', 'neg'),
('62', 'neg'),
('63', 'neg'),
('64', 'am'),
('65', 'roj'),
('66', 'neg'),
('67', 'roj'),
('68', 'roj'),
('69', 'roj'),
('7', 'roj'),
('70', 'neg'),
('71', 'neg'),
('72', 'roj'),
('73', 'ver'),
('74', 'neg'),
('75', 'am'),
('76', 'am'),
('77', 'am'),
('78', 'am'),
('79', 'am'),
('8', 'roj'),
('80', 'ver'),
('81', 'ver'),
('82', 'neg'),
('83', 'neg'),
('84', 'neg'),
('85', 'neg'),
('86', 'neg'),
('87', 'neg'),
('88', 'neg'),
('89', 'neg'),
('9', 'neg'),
('90', 'neg'),
('91', 'neg'),
('92', 'neg'),
('93', 'neg'),
('94', 'ver'),
('95', 'am'),
('96', 'ver'),
('97', 'roj'),
('98', 'ver'),
('99', 'roj');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `evolucion_piz`
--
ALTER TABLE `evolucion_piz`
  ADD PRIMARY KEY (`id_var_piz`,`id_pac`),
  ADD KEY `idp_evolucion` (`id_pac`);

--
-- Indices de la tabla `evolucion_vict`
--
ALTER TABLE `evolucion_vict`
  ADD PRIMARY KEY (`idvict_e`,`codigo_color`);

--
-- Indices de la tabla `pizarras`
--
ALTER TABLE `pizarras`
  ADD PRIMARY KEY (`id_var`,`id_v_piz`,`pizarra`) USING BTREE,
  ADD KEY `victima_victimas` (`id_v_piz`),
  ADD KEY `variables` (`variables`) USING BTREE;

--
-- Indices de la tabla `tiempos_piz`
--
ALTER TABLE `tiempos_piz`
  ADD PRIMARY KEY (`id_pac`,`pizarra`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idusuario`);

--
-- Indices de la tabla `victimas`
--
ALTER TABLE `victimas`
  ADD PRIMARY KEY (`id_v`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `evolucion_piz`
--
ALTER TABLE `evolucion_piz`
  ADD CONSTRAINT `idp_evolucion` FOREIGN KEY (`id_pac`) REFERENCES `evolucion_vict` (`idvict_e`);

--
-- Filtros para la tabla `pizarras`
--
ALTER TABLE `pizarras`
  ADD CONSTRAINT `idvaar` FOREIGN KEY (`id_var`) REFERENCES `evolucion_piz` (`id_var_piz`);

--
-- Filtros para la tabla `tiempos_piz`
--
ALTER TABLE `tiempos_piz`
  ADD CONSTRAINT `pacs` FOREIGN KEY (`id_pac`) REFERENCES `victimas` (`id_v`);

--
-- Filtros para la tabla `victimas`
--
ALTER TABLE `victimas`
  ADD CONSTRAINT `idv_evolucion` FOREIGN KEY (`id_v`) REFERENCES `evolucion_vict` (`idvict_e`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

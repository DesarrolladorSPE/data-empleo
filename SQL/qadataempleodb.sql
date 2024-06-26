-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 24-05-2024 a las 16:18:19
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `qadataempleodb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `graficas`
--

CREATE TABLE `graficas` (
  `id` int(11) NOT NULL,
  `TITULO_GRAFICA` text NOT NULL,
  `AÑO` int(4) NOT NULL,
  `MES` int(2) NOT NULL,
  `TIPO_DATOS` text NOT NULL,
  `TIPO_GRAFICA` text NOT NULL,
  `DESCRIPCION` longtext NOT NULL,
  `FECHA_CREACION` datetime NOT NULL DEFAULT current_timestamp(),
  `DATOS` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`DATOS`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `graficas`
--

INSERT INTO `graficas` (`id`, `TITULO_GRAFICA`, `AÑO`, `MES`, `TIPO_DATOS`, `TIPO_GRAFICA`, `DESCRIPCION`, `FECHA_CREACION`, `DATOS`) VALUES
(1, 'Gráfica de cotejamiento - Abril del 2024', 2024, 4, 'ofertasRegistradas', 'line', 'Grafica de pruebas', '2024-04-04 17:51:48', NULL),
(3, 'Grafica 1', 2024, 4, 'rangoSalarial', 'polarArea', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '2024-04-08 12:19:16', NULL),
(4, 'Grafica 2', 2024, 4, 'nivelEducativo', 'bar', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '2024-04-08 12:19:54', NULL),
(6, 'Grafica 3', 2023, 9, 'ramaDeActividad', 'pie', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '2024-04-08 12:24:46', NULL),
(7, 'Grafica 5', 2015, 4, 'nivelEducativo', 'radar', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\n\nSed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?', '2024-04-08 12:26:26', NULL),
(8, 'Grafica con id 8', 2020, 12, 'grupoOcupacional', 'radar', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', '2024-04-09 16:59:10', NULL),
(9, 'Grafica Nueva y bonita', 2015, 1, 'ofertasRegistradas', 'line', 'Lol', '2024-04-09 17:00:12', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `login`
--

CREATE TABLE `login` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `login`
--

INSERT INTO `login` (`id`, `name`, `email`, `password`) VALUES
(9, 'Pablo Carreño', 'pablo.carreno@serviciodeempleo.gov.co', '$2b$10$eqhWjj6W62eziVtGCz9AIeny6GC3atrWjXNzWgbNaTLLfL9bJaTju'),
(12, 'Johel Santiago Arias', 'santiari05@hotmail.com', '$2b$10$EuLX.7vTz8jh5xwtmUIGQetZfbpt0HMcaHm4dwTCpOfxVDFwaDZIq'),
(25, 'Johel Santiago Arias', '123', '$2b$10$CyExCW2VOWhnIVsw3eV7quTbN3ZYfPi5B5WLCMzUlj3l2VU4qVLWy');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `slider_data`
--

CREATE TABLE `slider_data` (
  `id` int(11) NOT NULL,
  `NOMBRE` varchar(50) NOT NULL,
  `SUBTITULO` varchar(200) DEFAULT NULL,
  `VALOR` int(20) NOT NULL,
  `PORCENTAJE` int(5) NOT NULL,
  `ICONO` varchar(255) NOT NULL,
  `FECHA_CREACION` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `slider_data`
--

INSERT INTO `slider_data` (`id`, `NOMBRE`, `SUBTITULO`, `VALOR`, `PORCENTAJE`, `ICONO`, `FECHA_CREACION`) VALUES
(3, 'Industrias manufactureras', NULL, 28693, -30, 'Industrias manufactureras', '2024-05-10 17:08:57.000000'),
(4, 'Construcción', NULL, 9435, -29, 'Construcción', '2024-05-10 17:09:20.000000'),
(5, 'Explotación de minas y canteras', NULL, 1285, -36, 'Minas y canterasación', '2024-05-10 17:09:37.000000'),
(8, 'Actividades artísticas', NULL, 18792, 1, 'Actividades artísticas', '2024-05-11 11:19:55.000000');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `graficas`
--
ALTER TABLE `graficas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `slider_data`
--
ALTER TABLE `slider_data`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `graficas`
--
ALTER TABLE `graficas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `login`
--
ALTER TABLE `login`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `slider_data`
--
ALTER TABLE `slider_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

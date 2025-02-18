-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-10-2024 a las 17:32:52
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
-- Base de datos: `catalogo_videojuegos`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `generos`
--

CREATE TABLE `generos` (
  `Genero_ID` int(11) NOT NULL,
  `Edad` int(11) NOT NULL,
  `Genero` varchar(45) NOT NULL,
  `Descripcion` varchar(5000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `generos`
--

INSERT INTO `generos` (`Genero_ID`, `Edad`, `Genero`, `Descripcion`) VALUES
(1, 16, 'RPG', '\"Role-Playing Game\".\r\nEs un género que se caracteriza por ofrecer al jugador la posibilidad de asumir el papel de uno o varios personajes en un mundo ficticio.'),
(3, 7, 'Deportes', 'Los juegos deportivos son un género de videojuegos que simulan deportes. A menudo se basan en deportes del mundo real, pero también pueden ser ficticios o exagerados. Estos juegos a menudo permiten al jugador controlar a uno o más atletas durante el transcurso de una competencia. Los jugadores deben seguir las reglas del deporte y competir contra oponentes controlados por computadora u otros jugadores.'),
(4, 10, 'Aventura', 'Este tipo de videojuego se basa en hazañas y peligros. Es un género muy popular donde el protagonista del juego debe atravesar grandes niveles, luchar contra enemigos y recoger objetos de valor. Normalmente son juegos de larga duración con un argumento extenso.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `ID_user` int(11) NOT NULL,
  `user` varchar(45) NOT NULL,
  `password` char(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`ID_user`, `user`, `password`) VALUES
(2, 'webadmin', '$2y$10$EbsqNdgSpWfBqk8K7dDui.frfbiP5zGsV3qbHRZnSf55Rmw8ipGVy');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `videojuegos`
--

CREATE TABLE `videojuegos` (
  `ID_Juego` int(11) NOT NULL,
  `Nombre` varchar(45) NOT NULL,
  `Fecha` date NOT NULL,
  `Precio` int(11) NOT NULL,
  `Descripcion` varchar(5000) NOT NULL,
  `Genero_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `videojuegos`
--

INSERT INTO `videojuegos` (`ID_Juego`, `Nombre`, `Fecha`, `Precio`, `Descripcion`, `Genero_ID`) VALUES
(2, 'EA SPORTS FC 24', '2023-09-22', 50000, 'FC 24 es un videojuego de futbol, desarrollado por EA y publicado por EA Sports. Este juego marca la primera entrega de la serie EA Sports FC, tras la conclusión de la asociación de EA con FIFA', 3),
(4, 'Diablo 2', '2000-06-29', 25000, 'Diablo II, secuela del popular juego Diablo, es una fantasia oscura con temas de accion de juego de rol en un Hack and Slash o estilo de \"calabozo itinerante\".', 1),
(5, 'Horizon Zero Dawn', '2017-02-28', 60000, 'Horizon Zero Dawn es un videojuego de aventura en un mundo abierto en tercera persona. El juego se ambienta en un mundo post-apocalíptico compuesto por regiones rurales, zonas montañosas, bosques y desiertos, cuenta con un ciclo diurno y nocturno, además de un sistema meteorológico dinámico.', 4);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `generos`
--
ALTER TABLE `generos`
  ADD PRIMARY KEY (`Genero_ID`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`ID_user`);

--
-- Indices de la tabla `videojuegos`
--
ALTER TABLE `videojuegos`
  ADD PRIMARY KEY (`ID_Juego`),
  ADD KEY `Genero_ID` (`Genero_ID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `generos`
--
ALTER TABLE `generos`
  MODIFY `Genero_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `ID_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `videojuegos`
--
ALTER TABLE `videojuegos`
  MODIFY `ID_Juego` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `videojuegos`
--
ALTER TABLE `videojuegos`
  ADD CONSTRAINT `videojuegos_ibfk_1` FOREIGN KEY (`Genero_ID`) REFERENCES `generos` (`Genero_ID`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-11-2022 a las 19:03:14
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `my_api`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `books`
--

CREATE TABLE `books` (
  `id_book` int(8) NOT NULL,
  `isbn` varchar(15) NOT NULL,
  `title` varchar(80) NOT NULL,
  `description` text NOT NULL,
  `author` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `books`
--

INSERT INTO `books` (`id_book`, `isbn`, `title`, `description`, `author`, `created_at`, `updated_at`) VALUES
(1, '841681417ASA', 'Art Contemporani ', 'Llibre d\'art del darrer segle a Catalunya. Diverses diciplines.', 'Desconegut', '2022-11-23 15:33:30', '2022-11-23 15:35:32'),
(2, '453352352345WWS', 'L\'art contemporani des de l\'àmbit local: Eines per al disseny i la gestió de pro', 'L\'art contemporani des de l\'àmbit local és un manual adreçat especialment a regidors, tècnics i gestors culturals municipals responsables de programes d\'art contemporani. El llibre s\'estructura en tretze capítols i a cada apartat es fa una anàlisi sobre l\'estat de la qüestió i es plantegen instruments, estratègies i programes amb un discurs i una terminologia expressament didàctics. ', 'Florenci Guntín', '2022-11-23 15:42:29', '2022-11-23 15:43:03');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `employees`
--

CREATE TABLE `employees` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(120) DEFAULT NULL,
  `phone_no` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `employees`
--

INSERT INTO `employees` (`id`, `name`, `email`, `phone_no`) VALUES
(1, 'Pepe', 'pepe@hotmail.com', '657458523'),
(2, 'Marta', 'marta@hotmail.com', '685124541'),
(3, 'Ismael', 'adffg@dfghf.es', '658471245'),
(4, 'Marina', 'mar@gmail.com', '659847451'),
(6, 'Alex', 'alexia@gmail.com', '659325648');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `email` varchar(120) NOT NULL,
  `phone_no` varchar(20) DEFAULT NULL,
  `password` varchar(120) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `phone_no`, `password`, `created_at`) VALUES
(1, 'Ismael', 'ismael@hotmail.com', '64564536456', '$2y$10$kXE/Im/2WzRSoChHBHgVVefSFmWD2KbuACNkN0IpF.fBMv6NByd/O', '2022-07-05 10:31:39'),
(2, 'Laura', 'laura@gmail.com', '685312564', '$2y$10$DdJeKL50gyLmRyIvvkQeS.icnOypDpexaeDyVWZlzdQvUItFtKO2C', '2022-07-05 11:04:42'),
(3, 'Marta', 'marta@gmail.com', '6851245416', '$2y$10$dw2MBHCJUDKWMocx5OeoNOc/r/LSmYg3Eky2mpA0Fono3MZNkiLUa', '2022-07-07 11:40:47');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`id_book`),
  ADD UNIQUE KEY `isbn` (`isbn`);

--
-- Indices de la tabla `employees`
--
ALTER TABLE `employees`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `books`
--
ALTER TABLE `books`
  MODIFY `id_book` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `employees`
--
ALTER TABLE `employees`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

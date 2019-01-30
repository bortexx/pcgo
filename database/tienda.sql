-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-01-2019 a las 08:30:21
-- Versión del servidor: 10.1.37-MariaDB
-- Versión de PHP: 7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tienda`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrusel`
--

CREATE TABLE `carrusel` (
  `id` int(3) NOT NULL,
  `imagenes` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `carrusel`
--

INSERT INTO `carrusel` (`id`, `imagenes`) VALUES
(1, 'carrusel1.jpg'),
(2, 'carrusel2.jpg'),
(3, 'carrusel3.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(2) NOT NULL,
  `Nombre` varchar(20) NOT NULL,
  `Ingles` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `Nombre`, `Ingles`) VALUES
(2, 'Componentes', 'Components'),
(3, 'Ordenadores', 'Computers'),
(4, 'SmartPhones', 'SmartPhones'),
(5, 'Perifericos', 'Peripherals'),
(7, 'Consolas', 'Game Consoles'),
(8, 'Televisiones', 'TVs'),
(9, 'Impresoras', 'Printers'),
(10, 'Monitores', 'Monitors'),
(11, 'Tablets', 'Tablets');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(12) NOT NULL,
  `nombreCarta` varchar(40) COLLATE tis620_bin NOT NULL,
  `nombreEspanyol` varchar(50) COLLATE tis620_bin NOT NULL,
  `nombreIngles` varchar(50) COLLATE tis620_bin NOT NULL,
  `descripcionEspanyol` text COLLATE tis620_bin NOT NULL,
  `descripcionIngles` text COLLATE tis620_bin NOT NULL,
  `imagen` varchar(100) COLLATE tis620_bin NOT NULL,
  `Tipo` enum('portatil','sobremesa','componente','consola','monitor','impresora') COLLATE tis620_bin NOT NULL,
  `precio` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=tis620 COLLATE=tis620_bin;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombreCarta`, `nombreEspanyol`, `nombreIngles`, `descripcionEspanyol`, `descripcionIngles`, `imagen`, `Tipo`, `precio`) VALUES
(1, 'HP Pavilion 15-BC450NS', 'HP Pavilion 15-BC450NS Intel Core i5-8300H/8GB/1TB', 'HP Pavilion 15-BC450NS Intel Core i5-8300H/8GB/1TB', 'Caracter?sticas:\r\nPotencia y creatividad unidas. Realice cualquier actividad, desde crear arte digital a conquistar nuevos mundos, con la potente tarjeta gr?fica NVIDIA? GeForce? GTX? 1050 y el ?ltimo procesador Intel? Core?.\r\nTe encantar? lo que ves. Da igual que est? editando v?deos, viendo su pel?cula favorita, retocando fotos o simplemente jugando, la vibrante pantalla FHD destaca hasta el m?s m?nimo detalle.\r\nUna experiencia de sonido realmente potente. Con altavoces dobles HP, Mejora de audio de HP y sintonizaci?n personalizada realizada por los expertos de B&O PLAY, puedes experimentar audio amplio y aut?ntico. Deja que el sonido te mueva.\r\nAmpl?e su colecci?n digital. Ahora, con el almacenamiento masivo, puede descargar todo su contenido directamente en el ordenador port?til. Lleve siempre consigo su software y colecciones preferidas de fotograf?as, m?sica y pel?culas.\r\n?Bater?a baja? No se preocupe. Cuando cada momento es valioso, HP Fast Charge le pone en funcionamiento al 50 % en aproximadamente 45 minutos. Conecte su dispositivo apagado y cargue su bater?a a velocidades r?pidas como el rayo.\r\nSistema operativo: FreeDOS 2.0\r\nEspecificaciones HP Pavilion 15-BC450NS:\r\nProcesador Intel? Core? i5-8300H (frecuencia de base de 2,3 GHz, hasta 4 GHz con tecnolog?a Intel? Turbo Boost, 8 MB de cach?, 4 n?cleos)\r\nMemoria RAM SDRAM de 8 GB DDR4-2400 (1 x 8 GB). Velocidades de transferencia de hasta 2400 MT/s.\r\nDisco duro SATA de 1 TB 5400 rpm + SSD M.2 de 128 GB\r\nAlmacenamiento ?ptico No\r\nDisplay Pantalla FHD SVA con retroiluminaci?n WLED y antirreflejos (1.920 x 1.080) de 39,6 cm (15,6 pulg.) diagonal\r\nControlador gr?fico NVIDIA? GeForce? GTX 1050 (GDDR5 de 4 GB dedicados)\r\nConectividad\r\nLAN 10/100/1000 GbE integrada\r\nCombo de 802.11b/g/n/ac (2x2) Wi-Fi? y Bluetooth? 4.2 Compatible con Miracast\r\nC?mara de port?til C?mara HD HP Wide Vision con micr?fono digital de matriz doble integrado\r\nMicr?fono S?\r\nAudio B&O PLAY, dos altavoces, HP Audio Boost\r\nBater?a Bater?a de ion-litio 3 celdas 52.2 Wh\r\nConexiones\r\n2 x USB 3.1 (solo transferencia de datos)\r\n1 x USB 2.0\r\n1 x HDMI\r\n1 x RJ-45\r\n1 x combo de auriculares/micr?fono\r\nLector de tarjetas SD multiformato HP\r\nSistema operativo FreeDOS 2.0\r\nDimensiones 38,24 x 25,25 x 2,45 cm\r\nPeso 2.2 kg\r\nColor Negro sombra', 'Caracter?sticas:\r\nPotencia y creatividad unidas. Realice cualquier actividad, desde crear arte digital a conquistar nuevos mundos, con la potente tarjeta gr?fica NVIDIA? GeForce? GTX? 1050 y el ?ltimo procesador Intel? Core?.\r\nTe encantar? lo que ves. Da igual que est? editando v?deos, viendo su pel?cula favorita, retocando fotos o simplemente jugando, la vibrante pantalla FHD destaca hasta el m?s m?nimo detalle.\r\nUna experiencia de sonido realmente potente. Con altavoces dobles HP, Mejora de audio de HP y sintonizaci?n personalizada realizada por los expertos de B&O PLAY, puedes experimentar audio amplio y aut?ntico. Deja que el sonido te mueva.\r\nAmpl?e su colecci?n digital. Ahora, con el almacenamiento masivo, puede descargar todo su contenido directamente en el ordenador port?til. Lleve siempre consigo su software y colecciones preferidas de fotograf?as, m?sica y pel?culas.\r\n?Bater?a baja? No se preocupe. Cuando cada momento es valioso, HP Fast Charge le pone en funcionamiento al 50 % en aproximadamente 45 minutos. Conecte su dispositivo apagado y cargue su bater?a a velocidades r?pidas como el rayo.\r\nSistema operativo: FreeDOS 2.0\r\nEspecificaciones HP Pavilion 15-BC450NS:\r\nProcesador Intel? Core? i5-8300H (frecuencia de base de 2,3 GHz, hasta 4 GHz con tecnolog?a Intel? Turbo Boost, 8 MB de cach?, 4 n?cleos)\r\nMemoria RAM SDRAM de 8 GB DDR4-2400 (1 x 8 GB). Velocidades de transferencia de hasta 2400 MT/s.\r\nDisco duro SATA de 1 TB 5400 rpm + SSD M.2 de 128 GB\r\nAlmacenamiento ?ptico No\r\nDisplay Pantalla FHD SVA con retroiluminaci?n WLED y antirreflejos (1.920 x 1.080) de 39,6 cm (15,6 pulg.) diagonal\r\nControlador gr?fico NVIDIA? GeForce? GTX 1050 (GDDR5 de 4 GB dedicados)\r\nConectividad\r\nLAN 10/100/1000 GbE integrada\r\nCombo de 802.11b/g/n/ac (2x2) Wi-Fi? y Bluetooth? 4.2 Compatible con Miracast\r\nC?mara de port?til C?mara HD HP Wide Vision con micr?fono digital de matriz doble integrado\r\nMicr?fono S?\r\nAudio B&O PLAY, dos altavoces, HP Audio Boost\r\nBater?a Bater?a de ion-litio 3 celdas 52.2 Wh\r\nConexiones\r\n2 x USB 3.1 (solo transferencia de datos)\r\n1 x USB 2.0\r\n1 x HDMI\r\n1 x RJ-45\r\n1 x combo de auriculares/micr?fono\r\nLector de tarjetas SD multiformato HP\r\nSistema operativo FreeDOS 2.0\r\nDimensiones 38,24 x 25,25 x 2,45 cm\r\nPeso 2.2 kg\r\nColor Negro sombra', 'HP-Pavilion-15-BC450NS.jpg', 'portatil', 699.99),
(2, 'Xiaomi Mi Air 13.3\"', 'Xiaomi Mi Air 13.3\"', 'Xiaomi Mi Air 13.3\"', '', '', 'miair01.jpg', 'portatil', 899),
(3, 'Apple MacBook Air', 'Apple MacBook Air Intel Core i5/8GB/128GB SSD/13\" ', 'Apple MacBook Air Intel Core i5/8GB/128GB SSD/13\" ', '', '', '96327-gimp.jpg', 'sobremesa', 899);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carrusel`
--
ALTER TABLE `carrusel`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `carrusel`
--
ALTER TABLE `carrusel`
  MODIFY `id` int(3) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
tiendaproductoscategorias
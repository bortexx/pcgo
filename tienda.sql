-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-02-2019 a las 11:51:55
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
  `imagenes` varchar(20) CHARACTER SET utf8mb4 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `Nombre` varchar(20) CHARACTER SET utf8mb4 NOT NULL,
  `Ingles` varchar(20) CHARACTER SET utf8mb4 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
-- Estructura de tabla para la tabla `linea_pedido`
--

CREATE TABLE `linea_pedido` (
  `id` int(11) NOT NULL,
  `id_pedido` int(11) NOT NULL,
  `precio` double NOT NULL,
  `unidades` int(11) NOT NULL,
  `importe` double NOT NULL,
  `id_producto` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido`
--

CREATE TABLE `pedido` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `fecha_pedido` date NOT NULL,
  `total_importe` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(12) NOT NULL,
  `nombreCarta` varchar(40) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `nombreCompleto` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(380) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `imagen` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `Tipo` enum('portatiles','sobremesas','componentes','consolas','monitores','impresoras','perifericos','tablets','smartphones','televisiones') CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `precio` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombreCarta`, `nombreCompleto`, `descripcion`, `imagen`, `Tipo`, `precio`) VALUES
(1, 'HP Pavilion 15-BC450NS', 'HP Pavilion 15-BC450NS Intel Core i5-8300H/8GB/1TB', 'Características:\r\nPotencia y creatividad unidas. Realice cualquier actividad, desde crear arte digital a conquistar nuevos mundos, con la potente tarjeta gráfica NVIDIA® GeForce® GTX™ 1050 y el último procesador Intel® Core™.\r\nTe encantará lo que ves. Da igual que esté editando vídeos, viendo su película favorita, retocando fotos o simplemente jugando, la vibrante pantalla FHD ', 'HP-Pavilion-15-BC450NS.jpg', 'portatiles', 699.99),
(2, 'Xiaomi Mi Air 13.3\"', 'Xiaomi Mi Air 13.3\"', 'Este nuevo Mi Laptop Air 13\" utiliza el último procesador Intel Core Kaby Lake i5-8250U. A 3,4 GHz, el procesador de cuatro núcleos tiene un rendimiento de aumento del 40% en comparación con la séptima generación anterior. Además, cuenta con una tarjeta gráfica NVIDIA GeForce MX150 con 2 GB de GDDR5 VRAM. Esta tarjeta gráfica utiliza la última arquitectura de Pascal. ', 'miair01.jpg', 'portatiles', 899),
(3, 'Apple MacBook Air', 'Apple MacBook Air Intel Core i5/8GB/128GB SSD/13\" ', 'Características:\r\nTodo lo que quieras. Todo el día. El MacBook Air te ofrece hasta 12 horas de autonomía con una sola carga. Vamos, que puedes encenderlo por la mañana y olvidarte de cargarlo hasta la noche. Por ejemplo, si te apetece una maratón de películas de iTunes, tienes hasta 12 largas horas por delante. Además aguanta hasta un mes en reposo, así que puedes pasarte seman', '96327-gimp.jpg', 'portatiles', 899),
(4, 'XBOX ONE X', 'XBOX ONE X', 'La consola más potente de la historia\r\nVive la auténtica experiencia inmersiva 4K real con Xbox One X, la nueva consola de Microsoft que cuenta con un 40% más de potencia que cualquier otra máquina del mercado.\r\n\r\nXbox One X ha sido diseñada para ser la mejor consola para crear y jugar a juegos ofreciendo la mayor fidelidad gráfica a través de los mejores desarrolladores de vid', 'XBOXONEX.png', 'consolas', 489.95),
(5, 'XBOX ONE S 1TB', 'XBOX ONE S 1TB + 2 CONTROLADORES', 'Más elegante. Más pequeña. Más espectacular.\r\nPresentación de la nueva Xbox One S. Disfruta del mejor catálogo de juegos, con los clásicos de la Xbox 360, en una consola un 40 % más pequeña. Experimenta un color más rico y luminoso en los juegos y vídeos con HDR (alto rango dinámico). Transmite vídeo 4 K en Netflix y disfruta de películas en UHD Blu-ray con increíble ultra HD 4', 'XBOXS.png', 'consolas', 289.95),
(6, 'PLAYSTATION 4 PRO 1TB ', ' PLAYSTATION 4 PRO 1TB CHASIS B', 'PlayStation 4 Pro llega a la familia de consolas de sobremesa de Sony para llevar todo su potencial a otro nivel. Esta versión vitaminada de la actual consola de nueva generación proporciona innnovación en gráficos de alta tecnología, mejorando el catálogo de juegos actual con la última tecnología de imagen a través de la resolución 4K y High Dymanic Range (HDR) en televisores ', 'PS4.png', 'consolas', 399.95),
(7, 'HP LaserJet Pro M402Dn ', 'HP LaserJet Pro M402Dn - Impresora (A4, 38 ppm)', 'Marca	HP\r\nSeries	Laserjet PRO M 402 DN\r\nPeso del producto	8,58 Kg\r\nDimensiones del producto	38,1 x 35,7 x 21,6 cm\r\nNúmero de modelo del producto	C5F94A\r\nColor	blanco\r\nFabricante del procesador	Intel\r\nTipo de procesador	Ninguno\r\nNúmero de procesadores	1\r\nCapacidad de la memoria RAM	128 MB\r\nTipo de memoria del ordenador	DDR3 SDRAM\r\nInterfaz del disco duro	Desconocido\r\nNúmero de p', 'HPLaserJetImpresora_.jpg', 'impresoras', 242),
(8, 'Samsung Serie Xpress SL-C430', 'Samsung Serie Xpress SL-C430 - Impresora láser C', 'Samsung Xpress C430 - Impresora - color - laser - A4/Legal - 600 x 600 ppp - hasta 18 ppm (monocromo) / hasta 4 ppm (color) - capacidad: 150 hojas - USB 2.0 - Impresora Laser.\r\n\r\nContenido de la caja\r\nManual / Tóner / Maquina\r\n\r\n', 'SamsungSerieXpressSL.jpg', 'impresoras', 129.89),
(9, 'Brother MFC-J480DW ', 'Brother MFC-J480DW - Impresora multifunción de Tin', 'Descripción del producto\r\nLa impresora más completa para tu casa: impresora, copiadora, escáner y fax, en un único equipo con WiFi para utilizarla con tu ordenador, móvil o tablet.\r\n\r\nContenido de la caja\r\nImpresora multifunción de tinta (12ppm).', 'brotherMFCj4.jpg', 'impresoras', 116.6),
(10, 'Crucial Ballistix Tactical Tracer', 'Crucial Ballistix Tactical Tracer DDR4 3000 PC4-24', 'Descripción del producto\r\nEl rendimiento no es suficiente si quieres personalizar tu plataforma de juego: tu sistema debe destacarse cuando estás aplastando oponentes. Juegue a altas velocidades mientras enciende los módulos de memoria de juego Ballistix Tactical Tracer RGB DDR4 que combinan con la combinación de colores de su sistema con LED RGB y ofrece todas las característi', 'RAMCrucial.jpg', 'componentes', 105),
(11, 'MSI Z370-A Pro', 'MSI Z370-A Pro', 'Te presentamos la MSI Z370-A Pro, una placa base con socket Intel 1151 y chipset Z370. LA Z370-A Pro incluye luces LED en color blanco.\r\n\r\nEspecificaciones:\r\nCPU\r\nSupports 8th Gen Intel® Core™ processors, and Intel® Pentium® and Celeron® processors for Socket LGA1151\r\nChipset\r\nIntel® Z370 Chipset\r\nMain Memory\r\n4 x DDR4 memory slots, support up to 64GB\r\nSupports 4000+(OC)/ 3866(', 'msiz370APro.jpg', 'componentes', 104.9),
(12, 'Sapphire NITRO+ Radeon RX ', 'Sapphire NITRO+ Radeon RX Vega64 8G HBM2', 'Te presentamos la tarjeta gráfica Sapphire Nitro+ Radeon RX 580 4GB GDDR5. Construida sobre la arquitectura Polaris a prueba de futuro, la tarjeta gráfica SAPPHIRE NITRO + Radeon ™ RX 580 reproduce tus favoritos a 1080p y más allá, desde los últimos juegos de eSports y MOBA hasta los títulos AAA más populares y de gran intensidad gráfica.\r\n\r\nLa evolución del proceso FinFET 14 h', 'SapphireNITRORadeonRX1.jpg', 'componentes', 459),
(13, 'BenQ BL2420PT ', 'BenQ BL2420PT - Monitor para PC Desktop (24\" 2K QH', 'Marca	BenQ\r\nSeries	BL2420PT\r\nPeso del producto	7 Kg\r\nDimensiones del producto	52,5 x 56,3 x 23,9 cm\r\nNúmero de modelo del producto	BL2420PT\r\nColor	Negro\r\nDimensión de la pantalla	23.8 pulgadas\r\nResolución de pantalla	2560 x 1440\r\nMáxima resolución de pantalla	2560X1440\r\nFabricante del procesador	Intel\r\nTipo de procesador	Ninguno\r\nInterfaz del disco duro	Desconocido\r\nNúmero de p', 'benqBL2420PT.jpg', 'monitores', 229),
(14, 'MSI Aegis 3 8RC-050EU', 'MSI Aegis 3 8RC-050EU Intel Core i7-8700/16GB/1TB+', 'Te presentamos el Aegis 3 8RC-050EU de MSI. Prepárate para sentir todo el poder del juego con el sobremesa de MSI Aegis 3 8RC-050EU. Un ordenador sobremesa Gaming a todos los efectos, dotado con un procesador Intel Core i7, 16GB de RAM, 1TB de disco duro con un disco duro SSD de 128 GB, y todo bajo una potente gráfica NVIDIA GeForce GTX 1060 6GB GDDR5.\r\n\r\nCaracterísticas:\r\nWind', 'MSIAegis38RC-050EU.jpg', 'sobremesas', 1599),
(15, 'Logitech G231 Prodigy', 'Logitech G231 Prodigy Auriculares Gaming', 'Les presentamos los auriculares gaming G231 Prodigy de Logitech. Los juegos no son sólo gráficos. El sonido complementa la imagen. G231, que utiliza transductores de neodimio de 40 mm, aporta un sonido estéreo de alta calidad para sumergirse de lleno en el juego, de principio a fin. G231 funciona con Xbox One, Playstation y PC, para que oigas el increíble audio de todos tus jue', 'LogitechG231.jpg', 'perifericos', 39.99),
(16, 'Leotec Supernova Vision Plus', 'Leotec Supernova Vision Plus 10.1\" IPS 2Gb/32Gb', 'Leotec presenta su nueva tablet Supernova Vision Plus 10.1\" con calidad IPS con resolución HD de 1280 x 800 y formato 16:10. Disfruta de juegos, aplicaciones, películas con la calidad de imagen, brillo y color excepcional que solo la pantalla de IPS puede proporcionar.\r\n\r\nSu procesador Quad Core de 64bit te permitirá hacer volar tus aplicaciones favoritas, además de 32GB de mem', 'tablet-5001sd.jpg', 'tablets', 119),
(17, 'Huawei MediaPad', 'Huawei MediaPad T5 10\" 32GB IPS Wifi Negra', 'Disfruta del excelente diseño de Huawei MediaPad T5 10\". Descubre el mundo en colores vibrantes a través de una pantalla de 10 pulgadas FullHD. Además, siente la calidad del cuerpo de metal de esta tablet.\r\n', 'img-2155.jpg', 'tablets', 229),
(19, 'MSI Trident 3 8RD-213XEU', 'MSI Trident 3 8RD-213XEU Intel Core i7-8700/16GB/1', 'Te presentamos el Trident 3 de MSI, un ordenador de sobremesa compacto, que facilita su transporte allá donde vayas, ya sea a la Lan Party del Año o pasar el verano a la casa del pueblo, nunca te aburrirás.\r\n\r\nProcesador Intel® Core™ i7-8700 (3.2GHz up to 4.6GHz)\r\nMemoria RAM 16GB DDR4 SODIMM\r\nDisco duro 1TB (7200 rpm S-ATA) + 512 M.2 SATA\r\nControlador gráfico Nvidia GeForce GT', 'MSITrident38RD-213XEU.jpg', 'sobremesas', 1699),
(20, 'Samsung Galaxy Tab A', 'Samsung Galaxy Tab A 10.1\" 2016 32GB Blanca', 'Da vida a tus contenidos. Sorpréndete con una resolución de imagen increíblemente realista con la tablet Galaxy Tab A 10.1 (2016) de Samsung. Su pantalla WUXGA de 10.1” te proporciona una nitidez tal que te sumergirás en tus películas y juegos. Además, ahora podrás llamar y recibir alertas de tus redes sociales de tu smartphone directamente en tu tablet. Además, con Quick Reply', 'b1.jpg', 'tablets', 179),
(21, 'Krom Kernel ', 'Krom Kernel Teclado Mecánico Gaming RGB', 'Kernel TKL es el teclado perfecto para los que queréis ganar no sólo en rapidez de ejecución, sino también en espacio para vuestro escritorio, ya que no incorpora teclado numérico ni reposamuñecas. Es un teclado mecánico, totalmente configurable sin software que ofrece una mayor velocidad de pulsación. Kernel TKL cuenta con iluminación RGB en cada switch y 9 efectos de iluminac', 'Kromkernel.jpg', 'perifericos', 47.99),
(22, 'One Plus 6T', 'OnePlus 6T 8GB/128GB Midnight Black Libre', 'Desbloquea tu futuro. Desbloquea tu OnePlus 6T con el sensor de huella dactilar en pantalla más rápido del mercado. Estamos estableciendo un nuevo estándar con nuestra avanzada tecnología de desbloqueo de pantalla.\r\n\r\nEl OnePlus 6T ha sido cuidadosamente diseñado: cuenta con nuestra pantalla más grande hasta la fecha y una parte trasera resistente hecha de cristal. Disfruta de ', 'onePlus.jpg', 'smartphones', 579),
(23, 'Mars Gaming MM418 ', 'Mars Gaming MM418 Ratón Gaming con Sensor Óptico 3', 'El MM418 es el ratón gaming con el que siempre has soñado: hasta 32.000 DPI gracias a su exclusivo sensor óptico, un diseño híbrido con prestaciones para shooters y MMOs, 12 botones programables, una espectacular iluminación CHROMA RGB con múltiples efectos de iluminación, sistema de pesos regulables... ¡No querrás utilizar ningún otro ratón después de este! ', 'MarsGamingMM418.jpg', 'perifericos', 39.99),
(24, 'Samsung Galaxy A9', 'Samsung Galaxy A9 Azul Libre', 'Galaxy A9 es el primer smartphone del mercado con cuatro cámaras traseras, por lo que podrás capturar el mundo tal y como lo ves. Su cámara inteligente te ofrece cuatro veces más funciones para que saques el máximo partido a tus fotos en cualquier situación. Todo ello combinado con una cámara delantera de alta resolución, con la que podrás aplicar a tus selfies efectos de desen', 'galaxyA9.jpg', 'smartphones', 499),
(25, 'Televisor Nevir', 'Televisor Nevir NVR-7424-28HD-N 28\" HD\r\n', 'El televisor de 28 pulgadas NVR-7424-28HD-N de Nevir, proporciona una gran experiencia visual y realismo en pantalla. Este TV HD permite la máxima reproducción en formatos multimedia de audio y vídeo.\r\n\r\nSu sonido, además, no desmerece la calidad de imagen, y cuenta con altavoces estéreo. Por si fuera poco, dispone de un funcionamiento eficiente, para un menor consumo energétic', 'bb1.jpg', 'televisiones', 129);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombreUsuario` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL,
  `contrasenya` varchar(500) COLLATE utf8_spanish_ci DEFAULT NULL,
  `nombre` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `apellidos` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `direccion` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `codigoPostal` int(5) UNSIGNED ZEROFILL DEFAULT NULL,
  `correoElectronico` varchar(200) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombreUsuario`, `contrasenya`, `nombre`, `apellidos`, `direccion`, `codigoPostal`, `correoElectronico`) VALUES
(12, 'angel', 'ad', 'asd', 'asd', 'asd', 00002, 'oko@gmail.com'),
(13, 'ayami', 'ayami', 'asdas', 'adsad', 'asddsa', 00022, 'aaa@aaa.com'),
(14, 'carl', 'carl', 'carlos', 'carlos', 'carlos', 00001, 'carlos@gmail.com'),
(15, 'Ka', 'Ka', 'w', 'w', 'dasdasda', 55922, 'alguno@gmail.com');

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
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indices de la tabla `linea_pedido`
--
ALTER TABLE `linea_pedido`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `id_producto` (`id_producto`),
  ADD KEY `id_pedido` (`id_pedido`);

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `id_2` (`id`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_3` (`id`),
  ADD KEY `id_4` (`id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `id_2` (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `id_2` (`id`);

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
-- AUTO_INCREMENT de la tabla `linea_pedido`
--
ALTER TABLE `linea_pedido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedido`
--
ALTER TABLE `pedido`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `linea_pedido`
--
ALTER TABLE `linea_pedido`
  ADD CONSTRAINT `linea_pedido_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`),
  ADD CONSTRAINT `linea_pedido_ibfk_3` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id`);

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

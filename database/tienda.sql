-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
<<<<<<< HEAD
-- Tiempo de generación: 06-02-2019 a las 11:51:55
=======
-- Tiempo de generación: 31-01-2019 a las 09:03:33
>>>>>>> origin/alejandro
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
<<<<<<< HEAD
  `nombreCarta` varchar(40) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `nombreCompleto` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `descripcion` varchar(380) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `imagen` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `Tipo` enum('portatiles','sobremesas','componentes','consolas','monitores','impresoras','perifericos','tablets','smartphones','televisiones') CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
=======
  `nombreCarta` varchar(40) CHARACTER SET tis620 COLLATE tis620_bin NOT NULL,
  `nombreCompleto` varchar(50) CHARACTER SET tis620 COLLATE tis620_bin NOT NULL,
  `descripcion` text CHARACTER SET tis620 COLLATE tis620_bin NOT NULL,
  `imagen` varchar(100) CHARACTER SET tis620 COLLATE tis620_bin NOT NULL,
  `Tipo` enum('portatil','sobremesa','componente','consola','monitor','impresora') CHARACTER SET tis620 COLLATE tis620_bin NOT NULL,
>>>>>>> origin/alejandro
  `precio` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombreCarta`, `nombreCompleto`, `descripcion`, `imagen`, `Tipo`, `precio`) VALUES
<<<<<<< HEAD
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
=======
(1, 'HP Pavilion 15-BC450NS', 'HP Pavilion 15-BC450NS Intel Core i5-8300H/8GB/1TB', 'Caracter?sticas:\r\nPotencia y creatividad unidas. Realice cualquier actividad, desde crear arte digital a conquistar nuevos mundos, con la potente tarjeta gr?fica NVIDIA? GeForce? GTX? 1050 y el ?ltimo procesador Intel? Core?.\r\nTe encantar? lo que ves. Da igual que est? editando v?deos, viendo su pel?cula favorita, retocando fotos o simplemente jugando, la vibrante pantalla FHD destaca hasta el m?s m?nimo detalle.\r\nUna experiencia de sonido realmente potente. Con altavoces dobles HP, Mejora de audio de HP y sintonizaci?n personalizada realizada por los expertos de B&O PLAY, puedes experimentar audio amplio y aut?ntico. Deja que el sonido te mueva.\r\nAmpl?e su colecci?n digital. Ahora, con el almacenamiento masivo, puede descargar todo su contenido directamente en el ordenador port?til. Lleve siempre consigo su software y colecciones preferidas de fotograf?as, m?sica y pel?culas.\r\n?Bater?a baja? No se preocupe. Cuando cada momento es valioso, HP Fast Charge le pone en funcionamiento al 50 % en aproximadamente 45 minutos. Conecte su dispositivo apagado y cargue su bater?a a velocidades r?pidas como el rayo.\r\nSistema operativo: FreeDOS 2.0\r\nEspecificaciones HP Pavilion 15-BC450NS:\r\nProcesador Intel? Core? i5-8300H (frecuencia de base de 2,3 GHz, hasta 4 GHz con tecnolog?a Intel? Turbo Boost, 8 MB de cach?, 4 n?cleos)\r\nMemoria RAM SDRAM de 8 GB DDR4-2400 (1 x 8 GB). Velocidades de transferencia de hasta 2400 MT/s.\r\nDisco duro SATA de 1 TB 5400 rpm + SSD M.2 de 128 GB\r\nAlmacenamiento ?ptico No\r\nDisplay Pantalla FHD SVA con retroiluminaci?n WLED y antirreflejos (1.920 x 1.080) de 39,6 cm (15,6 pulg.) diagonal\r\nControlador gr?fico NVIDIA? GeForce? GTX 1050 (GDDR5 de 4 GB dedicados)\r\nConectividad\r\nLAN 10/100/1000 GbE integrada\r\nCombo de 802.11b/g/n/ac (2x2) Wi-Fi? y Bluetooth? 4.2 Compatible con Miracast\r\nC?mara de port?til C?mara HD HP Wide Vision con micr?fono digital de matriz doble integrado\r\nMicr?fono S?\r\nAudio B&O PLAY, dos altavoces, HP Audio Boost\r\nBater?a Bater?a de ion-litio 3 celdas 52.2 Wh\r\nConexiones\r\n2 x USB 3.1 (solo transferencia de datos)\r\n1 x USB 2.0\r\n1 x HDMI\r\n1 x RJ-45\r\n1 x combo de auriculares/micr?fono\r\nLector de tarjetas SD multiformato HP\r\nSistema operativo FreeDOS 2.0\r\nDimensiones 38,24 x 25,25 x 2,45 cm\r\nPeso 2.2 kg\r\nColor Negro sombra', 'HP-Pavilion-15-BC450NS.jpg', 'portatil', 699.99),
(2, 'Xiaomi Mi Air 13.3\"', 'Xiaomi Mi Air 13.3\"', '', 'miair01.jpg', 'portatil', 899),
(3, 'Apple MacBook Air', 'Apple MacBook Air Intel Core i5/8GB/128GB SSD/13\" ', '', '96327-gimp.jpg', 'sobremesa', 899),
(4, 'XBOX ONE X', 'XBOX ONE X', 'CARACTER?STICAS\r\nAlmacenamiento: 1 TB\r\nConectividad: WiFi / Ethernet\r\nConexi?n TV / AV: HDMI\r\nResoluci?n: 4K / HDR 10\r\nSoporte: Blu Ray Disc\r\nMandos: Bluetooth', 'XBOXONEX.png', '', 489.95),
(5, 'XBOX ONE S 1TB', 'XBOX ONE S 1TB + 2 CONTROLADORES', 'XBOX ONE S\r\n\r\n\r\nM?s elegante. M?s peque?a. M?s espectacular.\r\nPresentaci?n de la nueva Xbox One S. Disfruta del mejor cat?logo de juegos, con los cl?sicos de la Xbox 360, en una consola un 40 % m?s peque?a. Experimenta un color m?s rico y luminoso en los juegos y v?deos con HDR (alto rango din?mico). Transmite v?deo 4 K en Netflix y disfruta de pel?culas en UHD Blu-ray con incre?ble ultra HD 4 K. Disfruta tambi?n de una mayor comodidad y del nuevo mando inal?mbrico, con Bluetooth y agarre con relieve.\r\n\r\n40 % m?s peque?a\r\nNo dejes que el tama?o te enga?e. Con una fuente de alimentaci?n interna y hasta 2 TB de almacenamiento interno, la Xbox One S es la Xbox m?s avanzada hasta la fecha.\r\n\r\nEl mando era bueno, pero ahora es incluso mejor\r\nEl nuevo mando inal?mbrico de la Xbox presenta un dise?o optimizado, elegante, con agarre con relieve y Bluetooth para jugar en dispositivos con Windows 10. Personaliza la asignaci?n de los botones, disfruta de una cobertura inal?mbrica mejorada y conecta cualquier auricular compatible con la toma de auriculares est?reo de 3,5 mm.\r\n\r\nUsa juegos de Xbox 360 en Xbox One\r\nCompatibilidad con versiones anteriores de Xbox One2: la caracter?stica m?s solicitada por los fans es ahora una realidad. Juega a un n?mero cada vez mayor de juegos Xbox 360 en Xbox One sin costes adicionales. Y con cientos de t?tulos programados para los pr?ximos meses, Xbox One es ahora el mejor lugar para jugar los juegos de Xbox 360.\r\n\r\nJuega en comunidad con Gold\r\nCon el modo multijugador m?s avanzado en Xbox One y equipos con Windows 10, Xbox Live es la principal comunidad de videojuegos del mundo. Adem?s, con Xbox Live Gold obtienes los videojuegos con el modo multijugador m?s avanzado, juegos gratuitos, descuentos exclusivos para miembros de hasta el 50 y 75 % en juegos en la Tienda Xbox, y mucho m?s.', 'XBOXS.png', '', 289.95),
(6, 'PLAYSTATION 4 PRO 1TB ', ' PLAYSTATION 4 PRO 1TB CHASIS B', 'Caracter?sticas:\r\nDimensiones: 295 x 327 x 55 mm.\r\nPeso: 3,3kg.\r\nModelo: CUH-7002B.\r\nResoluci?n: 480p, 720p, 1080i, 1080p, 4K (s?lo video), HDR.\r\nCPU: AMD Jaguar x86-64, 8-core.\r\nGPU: AMD Radeon, 4.20 TFLOP.\r\nRAM: 8GB + 1GB de RAM convencional DRAM.\r\nCapacidad: 1TB.\r\nSoporte f?sico: Blu-ray, DVD.\r\nWiFi: 802.11 a/b/g/n/ac.\r\nRed por cable: 10/100/1000 Ethernet.\r\nBluetooth: v4.0.\r\nPuertos: USB 3.0 (x3), HDMI 2.0a, S/PDIF.', 'PS4.png', '', 399.95),
(7, 'HP LaserJet Pro M402Dn ', 'HP LaserJet Pro M402Dn - Impresora (A4, 38 ppm)', 'Detalles t?cnicos\r\nMarca	HP\r\nSeries	Laserjet PRO M 402 DN\r\nPeso del producto	8,58 Kg\r\nDimensiones del producto	38,1 x 35,7 x 21,6 cm\r\nN?mero de modelo del producto	C5F94A\r\nColor	blanco\r\nFabricante del procesador	Intel\r\nTipo de procesador	Ninguno\r\nN?mero de procesadores	1\r\nCapacidad de la memoria RAM	128 MB\r\nTipo de memoria del ordenador	DDR3 SDRAM\r\nInterfaz del disco duro	Desconocido\r\nN?mero de puertos USB 2.0	1\r\nVoltaje	220 voltios\r\nPotencia el?ctrica	591 vatios\r\nPlataforma de Hardware	PC\r\nSistema operativo	none', 'HPLaserJetImpresora_.jpg', '', 242),
(8, 'Samsung Serie Xpress SL-C430', 'Samsung Serie Xpress SL-C430 - Impresora l?ser C', 'Marca	Samsung\r\nSeries	SL-C430\r\nPeso del producto	10 Kg\r\nDimensiones del producto	38,2 x 39,6 x 21,1 cm\r\nN?mero de modelo del producto	SL-C430/SEE\r\nColor	Blanco\r\nFabricante del procesador	Intel\r\nTipo de procesador	Ninguno\r\nVelocidad del procesador	400 MHz\r\nN?mero de procesadores	1\r\nCapacidad de la memoria RAM	64 MB\r\nTipo de memoria del ordenador	DDR3 SDRAM\r\nMemoria m?xima compatible	64 MB\r\nInterfaz del disco duro	Desconocido\r\nTipo de conectividad	No\r\nN?mero de puertos USB 2.0	1\r\nPotencia el?ctrica	290 vatios\r\nPlataforma de Hardware	PC\r\nSistema operativo	none', 'SamsungSerieXpressSL.jpg', '', 129.89),
(9, 'Brother MFC-J480DW ', 'Brother MFC-J480DW - Impresora multifunci?n de Tin', 'Detalles t?cnicos\r\nMarca	Brother\r\nSeries	MFC J 480 DW\r\nPeso del producto	2,5 Kg\r\nDimensiones del producto	48 x 45 x 25 cm\r\nN?mero de modelo del producto	MFCJ480DWZX1\r\nColor	Negro\r\nFabricante del procesador	Intel\r\nTipo de procesador	Ninguno\r\nN?mero de procesadores	1\r\nTipo de memoria del ordenador	DDR3 SDRAM\r\nInterfaz del disco duro	Desconocido\r\nN?mero de puertos USB 2.0	1\r\nPlataforma de Hardware	PC\r\nSistema operativo	none', 'brotherMFCj4.jpg', '', 116.6),
(10, 'Crucial Ballistix Tactical Tracer', 'Crucial Ballistix Tactical Tracer DDR4 3000 PC4-24', 'Caracter?sticas:\r\nPersonalice la combinaci?n de colores de su equipo con 16 LED RGB en 8 zonas en cada m?dulo\r\nSeleccione patrones de LED RGB y ajuste el brillo\r\nLED de control con el Ballistix M.O.D. Utilidad o tarjeta madre RGB software1\r\nCree su propia barra de luces personalizada con su impresora 3D y proporcione archivos 3D para la ?ltima modificaci?n\r\nVelocidades de hasta 3000 MT / s\r\nF?cil de alcanzar velocidades y tiempos avanzados con perfiles XMP\r\nGarantia limitada de por vida', 'RAMCrucial.jpg', '', 105),
(11, 'MSI Z370-A Pro', 'MSI Z370-A Pro', 'Especificaciones:\r\nCPU\r\nSupports 8th Gen Intel? Core? processors, and Intel? Pentium? and Celeron? processors for Socket LGA1151\r\nChipset\r\nIntel? Z370 Chipset\r\nMain Memory\r\n4 x DDR4 memory slots, support up to 64GB\r\nSupports 4000+(OC)/ 3866(OC)/ 3733(OC)/ 3600(OC)/ 3466(OC)/ 3400(OC)/ 3333(OC)/ 3300(OC)/ 3200(OC)/ 3000(OC) / 2800(OC)/ 2667/ 2400/ 2133 MHz*\r\nDual channel memory architecture\r\nSupports non-ECC UDIMM memory\r\nSupports Intel? Extreme Memory Profile (XMP)\r\n* Please refer to www.msi.com for more information on compatible memory.\r\nSlots\r\n1 x PCIe 3.0 x16 slot (PCI_E1, supports x16 mode)\r\n1 x PCIe 3.0 x16 slot (PCI_E4, supports x4 mode)\r\n4 x PCIe 3.0 x1 slots\r\nMulti-GPU\r\nSupports 2-Way AMD? CrossFire? Technology\r\nOnboard Graphics\r\n1 x VGA port, supports a maximum resolution of 2048x1536@50Hz, 2048x1280@60Hz, 1920x1200@60Hz\r\n1 x DVI-D port, supports a maximum resolution of 1920x1200@60Hz\r\n1 x DisplayPort, supports a maximum resolution of 4096x2304@24Hz, 2560x1600@60Hz, 3840x2160@60Hz, 1920x1200@60Hz\r\nStorage\r\nIntel? Z370 Chipset\r\n6 x SATA 6Gb/s ports*\r\n1 x M.2 slot (Key M)\r\nSupport up to PCIe 3.0 x4 and SATA 6Gb/s\r\nSupports 2242/ 2260 /2280/ 22110 storage devices\r\nIntel? Optane? Memory Ready**\r\nSupports Intel? Smart Response Technology for Intel Core? processors\r\n* The SATA1 port will become unavailable when M.2 SATA SSD has been installed in M.2 slot.\r\n** Please refer to page 87 for Intel? Optane? Memory Configuration.\r\nRAID\r\nIntel? Z370 Chipset\r\nSupports RAID 0, RAID 1, RAID 5 and RAID 10 for SATA storage devices\r\nUSB\r\nIntel? Z370 Chipset\r\n8 x USB 3.1 Gen1 (SuperSpeed USB) ports (4 Type-A ports on the back panel, 4 ports available through the internal USB connectors)\r\n6 x USB 2.0 (High-speed USB) ports (2 Type-A ports on the back panel, 4 ports available through the internal USB connectors)\r\nAudio\r\nRealtek? ALC892 Codec\r\n7.1-Channel High Definition Audio\r\nLAN\r\n1 x Intel? RTL8111H Gigabit LAN controller\r\nInternal I/O Connectors\r\n1 x 24-pin ATX main power connector\r\n1 x 8-pin ATX 12V power connector\r\n6 x SATA 6Gb/s connectors\r\n2 x USB 3.1 Gen1 connectors (supports additional 4 USB 3.1 Gen1 ports)\r\n2 x USB 2.0 connectors (supports additional 4 USB 2.0 ports)\r\n1 x 4-pin CPU fan connector\r\n1 x 4-pin water pump fan connector\r\n4 x 4-pin system fan connectors\r\n1 x Front panel audio connector\r\n2 x Front panel connectors\r\n1 x TPM module connector\r\n1 x Chassis Intrusion connector\r\n1 x Serial port connector\r\n1 x Parallel port connector\r\n1 x Thunderbolt Add-on Card Connector\r\n1 x Clear CMOS jumper\r\nBack Panel I/O Ports\r\n1 x PS/2 mouse & keyboard combo port\r\n4 x USB 3.1 Gen1 Type-A ports\r\n1 x VGA port\r\n1 x DVI-D port\r\n1 x DisplayPort\r\n1 x LAN (RJ45) port\r\n2 x USB 2.0 ports\r\n6 x audio jacks\r\nDimension\r\n12.0 in. x 8.9 in. (30.5 cm x 24.4 cm)\r\nATX Form Factor\r\nMounting\r\n9 mounting holes', 'msiz370APro.jpg', '', 104.9),
(12, 'Sapphire NITRO+ Radeon RX ', 'Sapphire NITRO+ Radeon RX Vega64 8G HBM2', 'Caracter?sticas:\r\nTurbine-X system\r\nSAPPHIRE NITRO Gear Card Support Bracket\r\nNITRO Quick Connect\r\nNITRO CoolTech\r\nNITRO Boost\r\nVR Friendly\r\nTwo-ball bearing\r\nDual BIOS\r\nControl de Tasa de cuadros por segundo\r\nDirectX? 12\r\nAMD Freesync technology\r\nPreparada para AMD XConnect\r\nAMD Eyefinity Technology\r\nPreparada para HDR\r\nHigh Bandwidth Memory\r\nProtecci?n El?ctrica\r\nControl de Fan de Precisi?n\r\nRobusto enfriamiento VRM', 'SapphireNITRORadeonRX1.jpg', '', 459),
(13, 'BenQ BL2420PT ', 'BenQ BL2420PT - Monitor para PC Desktop (24\" 2K QH', 'Detalles t?cnicos\r\nMarca	BenQ\r\nSeries	BL2420PT\r\nPeso del producto	7 Kg\r\nDimensiones del producto	52,5 x 56,3 x 23,9 cm\r\nN?mero de modelo del producto	BL2420PT\r\nColor	Negro\r\nDimensi?n de la pantalla	23.8 pulgadas\r\nResoluci?n de pantalla	2560 x 1440\r\nM?xima resoluci?n de pantalla	2560X1440\r\nFabricante del procesador	Intel\r\nTipo de procesador	Ninguno\r\nInterfaz del disco duro	Desconocido\r\nN?mero de puertos USB 2.0	2\r\nN?mero de puertos HDMI	1\r\nN?mero de puertos VGA	1\r\nVoltaje	240 voltios\r\nPotencia el?ctrica	28 vatios', 'benqBL2420PT.jpg', '', 229),
(14, 'MSI Aegis 3 8RC-050EU', 'MSI Aegis 3 8RC-050EU Intel Core i7-8700/16GB/1TB+', 'Te presentamos el Aegis 3 8RC-050EU de MSI. Prep?rate para sentir todo el poder del juego con el sobremesa de MSI Aegis 3 8RC-050EU. Un ordenador sobremesa Gaming a todos los efectos, dotado con un procesador Intel Core i7, 16GB de RAM, 1TB de disco duro con un disco duro SSD de 128 GB, y todo bajo una potente gr?fica NVIDIA GeForce GTX 1060 6GB GDDR5.\r\nProcesador Intel? Core? i7-8700 (3.2GHz up to 4.6GHz)\r\nMemoria RAM 16GB DDR4 2400 MHz\r\nDisco duro 1TB + 128GB\r\nAlmacenamiento ?ptico NO\r\nControlador gr?fico NVIDIA? GeForce? GTX 1060 6GB GDDR5\r\nConectividad\r\nKiller E2500 Gigabit Ethernet with Killer Shield\r\nWifi AC\r\nConexiones\r\nUSB 2.0: 4\r\nUSB 3.0 (3.1 Gen 1) Type-A: 4\r\nUSB 3.0 (3.1 Gen 1) Type-C: 1\r\nDVI port: No\r\nHDMI: 1\r\nEthernet LAN (RJ-45): 1\r\nLine-in: Y\r\nLine-out: Y\r\nEntrada Micr?fono: Si\r\nSalida auriculares: 1\r\nSistema operativo Microsoft Windows 10 Home\r\nDimensiones 170 x 376 x 433 mm\r\nPeso 9.69\r\nColor Negro', 'MSIAegis38RC-050EU.jpg', 'sobremesa', 1599),
(15, 'Logitech G231 Prodigy', 'Logitech G231 Prodigy Auriculares Gaming', 'Les presentamos los auriculares gaming G231 Prodigy de Logitech. Los juegos no son s?lo gr?ficos. El sonido complementa la imagen. G231, que utiliza transductores de neodimio de 40 mm, aporta un sonido est?reo de alta calidad para sumergirse de lleno en el juego, de principio a fin. G231 funciona con Xbox One, Playstation y PC, para que oigas el incre?ble audio de todos tus juegos.', 'LogitechG231.jpg', '', 39.99),
(16, 'Leotec Supernova Vision Plus', 'Leotec Supernova Vision Plus 10.1\" IPS 2Gb/32Gb', 'Leotec presenta su nueva tablet Supernova Vision Plus 10.1\" con calidad IPS con resoluci?n HD de 1280 x 800 y formato 16:10. Disfruta de juegos, aplicaciones, pel?culas con la calidad de imagen, brillo y color excepcional que solo la pantalla de IPS puede proporcionar.\r\n\r\nSu procesador Quad Core de 64bit te permitir? hacer volar tus aplicaciones favoritas, adem?s de 32GB de memoria (ampliable mediante tarjetas Micro SD) para que puedas almacenar todo lo que quieras.\r\n\r\nSu sistema operativo de ?ltima generaci?n Android 7.0 es actualizable por sistema OTA (ove the air) de forma autom?tica desde la propia tablet. Dispone adem?s de conexi?n Bluetooth 4.1, salida MiniHDMI y GPS.', 'tablet-5001sd.jpg', '', 119),
(17, 'Huawei MediaPad', 'Huawei MediaPad T5 10\" 32GB IPS Wifi Negra', 'Disfruta del excelente dise?o de Huawei MediaPad T5 10\". Descubre el mundo en colores vibrantes a trav?s de una pantalla de 10 pulgadas FullHD. Adem?s, siente la calidad del cuerpo de metal de esta tablet.', 'img-2155.jpg', '', 229),
(19, 'MSI Trident 3 8RD-213XEU', 'MSI Trident 3 8RD-213XEU Intel Core i7-8700/16GB/1', 'Te presentamos el Trident 3 de MSI, un ordenador de sobremesa compacto, que facilita su transporte all? donde vayas, ya sea a la Lan Party del A?o o pasar el verano a la casa del pueblo, nunca te aburrir?s.\r\nProcesador Intel? Core? i7-8700 (3.2GHz up to 4.6GHz)\r\nMemoria RAM 16GB DDR4 SODIMM\r\nDisco duro 1TB (7200 rpm S-ATA) + 512 M.2 SATA\r\nControlador gr?fico Nvidia GeForce GTX 1070 AERO ITX 8GB OC GDDR5\r\nConectividad\r\nLAN 10/100/1000\r\n802.11 ac\r\nBluetooth V4.2 High Speed\r\nConexiones\r\n1 x HDMI\r\n1 x VR-link port\r\n1 x salida de auriculares\r\n1 x entrada de micr?fono\r\n3 x USB 3.1 Type-A\r\n1 x USB 3.1 Type-C (Frontal)\r\n4 x USB 2.0\r\n1 x RJ45\r\nSistema operativo NO INCLUIDO\r\nDimensiones (Ancho x Profundidad x Altura)\r\nwith stand: 353.73 x 97.56 x 251.35 mm\r\nw/o stand: 346.25 x 232.47 x 71.83 mm\r\nPeso 3.17 kg\r\nColor Negro', 'MSITrident38RD-213XEU.jpg', 'sobremesa', 1699),
(20, 'Samsung Galaxy Tab A', 'Samsung Galaxy Tab A 10.1\" 2016 32GB Blanca', 'Da vida a tus contenidos. Sorpr?ndete con una resoluci?n de imagen incre?blemente realista con la tablet Galaxy Tab A 10.1 (2016) de Samsung. Su pantalla WUXGA de 10.1? te proporciona una nitidez tal que te sumergir?s en tus pel?culas y juegos. Adem?s, ahora podr?s llamar y recibir alertas de tus redes sociales de tu smartphone directamente en tu tablet. Adem?s, con Quick Reply responder?s y seguir?s tus notificaciones directamente en la pantalla.', 'b1.jpg', '', 179),
(21, 'Krom Kernel ', 'Krom Kernel Teclado Mec?nico Gaming RGB', 'Kernel cuenta con prestaciones de gama alta: podr?s asignar funciones macros a cualquier tecla, disfrutando de una pulsaci?n suave y efectiva gracias a sus switches mec?nicos. Gracias a su Modo Gaming (que desactiva la tecla Windows), su sistema anti ghosting y sus 11 teclas con funci?n multimedia, disfrutar?s de sesiones de juego fluidas y sin interrupciones. Su cable es trenzado, por lo que la resistencia y durabilidad de tu teclado Kernel est? asegurada.', 'Kromkernel.jpg', '', 47.99),
(22, 'One Plus 6T', 'OnePlus 6T 8GB/128GB Midnight Black Libre', 'Sistema operativo OxygenOS basado en Android? 9.0 Pie', 'onePlus.jpg', '', 579),
(23, 'Mars Gaming MM418 ', 'Mars Gaming MM418 Rat?n Gaming con Sensor ?ptico 3', 'El MM418 es el rat?n gaming con el que siempre has so?ado: hasta 32.000 DPI gracias a su exclusivo sensor ?ptico, un dise?o h?brido con prestaciones para shooters y MMOs, 12 botones programables, una espectacular iluminaci?n CHROMA RGB con m?ltiples efectos de iluminaci?n, sistema de pesos regulables... ?No querr?s utilizar ning?n otro rat?n despu?s de este! ', 'MarsGamingMM418.jpg', '', 39.99),
(24, 'Samsung Galaxy A9', 'Samsung Galaxy A9 Azul Libre', 'Pantalla: 6.3 pulgadas (Super AMOLED)Resoluci?n: 2,160x1,080 pixeles.Procesador: Snapdragon 660RAM: 6GB o 8GBAlmacenamiento: 128GB.Ranura microSD: S?, de hasta 512GBSistema operativo: Android Oreo.Bater?a: 3,800mAh', 'galaxyA9.jpg', '', 499),
(25, 'Televisor Nevir', 'Televisor Nevir NVR-7424-28HD-N 28\" HD\r\n', 'Especificaciones NVR-7424-28HD-N:\r\nCompatibilidad\r\nReproducci?n Multiformato en Audio y Video\r\nDVB-T. DVB-C.\r\nPAL, SECAM. BG, DK, I.\r\nFunciones\r\nMen? OSD multilenguaje.\r\nSintonizaci?n auto y manual.\r\nEdici?n de canales.\r\nGu?a de programas EPG.\r\nTeletexto y texto r?pido.\r\nInformaci?n t?cnica\r\nResoluci?n 1.366 x 768.\r\nContraste 1.200:1. Brillo 180 cd/m2.\r\n?ngulo visi?n 178? / 178?.\r\nReducci?n digital ruido.\r\nAjuste T? de color.\r\nSonido\r\n4 modos ecualizaci?n.\r\nMute.\r\nSonido est?reo.\r\nPotencia: 6W RMS x 2.\r\nFunciones extras\r\nAutoapagado.\r\nFunci?n Hotel.\r\nControl Parental.\r\nEscaneo progresivo.\r\nTimeshift.\r\nConsumo m?ximo\r\n?50W. Standby ?0,5W.\r\nAlimentaci?n\r\n100-240 V. ~ 50/60Hz\r\nConexiones\r\nUSB 2, SCART, HDMI x 3, CI+, AV (mini), YPBPR (mini), Coaxial, RF, VGA, Salida Auriculares.\r\nAccesorios\r\nMando distancia multifunci?n\r\nDimensiones An. x Alt. x Fon. (mm.)\r\nCon peana 637 x 414 x 200\r\nSin peana 637 x 380 x 80\r\nEmbalaje\r\nUnidades embalaje 1\r\nDim. embalaje 728 x 458 x 137', 'bb1.jpg', '', 129);
>>>>>>> origin/alejandro

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
<<<<<<< HEAD
(14, 'carl', 'carl', 'carlos', 'carlos', 'carlos', 00001, 'carlos@gmail.com'),
(15, 'Ka', 'Ka', 'w', 'w', 'dasdasda', 55922, 'alguno@gmail.com');
=======
(14, 'carl', 'carl', 'carlos', 'carlos', 'carlos', 00001, 'carlos@gmail.com');
>>>>>>> origin/alejandro

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
<<<<<<< HEAD
  ADD KEY `id_producto` (`id_producto`),
  ADD KEY `id_pedido` (`id_pedido`);
=======
  ADD KEY `id_pedido` (`id_pedido`),
  ADD KEY `id_producto` (`id_producto`);
>>>>>>> origin/alejandro

--
-- Indices de la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `id_2` (`id`),
  ADD KEY `id_usuario` (`id_usuario`),
<<<<<<< HEAD
  ADD KEY `id_3` (`id`),
  ADD KEY `id_4` (`id`);
=======
  ADD KEY `id_3` (`id`);
>>>>>>> origin/alejandro

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
<<<<<<< HEAD
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
=======
>>>>>>> origin/alejandro
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
<<<<<<< HEAD
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
=======
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
>>>>>>> origin/alejandro

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `linea_pedido`
--
ALTER TABLE `linea_pedido`
<<<<<<< HEAD
  ADD CONSTRAINT `linea_pedido_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`),
  ADD CONSTRAINT `linea_pedido_ibfk_3` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id`);
=======
  ADD CONSTRAINT `linea_pedido_ibfk_1` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id`),
  ADD CONSTRAINT `linea_pedido_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `productos` (`id`);
>>>>>>> origin/alejandro

--
-- Filtros para la tabla `pedido`
--
ALTER TABLE `pedido`
  ADD CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

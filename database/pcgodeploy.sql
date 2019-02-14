-- --------------------------------------------------------
-- Host:                         localhost
-- Versión del servidor:         10.1.37-MariaDB - mariadb.org binary distribution
-- SO del servidor:              Win32
-- HeidiSQL Versión:             9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Volcando estructura de base de datos para tienda2
CREATE DATABASE IF NOT EXISTS `tienda2` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_spanish_ci */;
USE `tienda2`;

-- Volcando estructura para tabla tienda2.carrusel
CREATE TABLE IF NOT EXISTS `carrusel` (
  `id` int(3) NOT NULL AUTO_INCREMENT,
  `imagenes` varchar(20) CHARACTER SET utf8mb4 NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tienda2.carrusel: ~3 rows (aproximadamente)
/*!40000 ALTER TABLE `carrusel` DISABLE KEYS */;
INSERT INTO `carrusel` (`id`, `imagenes`) VALUES
	(1, 'carrusel1.jpg'),
	(2, 'carrusel2.jpg'),
	(3, 'carrusel3.jpg');
/*!40000 ALTER TABLE `carrusel` ENABLE KEYS */;

-- Volcando estructura para tabla tienda2.categorias
CREATE TABLE IF NOT EXISTS `categorias` (
  `id` int(2) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(20) CHARACTER SET utf8mb4 NOT NULL,
  `Ingles` varchar(20) CHARACTER SET utf8mb4 NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tienda2.categorias: ~9 rows (aproximadamente)
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
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
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;

-- Volcando estructura para tabla tienda2.detallescompra
CREATE TABLE IF NOT EXISTS `detallescompra` (
  `lineaCompra` int(11) NOT NULL AUTO_INCREMENT,
  `idUsuario` int(11) NOT NULL DEFAULT '0',
  `idProducto` int(11) NOT NULL DEFAULT '0',
  `unidades` int(11) NOT NULL DEFAULT '0',
  `precio` decimal(10,2) NOT NULL DEFAULT '0.00',
  `importe` decimal(10,2) NOT NULL DEFAULT '0.00',
  PRIMARY KEY (`lineaCompra`),
  KEY `fk_detallescompra_productos` (`idProducto`),
  KEY `fk_detallescompra_usuarios` (`idUsuario`),
  CONSTRAINT `fk_detallescompra_productos` FOREIGN KEY (`idProducto`) REFERENCES `productos` (`id`),
  CONSTRAINT `fk_detallescompra_usuarios` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla tienda2.detallescompra: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `detallescompra` DISABLE KEYS */;
/*!40000 ALTER TABLE `detallescompra` ENABLE KEYS */;

-- Volcando estructura para tabla tienda2.productos
CREATE TABLE IF NOT EXISTS `productos` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `nombreCarta` varchar(40) CHARACTER SET tis620 COLLATE tis620_bin NOT NULL,
  `nombreCompleto` varchar(50) CHARACTER SET tis620 COLLATE tis620_bin NOT NULL,
  `descripcion` text CHARACTER SET tis620 COLLATE tis620_bin NOT NULL,
  `imagen` varchar(100) CHARACTER SET tis620 COLLATE tis620_bin NOT NULL,
  `Tipo` enum('portatiles','sobremesas','componentes','consolas','monitores','impresoras','smartphones','tablets','perifericos','televisiones') CHARACTER SET tis620 COLLATE tis620_bin NOT NULL,
  `precio` double NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `id_2` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- Volcando datos para la tabla tienda2.productos: ~24 rows (aproximadamente)
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` (`id`, `nombreCarta`, `nombreCompleto`, `descripcion`, `imagen`, `Tipo`, `precio`) VALUES
	(1, 'HP Pavilion 15-BC450NS', 'HP Pavilion 15-BC450NS Intel Core i5-8300H/8GB/1TB', 'Caracter?sticas:\r\nPotencia y creatividad unidas. Realice cualquier actividad, desde crear arte digital a conquistar nuevos mundos, con la potente tarjeta gr?fica NVIDIA? GeForce? GTX? 1050 y el ?ltimo procesador Intel? Core?.\r\nTe encantar? lo que ves. Da igual que est? editando v?deos, viendo su pel?cula favorita, retocando fotos o simplemente jugando, la vibrante pantalla FHD destaca hasta el m?s m?nimo detalle.\r\nUna experiencia de sonido realmente potente. Con altavoces dobles HP, Mejora de audio de HP y sintonizaci?n personalizada realizada por los expertos de B&O PLAY, puedes experimentar audio amplio y aut?ntico. Deja que el sonido te mueva.\r\nAmpl?e su colecci?n digital. Ahora, con el almacenamiento masivo, puede descargar todo su contenido directamente en el ordenador port?til. Lleve siempre consigo su software y colecciones preferidas de fotograf?as, m?sica y pel?culas.\r\n?Bater?a baja? No se preocupe. Cuando cada momento es valioso, HP Fast Charge le pone en funcionamiento al 50 % en aproximadamente 45 minutos. Conecte su dispositivo apagado y cargue su bater?a a velocidades r?pidas como el rayo.\r\nSistema operativo: FreeDOS 2.0\r\nEspecificaciones HP Pavilion 15-BC450NS:\r\nProcesador Intel? Core? i5-8300H (frecuencia de base de 2,3 GHz, hasta 4 GHz con tecnolog?a Intel? Turbo Boost, 8 MB de cach?, 4 n?cleos)\r\nMemoria RAM SDRAM de 8 GB DDR4-2400 (1 x 8 GB). Velocidades de transferencia de hasta 2400 MT/s.\r\nDisco duro SATA de 1 TB 5400 rpm + SSD M.2 de 128 GB\r\nAlmacenamiento ?ptico No\r\nDisplay Pantalla FHD SVA con retroiluminaci?n WLED y antirreflejos (1.920 x 1.080) de 39,6 cm (15,6 pulg.) diagonal\r\nControlador gr?fico NVIDIA? GeForce? GTX 1050 (GDDR5 de 4 GB dedicados)\r\nConectividad\r\nLAN 10/100/1000 GbE integrada\r\nCombo de 802.11b/g/n/ac (2x2) Wi-Fi? y Bluetooth? 4.2 Compatible con Miracast\r\nC?mara de port?til C?mara HD HP Wide Vision con micr?fono digital de matriz doble integrado\r\nMicr?fono S?\r\nAudio B&O PLAY, dos altavoces, HP Audio Boost\r\nBater?a Bater?a de ion-litio 3 celdas 52.2 Wh\r\nConexiones\r\n2 x USB 3.1 (solo transferencia de datos)\r\n1 x USB 2.0\r\n1 x HDMI\r\n1 x RJ-45\r\n1 x combo de auriculares/micr?fono\r\nLector de tarjetas SD multiformato HP\r\nSistema operativo FreeDOS 2.0\r\nDimensiones 38,24 x 25,25 x 2,45 cm\r\nPeso 2.2 kg\r\nColor Negro sombra', 'HP-Pavilion-15-BC450NS.jpg', 'portatiles', 699.99),
	(2, 'Xiaomi Mi Air 13.3"', 'Xiaomi Mi Air 13.3"', '', 'miair01.jpg', 'portatiles', 899),
	(3, 'Apple MacBook Air', 'Apple MacBook Air Intel Core i5/8GB/128GB SSD/13" ', '', '96327-gimp.jpg', 'portatiles', 899),
	(4, 'XBOX ONE X', 'XBOX ONE X', 'CARACTER?STICAS\r\nAlmacenamiento: 1 TB\r\nConectividad: WiFi / Ethernet\r\nConexi?n TV / AV: HDMI\r\nResoluci?n: 4K / HDR 10\r\nSoporte: Blu Ray Disc\r\nMandos: Bluetooth', 'XBOXONEX.png', 'consolas', 489.95),
	(5, 'XBOX ONE S 1TB', 'XBOX ONE S 1TB + 2 CONTROLADORES', 'XBOX ONE S\r\n\r\n\r\nM?s elegante. M?s peque?a. M?s espectacular.\r\nPresentaci?n de la nueva Xbox One S. Disfruta del mejor cat?logo de juegos, con los cl?sicos de la Xbox 360, en una consola un 40 % m?s peque?a. Experimenta un color m?s rico y luminoso en los juegos y v?deos con HDR (alto rango din?mico). Transmite v?deo 4 K en Netflix y disfruta de pel?culas en UHD Blu-ray con incre?ble ultra HD 4 K. Disfruta tambi?n de una mayor comodidad y del nuevo mando inal?mbrico, con Bluetooth y agarre con relieve.\r\n\r\n40 % m?s peque?a\r\nNo dejes que el tama?o te enga?e. Con una fuente de alimentaci?n interna y hasta 2 TB de almacenamiento interno, la Xbox One S es la Xbox m?s avanzada hasta la fecha.\r\n\r\nEl mando era bueno, pero ahora es incluso mejor\r\nEl nuevo mando inal?mbrico de la Xbox presenta un dise?o optimizado, elegante, con agarre con relieve y Bluetooth para jugar en dispositivos con Windows 10. Personaliza la asignaci?n de los botones, disfruta de una cobertura inal?mbrica mejorada y conecta cualquier auricular compatible con la toma de auriculares est?reo de 3,5 mm.\r\n\r\nUsa juegos de Xbox 360 en Xbox One\r\nCompatibilidad con versiones anteriores de Xbox One2: la caracter?stica m?s solicitada por los fans es ahora una realidad. Juega a un n?mero cada vez mayor de juegos Xbox 360 en Xbox One sin costes adicionales. Y con cientos de t?tulos programados para los pr?ximos meses, Xbox One es ahora el mejor lugar para jugar los juegos de Xbox 360.\r\n\r\nJuega en comunidad con Gold\r\nCon el modo multijugador m?s avanzado en Xbox One y equipos con Windows 10, Xbox Live es la principal comunidad de videojuegos del mundo. Adem?s, con Xbox Live Gold obtienes los videojuegos con el modo multijugador m?s avanzado, juegos gratuitos, descuentos exclusivos para miembros de hasta el 50 y 75 % en juegos en la Tienda Xbox, y mucho m?s.', 'XBOXS.png', 'consolas', 289.95),
	(6, 'PLAYSTATION 4 PRO 1TB ', ' PLAYSTATION 4 PRO 1TB CHASIS B', 'Caracter?sticas:\r\nDimensiones: 295 x 327 x 55 mm.\r\nPeso: 3,3kg.\r\nModelo: CUH-7002B.\r\nResoluci?n: 480p, 720p, 1080i, 1080p, 4K (s?lo video), HDR.\r\nCPU: AMD Jaguar x86-64, 8-core.\r\nGPU: AMD Radeon, 4.20 TFLOP.\r\nRAM: 8GB + 1GB de RAM convencional DRAM.\r\nCapacidad: 1TB.\r\nSoporte f?sico: Blu-ray, DVD.\r\nWiFi: 802.11 a/b/g/n/ac.\r\nRed por cable: 10/100/1000 Ethernet.\r\nBluetooth: v4.0.\r\nPuertos: USB 3.0 (x3), HDMI 2.0a, S/PDIF.', 'PS4.png', 'consolas', 399.95),
	(7, 'HP LaserJet Pro M402Dn ', 'HP LaserJet Pro M402Dn - Impresora (A4, 38 ppm)', 'Detalles t?cnicos\r\nMarca	HP\r\nSeries	Laserjet PRO M 402 DN\r\nPeso del producto	8,58 Kg\r\nDimensiones del producto	38,1 x 35,7 x 21,6 cm\r\nN?mero de modelo del producto	C5F94A\r\nColor	blanco\r\nFabricante del procesador	Intel\r\nTipo de procesador	Ninguno\r\nN?mero de procesadores	1\r\nCapacidad de la memoria RAM	128 MB\r\nTipo de memoria del ordenador	DDR3 SDRAM\r\nInterfaz del disco duro	Desconocido\r\nN?mero de puertos USB 2.0	1\r\nVoltaje	220 voltios\r\nPotencia el?ctrica	591 vatios\r\nPlataforma de Hardware	PC\r\nSistema operativo	none', 'HPLaserJetImpresora_.jpg', 'impresoras', 242),
	(8, 'Samsung Serie Xpress SL-C430', 'Samsung Serie Xpress SL-C430 - Impresora l?ser C', 'Marca	Samsung\r\nSeries	SL-C430\r\nPeso del producto	10 Kg\r\nDimensiones del producto	38,2 x 39,6 x 21,1 cm\r\nN?mero de modelo del producto	SL-C430/SEE\r\nColor	Blanco\r\nFabricante del procesador	Intel\r\nTipo de procesador	Ninguno\r\nVelocidad del procesador	400 MHz\r\nN?mero de procesadores	1\r\nCapacidad de la memoria RAM	64 MB\r\nTipo de memoria del ordenador	DDR3 SDRAM\r\nMemoria m?xima compatible	64 MB\r\nInterfaz del disco duro	Desconocido\r\nTipo de conectividad	No\r\nN?mero de puertos USB 2.0	1\r\nPotencia el?ctrica	290 vatios\r\nPlataforma de Hardware	PC\r\nSistema operativo	none', 'SamsungSerieXpressSL.jpg', 'impresoras', 129.89),
	(9, 'Brother MFC-J480DW ', 'Brother MFC-J480DW - Impresora multifunci?n de Tin', 'Detalles t?cnicos\r\nMarca	Brother\r\nSeries	MFC J 480 DW\r\nPeso del producto	2,5 Kg\r\nDimensiones del producto	48 x 45 x 25 cm\r\nN?mero de modelo del producto	MFCJ480DWZX1\r\nColor	Negro\r\nFabricante del procesador	Intel\r\nTipo de procesador	Ninguno\r\nN?mero de procesadores	1\r\nTipo de memoria del ordenador	DDR3 SDRAM\r\nInterfaz del disco duro	Desconocido\r\nN?mero de puertos USB 2.0	1\r\nPlataforma de Hardware	PC\r\nSistema operativo	none', 'brotherMFCj4.jpg', 'impresoras', 116.6),
	(10, 'Crucial Ballistix Tactical Tracer', 'Crucial Ballistix Tactical Tracer DDR4 3000 PC4-24', 'Caracter?sticas:\r\nPersonalice la combinaci?n de colores de su equipo con 16 LED RGB en 8 zonas en cada m?dulo\r\nSeleccione patrones de LED RGB y ajuste el brillo\r\nLED de control con el Ballistix M.O.D. Utilidad o tarjeta madre RGB software1\r\nCree su propia barra de luces personalizada con su impresora 3D y proporcione archivos 3D para la ?ltima modificaci?n\r\nVelocidades de hasta 3000 MT / s\r\nF?cil de alcanzar velocidades y tiempos avanzados con perfiles XMP\r\nGarantia limitada de por vida', 'RAMCrucial.jpg', 'componentes', 105),
	(11, 'MSI Z370-A Pro', 'MSI Z370-A Pro', 'Especificaciones:\r\nCPU\r\nSupports 8th Gen Intel? Core? processors, and Intel? Pentium? and Celeron? processors for Socket LGA1151\r\nChipset\r\nIntel? Z370 Chipset\r\nMain Memory\r\n4 x DDR4 memory slots, support up to 64GB\r\nSupports 4000+(OC)/ 3866(OC)/ 3733(OC)/ 3600(OC)/ 3466(OC)/ 3400(OC)/ 3333(OC)/ 3300(OC)/ 3200(OC)/ 3000(OC) / 2800(OC)/ 2667/ 2400/ 2133 MHz*\r\nDual channel memory architecture\r\nSupports non-ECC UDIMM memory\r\nSupports Intel? Extreme Memory Profile (XMP)\r\n* Please refer to www.msi.com for more information on compatible memory.\r\nSlots\r\n1 x PCIe 3.0 x16 slot (PCI_E1, supports x16 mode)\r\n1 x PCIe 3.0 x16 slot (PCI_E4, supports x4 mode)\r\n4 x PCIe 3.0 x1 slots\r\nMulti-GPU\r\nSupports 2-Way AMD? CrossFire? Technology\r\nOnboard Graphics\r\n1 x VGA port, supports a maximum resolution of 2048x1536@50Hz, 2048x1280@60Hz, 1920x1200@60Hz\r\n1 x DVI-D port, supports a maximum resolution of 1920x1200@60Hz\r\n1 x DisplayPort, supports a maximum resolution of 4096x2304@24Hz, 2560x1600@60Hz, 3840x2160@60Hz, 1920x1200@60Hz\r\nStorage\r\nIntel? Z370 Chipset\r\n6 x SATA 6Gb/s ports*\r\n1 x M.2 slot (Key M)\r\nSupport up to PCIe 3.0 x4 and SATA 6Gb/s\r\nSupports 2242/ 2260 /2280/ 22110 storage devices\r\nIntel? Optane? Memory Ready**\r\nSupports Intel? Smart Response Technology for Intel Core? processors\r\n* The SATA1 port will become unavailable when M.2 SATA SSD has been installed in M.2 slot.\r\n** Please refer to page 87 for Intel? Optane? Memory Configuration.\r\nRAID\r\nIntel? Z370 Chipset\r\nSupports RAID 0, RAID 1, RAID 5 and RAID 10 for SATA storage devices\r\nUSB\r\nIntel? Z370 Chipset\r\n8 x USB 3.1 Gen1 (SuperSpeed USB) ports (4 Type-A ports on the back panel, 4 ports available through the internal USB connectors)\r\n6 x USB 2.0 (High-speed USB) ports (2 Type-A ports on the back panel, 4 ports available through the internal USB connectors)\r\nAudio\r\nRealtek? ALC892 Codec\r\n7.1-Channel High Definition Audio\r\nLAN\r\n1 x Intel? RTL8111H Gigabit LAN controller\r\nInternal I/O Connectors\r\n1 x 24-pin ATX main power connector\r\n1 x 8-pin ATX 12V power connector\r\n6 x SATA 6Gb/s connectors\r\n2 x USB 3.1 Gen1 connectors (supports additional 4 USB 3.1 Gen1 ports)\r\n2 x USB 2.0 connectors (supports additional 4 USB 2.0 ports)\r\n1 x 4-pin CPU fan connector\r\n1 x 4-pin water pump fan connector\r\n4 x 4-pin system fan connectors\r\n1 x Front panel audio connector\r\n2 x Front panel connectors\r\n1 x TPM module connector\r\n1 x Chassis Intrusion connector\r\n1 x Serial port connector\r\n1 x Parallel port connector\r\n1 x Thunderbolt Add-on Card Connector\r\n1 x Clear CMOS jumper\r\nBack Panel I/O Ports\r\n1 x PS/2 mouse & keyboard combo port\r\n4 x USB 3.1 Gen1 Type-A ports\r\n1 x VGA port\r\n1 x DVI-D port\r\n1 x DisplayPort\r\n1 x LAN (RJ45) port\r\n2 x USB 2.0 ports\r\n6 x audio jacks\r\nDimension\r\n12.0 in. x 8.9 in. (30.5 cm x 24.4 cm)\r\nATX Form Factor\r\nMounting\r\n9 mounting holes', 'msiz370APro.jpg', 'componentes', 104.9),
	(12, 'Sapphire NITRO+ Radeon RX ', 'Sapphire NITRO+ Radeon RX Vega64 8G HBM2', 'Caracter?sticas:\r\nTurbine-X system\r\nSAPPHIRE NITRO Gear Card Support Bracket\r\nNITRO Quick Connect\r\nNITRO CoolTech\r\nNITRO Boost\r\nVR Friendly\r\nTwo-ball bearing\r\nDual BIOS\r\nControl de Tasa de cuadros por segundo\r\nDirectX? 12\r\nAMD Freesync technology\r\nPreparada para AMD XConnect\r\nAMD Eyefinity Technology\r\nPreparada para HDR\r\nHigh Bandwidth Memory\r\nProtecci?n El?ctrica\r\nControl de Fan de Precisi?n\r\nRobusto enfriamiento VRM', 'SapphireNITRORadeonRX1.jpg', 'componentes', 459),
	(13, 'BenQ BL2420PT ', 'BenQ BL2420PT - Monitor para PC Desktop (24" 2K QH', 'Detalles t?cnicos\r\nMarca	BenQ\r\nSeries	BL2420PT\r\nPeso del producto	7 Kg\r\nDimensiones del producto	52,5 x 56,3 x 23,9 cm\r\nN?mero de modelo del producto	BL2420PT\r\nColor	Negro\r\nDimensi?n de la pantalla	23.8 pulgadas\r\nResoluci?n de pantalla	2560 x 1440\r\nM?xima resoluci?n de pantalla	2560X1440\r\nFabricante del procesador	Intel\r\nTipo de procesador	Ninguno\r\nInterfaz del disco duro	Desconocido\r\nN?mero de puertos USB 2.0	2\r\nN?mero de puertos HDMI	1\r\nN?mero de puertos VGA	1\r\nVoltaje	240 voltios\r\nPotencia el?ctrica	28 vatios', 'benqBL2420PT.jpg', 'monitores', 229),
	(14, 'MSI Aegis 3 8RC-050EU', 'MSI Aegis 3 8RC-050EU Intel Core i7-8700/16GB/1TB+', 'Te presentamos el Aegis 3 8RC-050EU de MSI. Prep?rate para sentir todo el poder del juego con el sobremesa de MSI Aegis 3 8RC-050EU. Un ordenador sobremesa Gaming a todos los efectos, dotado con un procesador Intel Core i7, 16GB de RAM, 1TB de disco duro con un disco duro SSD de 128 GB, y todo bajo una potente gr?fica NVIDIA GeForce GTX 1060 6GB GDDR5.\r\nProcesador Intel? Core? i7-8700 (3.2GHz up to 4.6GHz)\r\nMemoria RAM 16GB DDR4 2400 MHz\r\nDisco duro 1TB + 128GB\r\nAlmacenamiento ?ptico NO\r\nControlador gr?fico NVIDIA? GeForce? GTX 1060 6GB GDDR5\r\nConectividad\r\nKiller E2500 Gigabit Ethernet with Killer Shield\r\nWifi AC\r\nConexiones\r\nUSB 2.0: 4\r\nUSB 3.0 (3.1 Gen 1) Type-A: 4\r\nUSB 3.0 (3.1 Gen 1) Type-C: 1\r\nDVI port: No\r\nHDMI: 1\r\nEthernet LAN (RJ-45): 1\r\nLine-in: Y\r\nLine-out: Y\r\nEntrada Micr?fono: Si\r\nSalida auriculares: 1\r\nSistema operativo Microsoft Windows 10 Home\r\nDimensiones 170 x 376 x 433 mm\r\nPeso 9.69\r\nColor Negro', 'MSIAegis38RC-050EU.jpg', 'sobremesas', 1599),
	(15, 'Logitech G231 Prodigy', 'Logitech G231 Prodigy Auriculares Gaming', 'Les presentamos los auriculares gaming G231 Prodigy de Logitech. Los juegos no son s?lo gr?ficos. El sonido complementa la imagen. G231, que utiliza transductores de neodimio de 40 mm, aporta un sonido est?reo de alta calidad para sumergirse de lleno en el juego, de principio a fin. G231 funciona con Xbox One, Playstation y PC, para que oigas el incre?ble audio de todos tus juegos.', 'LogitechG231.jpg', 'sobremesas', 39.99),
	(16, 'Leotec Supernova Vision Plus', 'Leotec Supernova Vision Plus 10.1" IPS 2Gb/32Gb', 'Leotec presenta su nueva tablet Supernova Vision Plus 10.1" con calidad IPS con resoluci?n HD de 1280 x 800 y formato 16:10. Disfruta de juegos, aplicaciones, pel?culas con la calidad de imagen, brillo y color excepcional que solo la pantalla de IPS puede proporcionar.\r\n\r\nSu procesador Quad Core de 64bit te permitir? hacer volar tus aplicaciones favoritas, adem?s de 32GB de memoria (ampliable mediante tarjetas Micro SD) para que puedas almacenar todo lo que quieras.\r\n\r\nSu sistema operativo de ?ltima generaci?n Android 7.0 es actualizable por sistema OTA (ove the air) de forma autom?tica desde la propia tablet. Dispone adem?s de conexi?n Bluetooth 4.1, salida MiniHDMI y GPS.', 'tablet-5001sd.jpg', 'tablets', 119),
	(17, 'Huawei MediaPad', 'Huawei MediaPad T5 10" 32GB IPS Wifi Negra', 'Disfruta del excelente dise?o de Huawei MediaPad T5 10". Descubre el mundo en colores vibrantes a trav?s de una pantalla de 10 pulgadas FullHD. Adem?s, siente la calidad del cuerpo de metal de esta tablet.', 'img-2155.jpg', 'tablets', 229),
	(19, 'MSI Trident 3 8RD-213XEU', 'MSI Trident 3 8RD-213XEU Intel Core i7-8700/16GB/1', 'Te presentamos el Trident 3 de MSI, un ordenador de sobremesa compacto, que facilita su transporte all? donde vayas, ya sea a la Lan Party del A?o o pasar el verano a la casa del pueblo, nunca te aburrir?s.\r\nProcesador Intel? Core? i7-8700 (3.2GHz up to 4.6GHz)\r\nMemoria RAM 16GB DDR4 SODIMM\r\nDisco duro 1TB (7200 rpm S-ATA) + 512 M.2 SATA\r\nControlador gr?fico Nvidia GeForce GTX 1070 AERO ITX 8GB OC GDDR5\r\nConectividad\r\nLAN 10/100/1000\r\n802.11 ac\r\nBluetooth V4.2 High Speed\r\nConexiones\r\n1 x HDMI\r\n1 x VR-link port\r\n1 x salida de auriculares\r\n1 x entrada de micr?fono\r\n3 x USB 3.1 Type-A\r\n1 x USB 3.1 Type-C (Frontal)\r\n4 x USB 2.0\r\n1 x RJ45\r\nSistema operativo NO INCLUIDO\r\nDimensiones (Ancho x Profundidad x Altura)\r\nwith stand: 353.73 x 97.56 x 251.35 mm\r\nw/o stand: 346.25 x 232.47 x 71.83 mm\r\nPeso 3.17 kg\r\nColor Negro', 'MSITrident38RD-213XEU.jpg', 'sobremesas', 1699),
	(20, 'Samsung Galaxy Tab A', 'Samsung Galaxy Tab A 10.1" 2016 32GB Blanca', 'Da vida a tus contenidos. Sorpr?ndete con una resoluci?n de imagen incre?blemente realista con la tablet Galaxy Tab A 10.1 (2016) de Samsung. Su pantalla WUXGA de 10.1? te proporciona una nitidez tal que te sumergir?s en tus pel?culas y juegos. Adem?s, ahora podr?s llamar y recibir alertas de tus redes sociales de tu smartphone directamente en tu tablet. Adem?s, con Quick Reply responder?s y seguir?s tus notificaciones directamente en la pantalla.', 'b1.jpg', 'smartphones', 179),
	(21, 'Krom Kernel ', 'Krom Kernel Teclado Mec?nico Gaming RGB', 'Kernel cuenta con prestaciones de gama alta: podr?s asignar funciones macros a cualquier tecla, disfrutando de una pulsaci?n suave y efectiva gracias a sus switches mec?nicos. Gracias a su Modo Gaming (que desactiva la tecla Windows), su sistema anti ghosting y sus 11 teclas con funci?n multimedia, disfrutar?s de sesiones de juego fluidas y sin interrupciones. Su cable es trenzado, por lo que la resistencia y durabilidad de tu teclado Kernel est? asegurada.', 'Kromkernel.jpg', 'perifericos', 47.99),
	(22, 'One Plus 6T', 'OnePlus 6T 8GB/128GB Midnight Black Libre', 'Sistema operativo OxygenOS basado en Android? 9.0 Pie', 'onePlus.jpg', 'smartphones', 579),
	(23, 'Mars Gaming MM418 ', 'Mars Gaming MM418 Rat?n Gaming con Sensor ?ptico 3', 'El MM418 es el rat?n gaming con el que siempre has so?ado: hasta 32.000 DPI gracias a su exclusivo sensor ?ptico, un dise?o h?brido con prestaciones para shooters y MMOs, 12 botones programables, una espectacular iluminaci?n CHROMA RGB con m?ltiples efectos de iluminaci?n, sistema de pesos regulables... ?No querr?s utilizar ning?n otro rat?n despu?s de este! ', 'MarsGamingMM418.jpg', 'perifericos', 39.99),
	(24, 'Samsung Galaxy A9', 'Samsung Galaxy A9 Azul Libre', 'Pantalla: 6.3 pulgadas (Super AMOLED)Resoluci?n: 2,160x1,080 pixeles.Procesador: Snapdragon 660RAM: 6GB o 8GBAlmacenamiento: 128GB.Ranura microSD: S?, de hasta 512GBSistema operativo: Android Oreo.Bater?a: 3,800mAh', 'galaxyA9.jpg', 'smartphones', 499),
	(25, 'Televisor Nevir', 'Televisor Nevir NVR-7424-28HD-N 28" HD\r\n', 'Especificaciones NVR-7424-28HD-N:\r\nCompatibilidad\r\nReproducci?n Multiformato en Audio y Video\r\nDVB-T. DVB-C.\r\nPAL, SECAM. BG, DK, I.\r\nFunciones\r\nMen? OSD multilenguaje.\r\nSintonizaci?n auto y manual.\r\nEdici?n de canales.\r\nGu?a de programas EPG.\r\nTeletexto y texto r?pido.\r\nInformaci?n t?cnica\r\nResoluci?n 1.366 x 768.\r\nContraste 1.200:1. Brillo 180 cd/m2.\r\n?ngulo visi?n 178? / 178?.\r\nReducci?n digital ruido.\r\nAjuste T? de color.\r\nSonido\r\n4 modos ecualizaci?n.\r\nMute.\r\nSonido est?reo.\r\nPotencia: 6W RMS x 2.\r\nFunciones extras\r\nAutoapagado.\r\nFunci?n Hotel.\r\nControl Parental.\r\nEscaneo progresivo.\r\nTimeshift.\r\nConsumo m?ximo\r\n?50W. Standby ?0,5W.\r\nAlimentaci?n\r\n100-240 V. ~ 50/60Hz\r\nConexiones\r\nUSB 2, SCART, HDMI x 3, CI+, AV (mini), YPBPR (mini), Coaxial, RF, VGA, Salida Auriculares.\r\nAccesorios\r\nMando distancia multifunci?n\r\nDimensiones An. x Alt. x Fon. (mm.)\r\nCon peana 637 x 414 x 200\r\nSin peana 637 x 380 x 80\r\nEmbalaje\r\nUnidades embalaje 1\r\nDim. embalaje 728 x 458 x 137', 'bb1.jpg', 'televisiones', 129);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;

-- Volcando estructura para tabla tienda2.usuarios
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombreUsuario` varchar(30) COLLATE utf8_spanish_ci DEFAULT NULL,
  `contrasenya` varchar(500) COLLATE utf8_spanish_ci DEFAULT NULL,
  `nombre` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `apellidos` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `direccion` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `codigoPostal` int(5) unsigned zerofill DEFAULT NULL,
  `correoElectronico` varchar(200) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `id_2` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- Volcando datos para la tabla tienda2.usuarios: ~5 rows (aproximadamente)
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` (`id`, `nombreUsuario`, `contrasenya`, `nombre`, `apellidos`, `direccion`, `codigoPostal`, `correoElectronico`) VALUES
	(12, 'angel', 'ad', 'asd', 'asd', 'asd', 00002, 'oko@gmail.com');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

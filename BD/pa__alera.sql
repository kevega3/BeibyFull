-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-09-2020 a las 17:33:24
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pañalera`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `consultacliente` (IN `Idc` INT)  SELECT * FROM `cliente` WHERE Idc=Id_Cliente$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insersioncliente` (IN `Id_Cliente` INT, IN `Numero_Documento` INT, IN `estado` INT)  INSERT INTO `cliente`( `Numero_Documento`, `estado`) VALUES (Numero_Documento,estado)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insertcompra` (IN `id_Compra` INT, IN `fecha` DATE)  INSERT INTO `compra`( `id_Compra`, `fecha`) VALUES (id_Compra,fecha)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `modificarc` (IN `Id_Clientes` INT, IN `Numero_Documentos` INT, IN `estados` INT)  UPDATE `cliente` SET `Numero_Documento`=Numero_Documentos,`estado`=estados
WHERE `Id_Cliente`=Id_Clientes$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `Id_Cliente` int(11) NOT NULL,
  `Numero_Documento` int(11) DEFAULT NULL,
  `Nombres` varchar(100) NOT NULL,
  `Apellidos` varchar(100) NOT NULL,
  `Correo_Electronico` varchar(100) NOT NULL,
  `Número_Contacto` varchar(100) NOT NULL,
  `Direccion` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`Id_Cliente`, `Numero_Documento`, `Nombres`, `Apellidos`, `Correo_Electronico`, `Número_Contacto`, `Direccion`) VALUES
(1, 1000830624, 'Juan ', 'Aberto', 'jbalberto1@gmial.com', '7390000', 'hogarés'),
(2, 1000830627, 'Maicol', 'Rodriguez', 'mrod@hotmail.com', '3105867333', 'hogar'),
(3, 798040013, 'Dario', 'Marquez', 'darmar@gmail.com', '10010101', 'Suba'),
(4, 21047200, 'Nohora', 'Umaña', 'nelsa@outlook.com', '3008891827', 'Lomas'),
(5, 1000251376, 'Laura', 'Conejo', 'laco@gmail.com', '31000541', 'Peninsula'),
(6, 21047201, 'Carolina', 'Monrroy', 'camo@hotmail.es', '17811132', 'Hayuelos'),
(7, 21046322, 'Daniel', 'Poveda', 'dapove@ourtlook.es', '702020', 'Conejera'),
(8, 2147483647, 'Sayli', 'Romero', 'rosa@gmail.es', '3000505050', 'Victoria'),
(9, 245854322, 'Carolina', 'Peralta', 'capera@gmail.com', '3105799317', 'Roma'),
(10, 1000022222, 'Estebam', 'Mendoza', 'estemen@gmail.com', '1581561', 'pinares'),
(11, 3645323, 'Zaida', 'Martinez', 'zama@gmail.co,', '15151515', 'Bochica'),
(47, 99, 'gabriela', 'diaz', 'diaz01@gmail', '3333', 'lomas'),
(49, 12345678, 'nonax', 'aa', 'michi01@gmail.com', '2314312', 'dfsdfdsfds'),
(52, 88789784, 'pedro', 'pereira', 'pepe@gmail.com', '908756453', 'Casa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra`
--

CREATE TABLE `compra` (
  `id_Compra` int(11) NOT NULL,
  `fk_Idsede` int(11) DEFAULT NULL,
  `fk_idproveedor` int(11) DEFAULT NULL,
  `numero_serie` varchar(244) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `monto` double(32,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `compra`
--

INSERT INTO `compra` (`id_Compra`, `fk_Idsede`, `fk_idproveedor`, `numero_serie`, `fecha`, `monto`) VALUES
(19, 1, 1, '0000018', '2019-08-06', 46000),
(20, 1, 1, '0000019', '2019-08-06', 48000),
(21, 1, 1, '0000020', '2020-08-18', 50000),
(22, 1, 1, '0000021', '2020-08-25', 8000),
(24, 1, 2, '0000022', '2020-09-22', 216),
(25, 1, 2, '0000023', '2020-09-22', 5000),
(26, 1, 2, '0000024', '2020-09-22', 5000),
(27, 1, 2, '0000025', '2020-09-22', 5000),
(28, 1, 2, '0000026', '2020-09-22', 5000),
(29, 1, 2, '0000027', '2020-09-22', 5000),
(30, 1, 2, '0000028', '2020-09-22', 5000),
(31, 1, 2, '0000029', '2020-09-22', 5000),
(32, 1, 2, '0000030', '2020-09-22', 240);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_detalleproductosede_remision`
--

CREATE TABLE `detalle_detalleproductosede_remision` (
  `Id_DetalleProductoSede_Remision` int(11) NOT NULL,
  `Cantidad` decimal(32,0) DEFAULT NULL,
  `fk_idremision` int(11) DEFAULT NULL,
  `fkidprod` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `detalle_detalleproductosede_remision`
--

INSERT INTO `detalle_detalleproductosede_remision` (`Id_DetalleProductoSede_Remision`, `Cantidad`, `fk_idremision`, `fkidprod`) VALUES
(20, '10', 19, 5),
(21, '5', 20, 5),
(22, '5', 21, 5),
(23, '10', 22, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_dproductosede_compra`
--

CREATE TABLE `detalle_dproductosede_compra` (
  `Id_Detalleproducto_Idcompra` int(11) NOT NULL,
  `fk_idCompra` int(11) DEFAULT NULL,
  `fk_idproducto` int(11) DEFAULT NULL,
  `Cantidad` double(32,0) DEFAULT NULL,
  `precio` double(32,3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `detalle_dproductosede_compra`
--

INSERT INTO `detalle_dproductosede_compra` (`Id_Detalleproducto_Idcompra`, `fk_idCompra`, `fk_idproducto`, `Cantidad`, `precio`) VALUES
(46, 19, 1, 3, 5000.000),
(47, 19, 1, 3, 5000.000),
(48, 19, 6, 1, 8000.000),
(49, 19, 6, 1, 8000.000),
(50, 20, 6, 6, 8000.000),
(51, 21, 1, 10, 5000.000),
(52, 22, 6, 1, 8000.000),
(53, 22, 4, 1, 24.000),
(54, 24, 4, 1, 24.000),
(55, 24, 4, 8, 24.000),
(56, 25, 1, 1, 5000.000),
(57, 26, 1, 1, 5000.000),
(58, 27, 1, 1, 5000.000),
(59, 28, 1, 1, 5000.000),
(60, 29, 1, 1, 5000.000),
(61, 30, 1, 1, 5000.000),
(62, 31, 1, 1, 5000.000),
(63, 31, 1, 10, 5000.000),
(64, 32, 4, 10, 24.000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_producto_novedad`
--

CREATE TABLE `detalle_producto_novedad` (
  `Id_Detalle_Productosede_Novedad` int(11) NOT NULL,
  `Cantidad` double(32,0) DEFAULT NULL,
  `fk_idnovedad` int(11) DEFAULT NULL,
  `fk_producto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `detalle_producto_novedad`
--

INSERT INTO `detalle_producto_novedad` (`Id_Detalle_Productosede_Novedad`, `Cantidad`, `fk_idnovedad`, `fk_producto`) VALUES
(11, 1, 17, 6),
(12, 1, 18, 1),
(13, 8, 19, 6),
(14, 8, 20, 6),
(21, 9, 28, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_venta`
--

CREATE TABLE `detalle_venta` (
  `id_detalle_venta` int(11) NOT NULL,
  `fk_idventa` int(11) DEFAULT NULL,
  `fk_idproducto` int(11) DEFAULT NULL,
  `Cantidad` double(32,0) DEFAULT NULL,
  `precio` double(32,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `detalle_venta`
--

INSERT INTO `detalle_venta` (`id_detalle_venta`, `fk_idventa`, `fk_idproducto`, `Cantidad`, `precio`) VALUES
(1, 4, 1, 1, 5000),
(2, 5, 1, 1, 5000),
(3, 5, 6, 5, 8000),
(4, 6, 6, 1, 8000),
(12, 10, 1, 10, 5000),
(13, 11, 1, 10, 5000),
(14, 12, 1, 10, 5000),
(15, 13, 1, 10, 5000),
(16, 14, 1, 10, 5000),
(17, 18, 1, 3, 5000),
(18, 18, 6, 3, 8000),
(19, 18, 5, 5, 7),
(20, 19, 6, 10, 8000),
(21, 19, 4, 5, 24),
(22, 19, 6, 1, 8000),
(23, 21, 6, 1, 8000),
(50, 23, 5, 1, 7),
(51, 23, 1, 10, 5000),
(52, 24, 1, 10, 5000),
(53, 24, 1, 7, 5000),
(54, 24, 1, 10, 5000),
(55, 25, 1, 2, 5000),
(56, 25, 6, 1, 8000),
(57, 26, 5, 2, 7),
(58, 27, 5, 10, 7),
(59, 28, 6, 10, 8000),
(64, 31, 1, 10, 5000),
(65, 32, 6, 7, 8000),
(66, 33, 3, 20, 150),
(67, 33, 4, 10, 24),
(68, 34, 4, 1, 24),
(69, 35, 4, 11, 24),
(70, 35, 4, 11, 24),
(71, 36, 4, 9, 24),
(72, 36, 1, 7, 5000),
(73, 37, 4, 1, 24),
(74, 38, 4, 1, 24),
(75, 39, 5, 1, 7),
(76, 40, 4, 1, 24),
(77, 41, 5, 1, 7),
(78, 41, 3, 10, 150),
(79, 42, 8, 10, 12500),
(80, 43, 4, 7, 24),
(81, 44, 5, 8, 7),
(82, 45, 4, 10, 24);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estado`
--

CREATE TABLE `estado` (
  `Id_Estado` int(11) NOT NULL,
  `Estado` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estado`
--

INSERT INTO `estado` (`Id_Estado`, `Estado`) VALUES
(1, 'Activo'),
(2, 'Inactivo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marca`
--

CREATE TABLE `marca` (
  `Id_Marca` int(11) NOT NULL,
  `Nombre_Marca` char(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `marca`
--

INSERT INTO `marca` (`Id_Marca`, `Nombre_Marca`) VALUES
(5, 'Alpinas'),
(7, 'Baby sec'),
(4, 'corchito'),
(9, 'Familia'),
(16, 'Klim'),
(26, 'Michis'),
(1, 'Pequeñin'),
(6, 'Polar'),
(8, 'Tecno Quimicas'),
(2, 'Winny');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `novedad`
--

CREATE TABLE `novedad` (
  `Id_Novedad` int(11) NOT NULL,
  `Descripcion` varchar(100) NOT NULL,
  `Fecha` varchar(12) DEFAULT NULL,
  `Destino` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `novedad`
--

INSERT INTO `novedad` (`Id_Novedad`, `Descripcion`, `Fecha`, `Destino`) VALUES
(17, 'se regalo', '2020-08-20', 'Fundifamilia'),
(18, 'intentando', '2020-08-20', 'Fundifamilia'),
(19, 'las leches se han vencido', '2020-08-20', 'Fundifamilia'),
(20, 'intento', '2020-08-22', 'Fundifamilia'),
(28, 'se regalo', '2020-08-31', 'Fundifamilia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `Id_Persona` int(11) NOT NULL,
  `Nombre` varchar(25) NOT NULL,
  `Apellidos` varchar(30) NOT NULL,
  `FKTipo_Documento` int(11) NOT NULL,
  `Numero_Documento` varchar(110) NOT NULL,
  `Correo_Electronico` varchar(50) NOT NULL,
  `Clave` varchar(15) NOT NULL,
  `Numero_Contacto` varchar(33) NOT NULL,
  `Direccion` varchar(50) NOT NULL,
  `FKEstado` int(11) NOT NULL,
  `FKRol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`Id_Persona`, `Nombre`, `Apellidos`, `FKTipo_Documento`, `Numero_Documento`, `Correo_Electronico`, `Clave`, `Numero_Contacto`, `Direccion`, `FKEstado`, `FKRol`) VALUES
(1, 'Javier', 'Capera', 12, '1018408812', 'bjcapera@misena.edu.co', '03565950', '7390804', 'Cra 150A #12B-18', 1, 2),
(2, 'Esteban', 'Mendivelso', 7, '1002514820', 'lemendivelso7@misena.edu.co', 'esteban12', '2147483647', 'Calle 11 No. 4 - 14', 1, 1),
(3, 'Sebastian', 'Florez', 12, '1023564480', 'sgflorez@misena.edu.co', '88582481', '2147483647', '	Avenida Cra. 60 No. 57-60', 1, 3),
(4, 'Daniel', 'Sosa', 7, '1023502210', 'dasosa18@misena.edu.co', 'danipoveda', '2147483647', 'Carrera 7 No. 22 - 79', 1, 1),
(5, 'Rosa', 'peñáaaaaa', 7, '1000201120', 'rosap@gmail.com', 'rosita028', '2147483647', 'Cra. 18 No. 82 - 35', 1, 1),
(6, 'Sebastian', 'Quintero', 9, '1002012321', 'juanse@outlook.es', 'juanse2020', '2147483647', 'Cr.4 # 19-85 Piso 2', 1, 2),
(7, 'Brandom', 'Suarez', 7, '1203320120', 'brsuarez@hotmail.com', '85581372', '2147483647', 'Carrera 74 No. 82a-81', 1, 3),
(66, 'Javier', 'orjueal', 12, '1018408815', 'jo@gmail.com', '09601833', '2314310', 'dfsdfdsfds', 1, 3),
(85, 'Michis', 'Amborguesas', 12, '234324324', 'sebasflorez48@gmail.com', '72830427', '2314312', 'dfsdfdsfds', 1, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `codigo` int(11) NOT NULL,
  `numero_serie` int(30) NOT NULL,
  `Nombre` char(30) DEFAULT NULL,
  `Valor` double(32,0) DEFAULT NULL,
  `Cantidad_en_Existencia` double(32,0) DEFAULT NULL,
  `fk_idtipoprod` int(11) DEFAULT NULL,
  `fk_idMarca` int(11) DEFAULT NULL,
  `fk_idestado` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`codigo`, `numero_serie`, `Nombre`, `Valor`, `Cantidad_en_Existencia`, `fk_idtipoprod`, `fk_idMarca`, `fk_idestado`) VALUES
(1, 1010101010, 'Wiinny et1', 5000, 1000, 10, 2, '1'),
(2, 2020202, 'Wiinny et2', 170000, 4093, 10, 2, '1'),
(3, 555555, 'Wiinny et1', 150, 1990, 20, 16, '1'),
(4, 123456, 'Wiinny et4', 24, 1950, 10, 2, '1'),
(5, 98574741, 'Wiinny x100 toallita', 7, 740, 10, 2, '1'),
(6, 66666, 'Pequeñin x110 karite', 8000, 640, 10, 1, '1'),
(7, 7777777, 'Pequeñin x 24 karite', 3, 890, 10, 1, '1'),
(8, 4444444, 'tijeras', 12500, 140, 13, 9, '1'),
(9, 333333, 'Bebesitos', 41, 450, 18, 9, '1'),
(10, 2222222, 'Corchito', 5, 2000000, 16, 4, '1'),
(20, 2020, 'prueba', 3000, 100, 16, 6, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `Id_Proveedor` int(11) NOT NULL,
  `numero_documento` varchar(20) DEFAULT NULL,
  `Nombre` varchar(30) DEFAULT NULL,
  `Direccion` varchar(30) CHARACTER SET utf8 DEFAULT NULL,
  `Numero_Contacto` varchar(20) DEFAULT NULL,
  `fk_tipodoc` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`Id_Proveedor`, `numero_documento`, `Nombre`, `Direccion`, `Numero_Contacto`, `fk_tipodoc`) VALUES
(1, '770091', 'Ventas y Marcas', 'Corabastos', '789098756', 7),
(2, '79807330', 'Tecno Quimicas', 'Zona Industrial', '2791352', 7),
(3, '535482', 'Distri Nicols', 'Centro', '6787654', 7),
(4, '456786543', 'Familia', 'Zona Industrial', '7390804', 7),
(5, '456764', 'Nestle', 'Zona Industrial', '4545435', 7),
(6, '9865434', 'Alpina', 'Zona Industrial', '32134346', 7),
(7, '56788754', 'Corchito', 'Zona Industrial', '576543467', 7),
(8, '654334', 'Bebesitos', 'Restrepo', '65342543', 7),
(9, '23454300', 'Luñis', 'Tocancipa', '45434343', 7),
(10, '345345345', 'Forros Pinocho', 'Tocancipá', '235235235', 7),
(97, '7700', 'PEDRO', 'TRA', '00000', 7),
(108, '787687686', 'ññññññ', 'ñññññññ', '301201010', 12);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `remision`
--

CREATE TABLE `remision` (
  `Id_Remision` int(11) NOT NULL,
  `Fecha` varchar(30) DEFAULT NULL,
  `fk_sede` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `remision`
--

INSERT INTO `remision` (`Id_Remision`, `Fecha`, `fk_sede`) VALUES
(19, '2020-08-18', 1),
(20, '2020-08-22', 2),
(21, '2020-08-22', 1),
(22, '2020-08-22', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `Id_Rol` int(11) NOT NULL,
  `Nombre_Rol` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`Id_Rol`, `Nombre_Rol`) VALUES
(1, 'Administrador  \r\n'),
(3, 'Almacenista'),
(2, 'Vendedor');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sede`
--

CREATE TABLE `sede` (
  `Id_Sede` int(11) NOT NULL,
  `Nombre_Sede` char(30) DEFAULT NULL,
  `Direccion_Sede` char(20) DEFAULT NULL,
  `Barrio_Sede` char(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `sede`
--

INSERT INTO `sede` (`Id_Sede`, `Nombre_Sede`, `Direccion_Sede`, `Barrio_Sede`) VALUES
(1, 'Marco Fidel', 'Diagonal 46 # 13f 68', 'San Joge'),
(2, 'Lucero', 'Diagonal 5b 6 sur', 'Lucero Bajo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_documento`
--

CREATE TABLE `tipo_documento` (
  `Id_Tipo_Documento` int(11) NOT NULL,
  `Nombre_Tipo_Documento` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_documento`
--

INSERT INTO `tipo_documento` (`Id_Tipo_Documento`, `Nombre_Tipo_Documento`) VALUES
(7, ' Numero de Identificacion Tributario'),
(9, 'Cedula  extranjera'),
(12, 'Cedula ciudadana'),
(22, 'Otro');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_producto`
--

CREATE TABLE `tipo_producto` (
  `Id_TIpo_Producto` int(11) NOT NULL,
  `Nombre_Tipo_Producto` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `tipo_producto`
--

INSERT INTO `tipo_producto` (`Id_TIpo_Producto`, `Nombre_Tipo_Producto`) VALUES
(16, 'Accesorios'),
(17, 'Aseo'),
(14, 'Biberones'),
(22, 'Café'),
(18, 'Compotas'),
(11, 'Cremas'),
(12, 'Leches'),
(20, 'Otros'),
(10, 'Pañales'),
(13, 'Ropa'),
(35, 'Tennis'),
(37, 'Zapato'),
(15, 'Zapatos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id` int(11) NOT NULL,
  `FK_IdCliente` int(11) DEFAULT NULL,
  `fk_persona` int(11) DEFAULT NULL,
  `numero_serie` varchar(244) NOT NULL,
  `Fecha` date DEFAULT NULL,
  `Monto` double DEFAULT NULL,
  `Estado` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id`, `FK_IdCliente`, `fk_persona`, `numero_serie`, `Fecha`, `Monto`, `Estado`) VALUES
(4, 1, 1, '0000004', '2019-08-06', 5000, '1'),
(5, 6, 1, '0000005', '2019-08-06', 45000, '1'),
(6, 1, 1, '0000006', '2019-08-06', 8000, '1'),
(10, 1, 1, '0000010', '2019-08-06', 50000, '1'),
(11, 1, 1, '0000011', '2019-08-06', 50000, '1'),
(12, 1, 1, '0000012', '2019-08-06', 50000, '1'),
(13, 1, 1, '0000013', '2019-08-06', 50000, '1'),
(14, 1, 1, '0000014', '2019-08-06', 50000, '1'),
(18, 1, 1, '0000018', '2019-08-06', 39035, '1'),
(19, 1, 1, '0000019', '2019-08-06', 80120, '1'),
(21, 1, 1, '0000021', '2019-08-06', 8000, '1'),
(23, 4, 1, '0000023', '2020-08-18', 7, '1'),
(24, 4, 1, '0000024', '2020-08-18', 85000, '1'),
(25, 1, 1, '0000025', '2020-08-22', 18000, '1'),
(26, 1, 1, '0000026', '2020-08-22', 14, '1'),
(27, 1, 1, '0000027', '2020-08-22', 70, '1'),
(28, 1, 1, '0000028', '2020-08-25', 80000, '1'),
(31, 1, 1, '0000029', '2020-08-31', 50000, '1'),
(32, 1, 1, '0000030', '2020-09-01', 56000, '1'),
(33, 1, 1, '0000031', '2020-09-08', 3240, '1'),
(34, 4, 1, '0000032', '2020-09-15', 24, '1'),
(35, 4, 1, '0000033', '2020-09-22', 528, '1'),
(36, 4, 1, '0000034', '2020-09-22', 35216, '1'),
(37, 4, 1, '0000035', '2020-09-22', 24, '1'),
(38, 4, 1, '0000036', '2020-09-22', 24, '1'),
(39, 4, 1, '0000037', '2020-09-22', 7, '1'),
(40, 4, 1, '0000038', '2020-09-22', 24, '1'),
(41, 4, 1, '0000039', '2020-09-22', 1507, '1'),
(42, 9, 7, '0000040', '2020-09-22', 125000, '1'),
(43, 4, 1, '0000041', '2020-09-22', 168, '1'),
(44, 4, 1, '0000042', '2020-09-28', 56, '1'),
(45, 1, 1, '0000043', '2020-09-28', 240, '1');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`Id_Cliente`),
  ADD UNIQUE KEY `Numero_Documento` (`Numero_Documento`,`Correo_Electronico`,`Número_Contacto`);

--
-- Indices de la tabla `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`id_Compra`),
  ADD UNIQUE KEY `numero_serie` (`numero_serie`),
  ADD UNIQUE KEY `numero_serie_2` (`numero_serie`),
  ADD KEY `fk_sedes` (`fk_Idsede`),
  ADD KEY `fk_sede_prov` (`fk_idproveedor`);

--
-- Indices de la tabla `detalle_detalleproductosede_remision`
--
ALTER TABLE `detalle_detalleproductosede_remision`
  ADD PRIMARY KEY (`Id_DetalleProductoSede_Remision`),
  ADD KEY `FK_idremi` (`fk_idremision`),
  ADD KEY `fkprod` (`fkidprod`);

--
-- Indices de la tabla `detalle_dproductosede_compra`
--
ALTER TABLE `detalle_dproductosede_compra`
  ADD PRIMARY KEY (`Id_Detalleproducto_Idcompra`),
  ADD KEY `FK_detalle_comra` (`fk_idCompra`),
  ADD KEY `fkidproducto` (`fk_idproducto`);

--
-- Indices de la tabla `detalle_producto_novedad`
--
ALTER TABLE `detalle_producto_novedad`
  ADD PRIMARY KEY (`Id_Detalle_Productosede_Novedad`),
  ADD KEY `FK_novedad_d_n_p_s` (`fk_idnovedad`),
  ADD KEY `fk_detallepsede` (`fk_producto`);

--
-- Indices de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD PRIMARY KEY (`id_detalle_venta`),
  ADD KEY `ventas` (`fk_idventa`),
  ADD KEY `producto` (`fk_idproducto`);

--
-- Indices de la tabla `estado`
--
ALTER TABLE `estado`
  ADD PRIMARY KEY (`Id_Estado`),
  ADD UNIQUE KEY `Estado` (`Estado`);

--
-- Indices de la tabla `marca`
--
ALTER TABLE `marca`
  ADD PRIMARY KEY (`Id_Marca`),
  ADD UNIQUE KEY `Nombre_Marca` (`Nombre_Marca`),
  ADD UNIQUE KEY `Nombre_Marca_2` (`Nombre_Marca`);

--
-- Indices de la tabla `novedad`
--
ALTER TABLE `novedad`
  ADD PRIMARY KEY (`Id_Novedad`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`Id_Persona`),
  ADD UNIQUE KEY `Numero_Documento` (`Numero_Documento`),
  ADD UNIQUE KEY `Correo_Electronico` (`Correo_Electronico`),
  ADD UNIQUE KEY `Correo_Electronico_2` (`Correo_Electronico`),
  ADD UNIQUE KEY `Numero_Documento_2` (`Numero_Documento`),
  ADD KEY `FKEstado` (`FKEstado`),
  ADD KEY `FKRol` (`FKRol`),
  ADD KEY `FKTipo_Documento` (`FKTipo_Documento`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`codigo`),
  ADD UNIQUE KEY `numero_serie` (`numero_serie`),
  ADD KEY `fk_idproductos` (`fk_idtipoprod`),
  ADD KEY `fk_marca` (`fk_idMarca`),
  ADD KEY `fk_idestado` (`fk_idestado`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`Id_Proveedor`),
  ADD UNIQUE KEY `numero_documento` (`numero_documento`,`Nombre`,`Direccion`,`Numero_Contacto`),
  ADD KEY `fktpdoc` (`fk_tipodoc`);

--
-- Indices de la tabla `remision`
--
ALTER TABLE `remision`
  ADD PRIMARY KEY (`Id_Remision`),
  ADD KEY `fk_sede` (`fk_sede`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`Id_Rol`),
  ADD UNIQUE KEY `Nombre_Rol` (`Nombre_Rol`);

--
-- Indices de la tabla `sede`
--
ALTER TABLE `sede`
  ADD PRIMARY KEY (`Id_Sede`),
  ADD UNIQUE KEY `Nombre_Sede` (`Nombre_Sede`,`Direccion_Sede`);

--
-- Indices de la tabla `tipo_documento`
--
ALTER TABLE `tipo_documento`
  ADD PRIMARY KEY (`Id_Tipo_Documento`),
  ADD UNIQUE KEY `Nombre_Tipo_Documento` (`Nombre_Tipo_Documento`);

--
-- Indices de la tabla `tipo_producto`
--
ALTER TABLE `tipo_producto`
  ADD PRIMARY KEY (`Id_TIpo_Producto`),
  ADD UNIQUE KEY `Nombre_Tipo_Producto` (`Nombre_Tipo_Producto`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `numero_serie` (`numero_serie`),
  ADD KEY `persona` (`fk_persona`),
  ADD KEY `cliente` (`FK_IdCliente`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `Id_Cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT de la tabla `compra`
--
ALTER TABLE `compra`
  MODIFY `id_Compra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT de la tabla `detalle_detalleproductosede_remision`
--
ALTER TABLE `detalle_detalleproductosede_remision`
  MODIFY `Id_DetalleProductoSede_Remision` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `detalle_dproductosede_compra`
--
ALTER TABLE `detalle_dproductosede_compra`
  MODIFY `Id_Detalleproducto_Idcompra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;

--
-- AUTO_INCREMENT de la tabla `detalle_producto_novedad`
--
ALTER TABLE `detalle_producto_novedad`
  MODIFY `Id_Detalle_Productosede_Novedad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  MODIFY `id_detalle_venta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=83;

--
-- AUTO_INCREMENT de la tabla `estado`
--
ALTER TABLE `estado`
  MODIFY `Id_Estado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `marca`
--
ALTER TABLE `marca`
  MODIFY `Id_Marca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `novedad`
--
ALTER TABLE `novedad`
  MODIFY `Id_Novedad` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `Id_Persona` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `codigo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `Id_Proveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT de la tabla `remision`
--
ALTER TABLE `remision`
  MODIFY `Id_Remision` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `Id_Rol` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `sede`
--
ALTER TABLE `sede`
  MODIFY `Id_Sede` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de la tabla `tipo_documento`
--
ALTER TABLE `tipo_documento`
  MODIFY `Id_Tipo_Documento` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `tipo_producto`
--
ALTER TABLE `tipo_producto`
  MODIFY `Id_TIpo_Producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compra`
--
ALTER TABLE `compra`
  ADD CONSTRAINT `fk_sede_prov` FOREIGN KEY (`fk_idproveedor`) REFERENCES `proveedor` (`Id_Proveedor`),
  ADD CONSTRAINT `fk_sedes` FOREIGN KEY (`fk_Idsede`) REFERENCES `sede` (`Id_Sede`);

--
-- Filtros para la tabla `detalle_detalleproductosede_remision`
--
ALTER TABLE `detalle_detalleproductosede_remision`
  ADD CONSTRAINT `FK_idremi` FOREIGN KEY (`fk_idremision`) REFERENCES `remision` (`Id_Remision`),
  ADD CONSTRAINT `fkprod` FOREIGN KEY (`fkidprod`) REFERENCES `producto` (`codigo`);

--
-- Filtros para la tabla `detalle_dproductosede_compra`
--
ALTER TABLE `detalle_dproductosede_compra`
  ADD CONSTRAINT `FK_detalle_comra` FOREIGN KEY (`fk_idCompra`) REFERENCES `compra` (`id_Compra`),
  ADD CONSTRAINT `fkidproducto` FOREIGN KEY (`fk_idproducto`) REFERENCES `producto` (`codigo`);

--
-- Filtros para la tabla `detalle_producto_novedad`
--
ALTER TABLE `detalle_producto_novedad`
  ADD CONSTRAINT `FK_novedad_d_n_p_s` FOREIGN KEY (`fk_idnovedad`) REFERENCES `novedad` (`Id_Novedad`),
  ADD CONSTRAINT `fk_idproducto` FOREIGN KEY (`fk_producto`) REFERENCES `producto` (`codigo`);

--
-- Filtros para la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD CONSTRAINT `producto` FOREIGN KEY (`fk_idproducto`) REFERENCES `producto` (`codigo`),
  ADD CONSTRAINT `ventas` FOREIGN KEY (`fk_idventa`) REFERENCES `ventas` (`id`);

--
-- Filtros para la tabla `persona`
--
ALTER TABLE `persona`
  ADD CONSTRAINT `FKEstado` FOREIGN KEY (`FKEstado`) REFERENCES `estado` (`Id_Estado`),
  ADD CONSTRAINT `FKRol` FOREIGN KEY (`FKRol`) REFERENCES `rol` (`Id_Rol`),
  ADD CONSTRAINT `FKTipo_Documento` FOREIGN KEY (`FKTipo_Documento`) REFERENCES `tipo_documento` (`Id_Tipo_Documento`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `fk_idproductos` FOREIGN KEY (`fk_idtipoprod`) REFERENCES `tipo_producto` (`Id_TIpo_Producto`),
  ADD CONSTRAINT `fk_marca` FOREIGN KEY (`fk_idMarca`) REFERENCES `marca` (`Id_Marca`);

--
-- Filtros para la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD CONSTRAINT `fktpdoc` FOREIGN KEY (`fk_tipodoc`) REFERENCES `tipo_documento` (`Id_Tipo_Documento`);

--
-- Filtros para la tabla `remision`
--
ALTER TABLE `remision`
  ADD CONSTRAINT `fk_sede` FOREIGN KEY (`fk_sede`) REFERENCES `sede` (`Id_Sede`);

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `cliente` FOREIGN KEY (`FK_IdCliente`) REFERENCES `cliente` (`Id_Cliente`),
  ADD CONSTRAINT `persona` FOREIGN KEY (`fk_persona`) REFERENCES `persona` (`Id_Persona`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

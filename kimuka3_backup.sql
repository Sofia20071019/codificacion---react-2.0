-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: Kimuka3_db
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `asignacion`
--

DROP TABLE IF EXISTS `asignacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asignacion` (
  `idAsignacion` varchar(10) NOT NULL,
  `idUsuario_Empleado` varchar(10) DEFAULT NULL,
  `idInsumo` varchar(10) DEFAULT NULL,
  `cantidad` decimal(10,2) NOT NULL,
  `fechaAsignacion` date DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idAsignacion`),
  KEY `idUsuario_Empleado` (`idUsuario_Empleado`),
  KEY `idInsumo` (`idInsumo`),
  CONSTRAINT `asignacion_ibfk_1` FOREIGN KEY (`idUsuario_Empleado`) REFERENCES `usuario` (`idUsuario`),
  CONSTRAINT `asignacion_ibfk_2` FOREIGN KEY (`idInsumo`) REFERENCES `insumo` (`idInsumo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asignacion`
--

LOCK TABLES `asignacion` WRITE;
/*!40000 ALTER TABLE `asignacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `asignacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria` (
  `idCategoria` varchar(10) NOT NULL,
  `nombreCategoria` varchar(100) NOT NULL,
  PRIMARY KEY (`idCategoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES ('CAT-001','Telas'),('CAT-002','Cauchos'),('CAT-003','Cremalleras'),('CAT-004','Moldes'),('CAT-005','Marquillas');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `idCliente` varchar(10) NOT NULL,
  `nombreCliente` varchar(100) DEFAULT NULL,
  `telefono` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`idCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES ('CLI-001','Juan Pérez',3001234567);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_orden`
--

DROP TABLE IF EXISTS `detalle_orden`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalle_orden` (
  `idDetalle` varchar(10) NOT NULL,
  `idOrden` varchar(10) DEFAULT NULL,
  `idProducto` varchar(10) DEFAULT NULL,
  `cantidadTotal` int(11) DEFAULT NULL,
  PRIMARY KEY (`idDetalle`),
  KEY `idOrden` (`idOrden`),
  KEY `idProducto` (`idProducto`),
  CONSTRAINT `detalle_orden_ibfk_1` FOREIGN KEY (`idOrden`) REFERENCES `orden_produccion` (`idOrden`) ON DELETE CASCADE,
  CONSTRAINT `detalle_orden_ibfk_2` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_orden`
--

LOCK TABLES `detalle_orden` WRITE;
/*!40000 ALTER TABLE `detalle_orden` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_orden` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado_usuario`
--

DROP TABLE IF EXISTS `estado_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estado_usuario` (
  `idEstado` varchar(10) NOT NULL,
  `nombreEstado` varchar(50) NOT NULL,
  PRIMARY KEY (`idEstado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado_usuario`
--

LOCK TABLES `estado_usuario` WRITE;
/*!40000 ALTER TABLE `estado_usuario` DISABLE KEYS */;
INSERT INTO `estado_usuario` VALUES ('EST-001','ACTIVO'),('EST-002','INACTIVO');
/*!40000 ALTER TABLE `estado_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ficha_tecnica`
--

DROP TABLE IF EXISTS `ficha_tecnica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ficha_tecnica` (
  `idFicha` varchar(10) NOT NULL,
  `idProducto` varchar(10) DEFAULT NULL,
  `idInsumo` varchar(10) DEFAULT NULL,
  `cantidadNecesaria` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`idFicha`),
  KEY `idProducto` (`idProducto`),
  KEY `idInsumo` (`idInsumo`),
  CONSTRAINT `ficha_tecnica_ibfk_1` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`) ON DELETE CASCADE,
  CONSTRAINT `ficha_tecnica_ibfk_2` FOREIGN KEY (`idInsumo`) REFERENCES `insumo` (`idInsumo`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ficha_tecnica`
--

LOCK TABLES `ficha_tecnica` WRITE;
/*!40000 ALTER TABLE `ficha_tecnica` DISABLE KEYS */;
/*!40000 ALTER TABLE `ficha_tecnica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insumo`
--

DROP TABLE IF EXISTS `insumo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `insumo` (
  `idInsumo` varchar(10) NOT NULL,
  `nombreInsumo` varchar(100) DEFAULT NULL,
  `idCategoria` varchar(10) DEFAULT NULL,
  `idUnidad` varchar(10) DEFAULT NULL,
  `cantidad` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`idInsumo`),
  KEY `idCategoria` (`idCategoria`),
  KEY `idUnidad` (`idUnidad`),
  CONSTRAINT `insumo_ibfk_1` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`),
  CONSTRAINT `insumo_ibfk_2` FOREIGN KEY (`idUnidad`) REFERENCES `unidad_medida` (`idUnidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insumo`
--

LOCK TABLES `insumo` WRITE;
/*!40000 ALTER TABLE `insumo` DISABLE KEYS */;
INSERT INTO `insumo` VALUES ('INS-001','Tela Algodón',NULL,'MED-001',0.00);
/*!40000 ALTER TABLE `insumo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jornada_laboral`
--

DROP TABLE IF EXISTS `jornada_laboral`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jornada_laboral` (
  `idJornada` varchar(10) NOT NULL,
  `idUsuario_Empleado` varchar(10) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `hInicio` time DEFAULT NULL,
  `hFin` time DEFAULT NULL,
  PRIMARY KEY (`idJornada`),
  KEY `idUsuario_Empleado` (`idUsuario_Empleado`),
  CONSTRAINT `jornada_laboral_ibfk_1` FOREIGN KEY (`idUsuario_Empleado`) REFERENCES `usuario` (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jornada_laboral`
--

LOCK TABLES `jornada_laboral` WRITE;
/*!40000 ALTER TABLE `jornada_laboral` DISABLE KEYS */;
/*!40000 ALTER TABLE `jornada_laboral` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metodo_pago`
--

DROP TABLE IF EXISTS `metodo_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metodo_pago` (
  `idMetodo` varchar(10) NOT NULL,
  `nombreMetodo` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idMetodo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metodo_pago`
--

LOCK TABLES `metodo_pago` WRITE;
/*!40000 ALTER TABLE `metodo_pago` DISABLE KEYS */;
INSERT INTO `metodo_pago` VALUES ('MET-001','Transferencia Bancaria'),('MET-002','Nequi'),('MET-003','Daviplata'),('MET-004','Efectivo');
/*!40000 ALTER TABLE `metodo_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orden_produccion`
--

DROP TABLE IF EXISTS `orden_produccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orden_produccion` (
  `idOrden` varchar(10) NOT NULL,
  `idCliente` varchar(10) DEFAULT NULL,
  `idUsuario_Admin` varchar(10) DEFAULT NULL,
  `fechaPedido` date DEFAULT NULL,
  `estadoProd` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idOrden`),
  KEY `idCliente` (`idCliente`),
  KEY `idUsuario_Admin` (`idUsuario_Admin`),
  CONSTRAINT `orden_produccion_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`),
  CONSTRAINT `orden_produccion_ibfk_2` FOREIGN KEY (`idUsuario_Admin`) REFERENCES `usuario` (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orden_produccion`
--

LOCK TABLES `orden_produccion` WRITE;
/*!40000 ALTER TABLE `orden_produccion` DISABLE KEYS */;
/*!40000 ALTER TABLE `orden_produccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pago`
--

DROP TABLE IF EXISTS `pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pago` (
  `idPago` varchar(10) NOT NULL,
  `idJornada` varchar(10) DEFAULT NULL,
  `idUsuario_Admin` varchar(10) DEFAULT NULL,
  `montoPagado` decimal(10,2) DEFAULT NULL,
  `idMetodo` varchar(10) DEFAULT NULL,
  `fechaPago` date DEFAULT NULL,
  PRIMARY KEY (`idPago`),
  KEY `idJornada` (`idJornada`),
  KEY `idUsuario_Admin` (`idUsuario_Admin`),
  KEY `idMetodo` (`idMetodo`),
  CONSTRAINT `pago_ibfk_1` FOREIGN KEY (`idJornada`) REFERENCES `jornada_laboral` (`idJornada`),
  CONSTRAINT `pago_ibfk_2` FOREIGN KEY (`idUsuario_Admin`) REFERENCES `usuario` (`idUsuario`),
  CONSTRAINT `pago_ibfk_3` FOREIGN KEY (`idMetodo`) REFERENCES `metodo_pago` (`idMetodo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pago`
--

LOCK TABLES `pago` WRITE;
/*!40000 ALTER TABLE `pago` DISABLE KEYS */;
/*!40000 ALTER TABLE `pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producto` (
  `idProducto` varchar(10) NOT NULL,
  `nombreProducto` varchar(100) DEFAULT NULL,
  `talla` varchar(10) DEFAULT NULL,
  `color` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rol`
--

DROP TABLE IF EXISTS `rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rol` (
  `idRol` varchar(10) NOT NULL,
  `nombreRol` varchar(50) NOT NULL,
  PRIMARY KEY (`idRol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` VALUES ('ROL-001','ADMIN'),('ROL-002','EMPLEADO');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidad_medida`
--

DROP TABLE IF EXISTS `unidad_medida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unidad_medida` (
  `idUnidad` varchar(10) NOT NULL,
  `nombreUnidad` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`idUnidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidad_medida`
--

LOCK TABLES `unidad_medida` WRITE;
/*!40000 ALTER TABLE `unidad_medida` DISABLE KEYS */;
INSERT INTO `unidad_medida` VALUES ('MED-001','Metros'),('MED-002','Unidades');
/*!40000 ALTER TABLE `unidad_medida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `idUsuario` varchar(10) NOT NULL,
  `pNombre` varchar(50) DEFAULT NULL,
  `sNombre` varchar(50) DEFAULT NULL,
  `pApellido` varchar(50) DEFAULT NULL,
  `sApellido` varchar(50) DEFAULT NULL,
  `correo` varchar(100) NOT NULL,
  `passwordHash` varchar(255) NOT NULL,
  `idRol` varchar(10) DEFAULT NULL,
  `idEstado` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`idUsuario`),
  UNIQUE KEY `correo` (`correo`),
  KEY `idRol` (`idRol`),
  KEY `idEstado` (`idEstado`),
  CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`idRol`) REFERENCES `rol` (`idRol`) ON UPDATE CASCADE,
  CONSTRAINT `usuario_ibfk_2` FOREIGN KEY (`idEstado`) REFERENCES `estado_usuario` (`idEstado`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES ('USR-001','Administrador',NULL,'General',NULL,'admin@titan.com','$2b$12$rWPggmab6GCfJkt66y3kt.j6LhThA1rSSwazMrUYXJiOogovwWGbC','ROL-001','EST-001'),('USR-002','Laura','Andrea','Valderrama','Vaquero','laura@titan.com','$2b$12$yy36XNEq.hWq05sNe9c5COZt86Tz53SKnFfOrAciAc9Fx58ncJaJC','ROL-002','EST-001'),('USR-003','Laura','Jimena','Valderrama','Vaquero','laura2@titan.com','$2b$12$zDohMOttItCq2s9ywQOxLu4koku/pW8h6WbTlf6x/9K.Ok5qUf1B2','ROL-002','EST-001');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-08-21 12:00:40

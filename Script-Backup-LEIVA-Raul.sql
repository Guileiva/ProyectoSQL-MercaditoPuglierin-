-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: mercaditopuglierin
-- ------------------------------------------------------
-- Server version	8.0.42

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categoria` (
  `id_categoria` int NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(20) NOT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Carnes Vacunas'),(2,'Productos Avicolas'),(3,'Dulces Regionales'),(4,'Productos Regionales'),(5,'Bebidas');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) NOT NULL,
  `Apellido` varchar(50) NOT NULL,
  `Tipo_Documento` int NOT NULL,
  `Numero_Documento` varchar(15) NOT NULL,
  `Direccion` varchar(50) NOT NULL,
  `Provincia` int NOT NULL,
  `Telefono` varchar(20) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `Fecha_Registro` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_cliente`),
  UNIQUE KEY `Numero_Documento` (`Numero_Documento`),
  KEY `Tipo_Documento` (`Tipo_Documento`),
  KEY `Provincia` (`Provincia`),
  CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`Tipo_Documento`) REFERENCES `tipo_documento` (`id_tipo_documento`),
  CONSTRAINT `cliente_ibfk_2` FOREIGN KEY (`Provincia`) REFERENCES `provincia` (`id_provincia`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Francisco','Alvarez',1,'33526952','9 de julio 1532',6,'3516359426','fran_alvarez@gmail.com','2025-06-06 10:30:11'),(2,'Jimena','Loperato',1,'25364785','Obispo Oro 345',6,'3513452159','jloperato@gmail.com','2025-06-06 10:30:11'),(3,'Sofia','Gomez',5,'AAH800715','Caseros 100',6,'3515895423','sofi87@yahoo.com','2025-06-06 10:30:11'),(4,'Amilcar','Vicario',1,'40568124','Av. Virgen del Valle 789',3,'3834368741','a_milcar@gmail.com','2025-06-06 10:30:11'),(5,'Adrian','Roccio',5,'ABR700587','Duarte Quiros 2145',6,'3513251547','aroccio@hotmail.com','2025-06-06 10:30:11'),(6,'Miriam','Garcia',1,'23564833','Av. Santa Fe 167',6,'3512456879','ga_miri@gmail.com','2025-06-06 10:30:11'),(7,'Francisco','Vera',1,'40568452','Manuel Esteban Pizarro 1899',6,'3515856532','veravera87@ncr.com.ar','2025-06-06 10:30:11'),(8,'Cecilia','Amarillo',1,'30411537','Av. Libertad 43',2,'1152456874','chechuyellow@gmail.com','2025-06-06 10:30:11'),(9,'Gonzalo','Vaquero',1,'45456874','Ciudad de la Paz 456',1,'1123654125','gonvaquero@frc.utn.edu.ar','2025-06-06 10:30:11'),(10,'Joaquin','Naranjo',5,'AAG801785','Independencia 874',6,'3516348137','jnaranjo@yahoo.com','2025-06-06 10:30:11');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra`
--

DROP TABLE IF EXISTS `compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra` (
  `Nro_orden_compra` int NOT NULL AUTO_INCREMENT,
  `Fecha_compra` datetime DEFAULT CURRENT_TIMESTAMP,
  `Total_compra` decimal(8,2) NOT NULL,
  `Proveedor` int NOT NULL,
  `Empleado` int NOT NULL,
  PRIMARY KEY (`Nro_orden_compra`),
  KEY `Proveedor` (`Proveedor`),
  KEY `Empleado` (`Empleado`),
  CONSTRAINT `compra_ibfk_1` FOREIGN KEY (`Proveedor`) REFERENCES `proveedor` (`id_proveedor`),
  CONSTRAINT `compra_ibfk_2` FOREIGN KEY (`Empleado`) REFERENCES `empleado` (`id_empleado`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra`
--

LOCK TABLES `compra` WRITE;
/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
INSERT INTO `compra` VALUES (1,'2025-06-06 10:30:11',105000.00,1,1),(2,'2025-06-06 10:30:11',166775.00,4,1),(3,'2025-06-06 10:30:11',42000.00,5,2),(4,'2025-06-06 10:30:11',350000.00,6,2),(5,'2025-06-06 10:30:11',46144.00,2,2);
/*!40000 ALTER TABLE `compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_compra`
--

DROP TABLE IF EXISTS `detalle_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_compra` (
  `id_detalle_compra` int NOT NULL AUTO_INCREMENT,
  `Producto` int NOT NULL,
  `Cantidad` int NOT NULL,
  `Precio_Unitario` decimal(8,2) NOT NULL,
  `Nro_Compra` int NOT NULL,
  PRIMARY KEY (`id_detalle_compra`),
  KEY `Nro_Compra` (`Nro_Compra`),
  KEY `Producto` (`Producto`),
  CONSTRAINT `detalle_compra_ibfk_1` FOREIGN KEY (`Nro_Compra`) REFERENCES `compra` (`Nro_orden_compra`),
  CONSTRAINT `detalle_compra_ibfk_2` FOREIGN KEY (`Producto`) REFERENCES `producto` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_compra`
--

LOCK TABLES `detalle_compra` WRITE;
/*!40000 ALTER TABLE `detalle_compra` DISABLE KEYS */;
INSERT INTO `detalle_compra` VALUES (1,18,5,8050.00,1),(2,20,5,7560.00,1),(3,4,5,5390.00,1),(4,32,15,3255.00,2),(5,33,10,8400.00,2),(6,34,10,2520.00,2),(7,35,5,1750.00,2),(8,42,5,4900.00,3),(9,43,5,3500.00,3),(10,45,5,17500.00,4),(11,47,5,17500.00,4),(12,50,8,2884.00,5),(13,53,8,2884.00,5);
/*!40000 ALTER TABLE `detalle_compra` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_ActualizarProducto_AfterCompra` AFTER INSERT ON `detalle_compra` FOR EACH ROW BEGIN
	
    DECLARE NuevoPrecio DECIMAL(8,2) default 0;
    DECLARE PrecioProdActual DECIMAL(8,2);
        
    SET NuevoPrecio = NEW.Precio_Unitario * 1.30;
    SET PrecioProdActual = (SELECT Precio_Unitario FROM producto WHERE id_producto = NEW.Producto);
    
    IF NuevoPrecio > PrecioProdActual THEN
		UPDATE producto
		SET Precio_Unitario = NuevoPrecio,
			Cantidad_Stock = Cantidad_Stock + NEW.Cantidad
        WHERE id_producto = NEW.Producto;
	ELSE 
		UPDATE producto
		SET Cantidad_Stock = Cantidad_Stock + NEW.Cantidad
        WHERE id_producto = NEW.Producto;
        
	END IF;
    
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `detalle_pedido`
--

DROP TABLE IF EXISTS `detalle_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalle_pedido` (
  `id_detalle_pedido` int NOT NULL AUTO_INCREMENT,
  `Producto` int NOT NULL,
  `Cantidad` int NOT NULL,
  `Precio_Unitario` decimal(8,2) NOT NULL,
  `Pedido` int NOT NULL,
  PRIMARY KEY (`id_detalle_pedido`),
  KEY `Pedido` (`Pedido`),
  KEY `Producto` (`Producto`),
  CONSTRAINT `detalle_pedido_ibfk_1` FOREIGN KEY (`Pedido`) REFERENCES `pedido` (`id_pedido`),
  CONSTRAINT `detalle_pedido_ibfk_2` FOREIGN KEY (`Producto`) REFERENCES `producto` (`id_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_pedido`
--

LOCK TABLES `detalle_pedido` WRITE;
/*!40000 ALTER TABLE `detalle_pedido` DISABLE KEYS */;
INSERT INTO `detalle_pedido` VALUES (1,1,2,15000.00,1),(2,38,1,2100.00,1),(3,50,1,4120.00,1),(4,45,1,25000.00,2),(5,30,2,11650.00,3),(6,31,2,9690.00,3),(7,9,3,14000.00,4),(8,18,2,11500.00,4),(9,50,2,4120.00,4),(10,33,2,12000.00,5),(11,39,2,6700.00,5),(12,47,1,25000.00,6),(13,43,1,5000.00,6),(14,15,2,20000.00,7),(15,28,1,28000.00,7),(16,27,1,9200.00,7),(17,24,1,10500.00,7),(18,46,6,2500.00,8),(19,30,2,11650.00,9),(20,57,1,2760.00,9),(21,2,1,11000.00,10),(22,40,1,4000.00,10),(23,48,1,2760.00,10),(24,42,1,7000.00,11),(25,36,1,7650.00,12),(26,65,1,3745.00,12),(27,22,1,13000.00,13);
/*!40000 ALTER TABLE `detalle_pedido` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_ActualizarProducto_AfterPedido` AFTER INSERT ON `detalle_pedido` FOR EACH ROW BEGIN
	
    UPDATE producto
	SET Cantidad_Stock = Cantidad_Stock - NEW.Cantidad
	WHERE id_producto = NEW.Producto;
	     
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `empleado`
--

DROP TABLE IF EXISTS `empleado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleado` (
  `id_empleado` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) NOT NULL,
  `Apellido` varchar(50) NOT NULL,
  `Tipo_Documento` int NOT NULL,
  `Numero_Documento` varchar(15) NOT NULL,
  `Direccion` varchar(50) NOT NULL,
  `Provincia` int NOT NULL,
  `Telefono` varchar(20) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Fecha_nacimiento` date NOT NULL,
  `Fecha_ingreso` date NOT NULL,
  `Fecha_Registro` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_empleado`),
  UNIQUE KEY `Numero_Documento` (`Numero_Documento`),
  KEY `Tipo_Documento` (`Tipo_Documento`),
  KEY `Provincia` (`Provincia`),
  CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`Tipo_Documento`) REFERENCES `tipo_documento` (`id_tipo_documento`),
  CONSTRAINT `empleado_ibfk_2` FOREIGN KEY (`Provincia`) REFERENCES `provincia` (`id_provincia`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleado`
--

LOCK TABLES `empleado` WRITE;
/*!40000 ALTER TABLE `empleado` DISABLE KEYS */;
INSERT INTO `empleado` VALUES (1,'Martin','Puglierin',1,'25996321','Sarmiento 43',6,'3513475869','martinpuglierin@gmail.com','1977-05-19','2010-02-14','2025-06-06 10:30:11'),(2,'Anabella','Puglierin',1,'27414522','Sol de Mayo 764',6,'3518147454','an_puglierin@gmail.com','1979-03-02','2010-02-14','2025-06-06 10:30:11'),(3,'Mabel','Martinez',1,'33584745','Av. Colon 2334',6,'3514784165','mamartinez@gmail.com','1989-11-05','2010-06-01','2025-06-06 10:30:11'),(4,'Jose','Cortese',1,'44029417','Laprida 78',6,'3516129856','cortese_jose@gmail.com','2004-09-16','2023-03-01','2025-06-06 10:30:11');
/*!40000 ALTER TABLE `empleado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado_pedido`
--

DROP TABLE IF EXISTS `estado_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estado_pedido` (
  `id_estado_pedido` int NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(20) NOT NULL,
  PRIMARY KEY (`id_estado_pedido`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado_pedido`
--

LOCK TABLES `estado_pedido` WRITE;
/*!40000 ALTER TABLE `estado_pedido` DISABLE KEYS */;
INSERT INTO `estado_pedido` VALUES (1,'Pendiente'),(2,'Entregado');
/*!40000 ALTER TABLE `estado_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metodo_pago`
--

DROP TABLE IF EXISTS `metodo_pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `metodo_pago` (
  `id_metodo_pago` int NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(25) NOT NULL,
  PRIMARY KEY (`id_metodo_pago`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metodo_pago`
--

LOCK TABLES `metodo_pago` WRITE;
/*!40000 ALTER TABLE `metodo_pago` DISABLE KEYS */;
INSERT INTO `metodo_pago` VALUES (1,'Efectivo'),(2,'Tarjeta de Débito'),(3,'Tarjeta de Crédito'),(4,'Billetera Electrónica'),(5,'Transferencia');
/*!40000 ALTER TABLE `metodo_pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pago`
--

DROP TABLE IF EXISTS `pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pago` (
  `id_pago` int NOT NULL AUTO_INCREMENT,
  `Monto` decimal(8,2) NOT NULL,
  `Fecha_pago` datetime DEFAULT CURRENT_TIMESTAMP,
  `Metodo_pago` int NOT NULL,
  `Pedido` int NOT NULL,
  PRIMARY KEY (`id_pago`),
  KEY `Pedido` (`Pedido`),
  KEY `Metodo_pago` (`Metodo_pago`),
  CONSTRAINT `pago_ibfk_1` FOREIGN KEY (`Pedido`) REFERENCES `pedido` (`id_pedido`),
  CONSTRAINT `pago_ibfk_2` FOREIGN KEY (`Metodo_pago`) REFERENCES `metodo_pago` (`id_metodo_pago`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pago`
--

LOCK TABLES `pago` WRITE;
/*!40000 ALTER TABLE `pago` DISABLE KEYS */;
INSERT INTO `pago` VALUES (1,36220.00,'2025-06-06 10:30:11',2,1),(2,25000.00,'2025-06-06 10:30:11',4,2),(3,42680.00,'2025-06-06 10:30:11',4,3),(4,73240.00,'2025-06-06 10:30:11',3,4),(5,30700.00,'2025-06-06 10:30:11',4,5),(6,30000.00,'2025-06-06 10:30:11',2,6),(7,77700.00,'2025-06-06 10:30:11',5,7),(8,15000.00,'2025-06-06 10:30:11',1,8),(9,14410.00,'2025-06-06 10:30:11',1,9),(10,17760.00,'2025-06-06 10:30:11',2,10),(11,7000.00,'2025-06-06 10:30:11',1,11),(12,11395.00,'2025-06-06 10:30:11',4,12),(13,13000.00,'2025-06-06 10:30:11',1,13);
/*!40000 ALTER TABLE `pago` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_ActualizarEstadoPedido_AfterPago` AFTER INSERT ON `pago` FOR EACH ROW BEGIN
	        
    UPDATE pedido
	SET Estado = 2
	WHERE id_pedido = NEW.Pedido;
	     
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `id_pedido` int NOT NULL AUTO_INCREMENT,
  `Fecha_pedido` datetime DEFAULT CURRENT_TIMESTAMP,
  `Total_pedido` decimal(8,2) NOT NULL,
  `Cliente` int NOT NULL,
  `Empleado` int NOT NULL,
  `Estado` int NOT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `Cliente` (`Cliente`),
  KEY `Empleado` (`Empleado`),
  KEY `Estado` (`Estado`),
  CONSTRAINT `pedido_ibfk_1` FOREIGN KEY (`Cliente`) REFERENCES `cliente` (`id_cliente`),
  CONSTRAINT `pedido_ibfk_2` FOREIGN KEY (`Empleado`) REFERENCES `empleado` (`id_empleado`),
  CONSTRAINT `pedido_ibfk_3` FOREIGN KEY (`Estado`) REFERENCES `estado_pedido` (`id_estado_pedido`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (1,'2025-06-06 10:30:11',36220.00,3,2,2),(2,'2025-06-06 10:30:11',25000.00,5,1,2),(3,'2025-06-06 10:30:11',42680.00,3,3,2),(4,'2025-06-06 10:30:11',73240.00,6,2,2),(5,'2025-06-06 10:30:11',30700.00,2,4,2),(6,'2025-06-06 10:30:11',30000.00,1,1,2),(7,'2025-06-06 10:30:11',77700.00,7,3,2),(8,'2025-06-06 10:30:11',15000.00,2,2,2),(9,'2025-06-06 10:30:11',14410.00,3,4,2),(10,'2025-06-06 10:30:11',17760.00,4,1,2),(11,'2025-06-06 10:30:11',7000.00,8,3,2),(12,'2025-06-06 10:30:11',11395.00,9,2,2),(13,'2025-06-06 10:30:11',13000.00,10,4,1);
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `id_producto` int NOT NULL AUTO_INCREMENT,
  `Nombre_producto` varchar(50) NOT NULL,
  `Precio_unitario` decimal(8,2) NOT NULL,
  `Cantidad_Stock` int NOT NULL DEFAULT '0',
  `Categoria` int NOT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `Categoria` (`Categoria`),
  CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`Categoria`) REFERENCES `categoria` (`id_categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'Peceto',15000.00,5,1),(2,'Cuadrada',11000.00,4,1),(3,'Tortuguita',9500.00,7,1),(4,'Osobuco',7700.00,4,1),(5,'Tapa de Nalga',10000.00,5,1),(6,'Nalga',13800.00,10,1),(7,'Bola de Lomo',11000.00,5,1),(8,'Cuadril',13000.00,7,1),(9,'Colita de Cuadril',14000.00,6,1),(10,'Lomo',18000.00,10,1),(11,'Bife Angosto',12000.00,10,1),(12,'Vacio',15000.00,7,1),(13,'Bife Ancho',12000.00,10,1),(14,'Asado',13000.00,9,1),(15,'Entraña',20000.00,10,1),(16,'Falda',7400.00,10,1),(17,'Matambre',9500.00,6,1),(18,'Tapa de Asado',11500.00,3,1),(19,'Roast Beaf',11000.00,5,1),(20,'Paleta',10800.00,4,1),(21,'Palomita',9500.00,10,1),(22,'Bife Americano',13000.00,7,1),(23,'Carnaza Común',7400.00,8,1),(24,'Chorizo de Cerdo',10500.00,15,1),(25,'Chorizo Bombon',15200.00,12,1),(26,'Morcilla',6400.00,10,1),(27,'Chinchulin',9200.00,6,1),(28,'Molleja',28000.00,6,1),(29,'Riñon',8650.00,5,1),(30,'Milanesa de Carne',11650.00,18,1),(31,'Milanesa de Pollo',9690.00,13,2),(32,'Pollo',4650.00,30,2),(33,'Pechuga',12000.00,20,2),(34,'Pata Muslo',3600.00,20,2),(35,'Alita',2500.00,10,2),(36,'Maple de Huevos Color',7650.00,15,2),(37,'Huevos Color - Docena',4100.00,20,2),(38,'Huevos Color - Media Docena',2100.00,20,2),(39,'Maple de Huevos Blancos',6700.00,14,2),(40,'Huevos Blancos - Docena',4000.00,18,2),(41,'Huevos Blancos - Media Docena',2000.00,18,2),(42,'Dulce de Membrillo 2Kg',7000.00,7,3),(43,'Dulce de Batata 2Kg',5000.00,8,3),(44,'Tamales x Unidad',2500.00,100,4),(45,'Tamales x Docena',25000.00,30,4),(46,'Humitas x Unidad',2500.00,100,4),(47,'Humitas x Docena',25000.00,25,4),(48,'Coca Cola Original 1,5L',2760.00,10,5),(49,'Coca Cola Original 500ml',1240.00,10,5),(50,'Coca Cola Original 2,25L',4120.00,10,5),(51,'Coca Cola Zero 1,5L',2760.00,12,5),(52,'Coca Cola Zero 500ml',1240.00,12,5),(53,'Coca Cola Zero 2,25L',4120.00,12,5),(54,'Fanta Naranja 1,5L',2760.00,10,5),(55,'Fanta Naranja 500ml',1240.00,10,5),(56,'Fanta Naranja 2,25L',3745.00,10,5),(57,'Fanta Naranja Zero 1,5L',2760.00,10,5),(58,'Fanta Naranja Zero 500ml',1240.00,10,5),(59,'Fanta Naranja Zero 2,25L',3745.00,10,5),(60,'Sprite 1,5L',2760.00,7,5),(61,'Sprite 500ml',1240.00,8,5),(62,'Sprite 2,25L',3745.00,5,5),(63,'Sprite Zero 1,5L',2460.00,4,5),(64,'Sprite Zero 500ml',1240.00,6,5),(65,'Sprite Zero 2,25L',3745.00,3,5);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `id_proveedor` int NOT NULL AUTO_INCREMENT,
  `Razon_Social` varchar(50) NOT NULL,
  `Tipo_Documento` int NOT NULL,
  `Numero_Documento` varchar(15) NOT NULL,
  `Direccion` varchar(50) NOT NULL,
  `Provincia` int NOT NULL,
  `Telefono` varchar(20) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Fecha_Registro` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id_proveedor`),
  UNIQUE KEY `Numero_Documento` (`Numero_Documento`),
  KEY `Tipo_Documento` (`Tipo_Documento`),
  KEY `Provincia` (`Provincia`),
  CONSTRAINT `proveedor_ibfk_1` FOREIGN KEY (`Tipo_Documento`) REFERENCES `tipo_documento` (`id_tipo_documento`),
  CONSTRAINT `proveedor_ibfk_2` FOREIGN KEY (`Provincia`) REFERENCES `provincia` (`id_provincia`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES (1,'Frigorifico San Antonio SRL',2,'30999254156','Capilla de los Remedios KM 8.5',6,'3512031478','frigorificosanantonio@gmail.com','2025-06-06 10:30:11'),(2,'760 Bebidas SAS',2,'30417845255','Julio A. Roca 760',6,'3514685077','760bebidas@gmail.com','2025-06-06 10:30:11'),(3,'Cordoba Drinks',2,'30744228566','Aviador Richardson 1692',6,'3514656068','drinkscordoba@gmail.com','2025-06-06 10:30:11'),(4,'Nuevo Aviccat SRL',2,'30254145843','Arturo Illia 587',3,'3834024678','nuevoaviccat@yahoo.com','2025-06-06 10:30:11'),(5,'Cuesta del Portezuelo SA',2,'30999228567','Sarmiento 789',3,'3834784541','cuestadelportezuelo@gmail.com','2025-06-06 10:30:11'),(6,'Mirta Gimenez',1,'17841471','Camino los Tres Cruces',3,'3834611475','mirti78@hotmail.com','2025-06-06 10:30:11');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provincia`
--

DROP TABLE IF EXISTS `provincia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provincia` (
  `id_provincia` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(35) NOT NULL,
  PRIMARY KEY (`id_provincia`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provincia`
--

LOCK TABLES `provincia` WRITE;
/*!40000 ALTER TABLE `provincia` DISABLE KEYS */;
INSERT INTO `provincia` VALUES (1,'Buenos Aires'),(2,'Ciudad Autónoma de Buenos Aires'),(3,'Catamarca'),(4,'Chaco'),(5,'Chubut'),(6,'Córdoba'),(7,'Corrientes'),(8,'Entre Ríos'),(9,'Formosa'),(10,'Jujuy'),(11,'La Pampa'),(12,'La Rioja'),(13,'Mendoza'),(14,'Misiones'),(15,'Neuquén'),(16,'Río Negro'),(17,'Salta'),(18,'San Juan'),(19,'San Luis'),(20,'Santa Cruz'),(21,'Santa Fe'),(22,'Santiago del Estero'),(23,'Tierra del Fuego'),(24,'Tucuman');
/*!40000 ALTER TABLE `provincia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_documento`
--

DROP TABLE IF EXISTS `tipo_documento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_documento` (
  `id_tipo_documento` int NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(20) NOT NULL,
  PRIMARY KEY (`id_tipo_documento`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_documento`
--

LOCK TABLES `tipo_documento` WRITE;
/*!40000 ALTER TABLE `tipo_documento` DISABLE KEYS */;
INSERT INTO `tipo_documento` VALUES (1,'D.N.I.'),(2,'C.U.I.T.'),(3,'Libreta Civica'),(4,'L.E.'),(5,'Pasaporte');
/*!40000 ALTER TABLE `tipo_documento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vistacantidadtotalventasxcliente`
--

DROP TABLE IF EXISTS `vistacantidadtotalventasxcliente`;
/*!50001 DROP VIEW IF EXISTS `vistacantidadtotalventasxcliente`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vistacantidadtotalventasxcliente` AS SELECT 
 1 AS `Nombre`,
 1 AS `Apellido`,
 1 AS `Cantidad Total`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vistacomprastotalesxproveedor`
--

DROP TABLE IF EXISTS `vistacomprastotalesxproveedor`;
/*!50001 DROP VIEW IF EXISTS `vistacomprastotalesxproveedor`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vistacomprastotalesxproveedor` AS SELECT 
 1 AS `Proveedor`,
 1 AS `Cantidad Compras`,
 1 AS `Monto Total`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vistahistorialventasxcliente`
--

DROP TABLE IF EXISTS `vistahistorialventasxcliente`;
/*!50001 DROP VIEW IF EXISTS `vistahistorialventasxcliente`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vistahistorialventasxcliente` AS SELECT 
 1 AS `Cliente`,
 1 AS `Nombre_producto`,
 1 AS `Monto Total`,
 1 AS `Fecha_pedido`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vistaproductosmasvendidos`
--

DROP TABLE IF EXISTS `vistaproductosmasvendidos`;
/*!50001 DROP VIEW IF EXISTS `vistaproductosmasvendidos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vistaproductosmasvendidos` AS SELECT 
 1 AS `Nombre_producto`,
 1 AS `Total Vendido`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vistaproveedoresconarticulos`
--

DROP TABLE IF EXISTS `vistaproveedoresconarticulos`;
/*!50001 DROP VIEW IF EXISTS `vistaproveedoresconarticulos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vistaproveedoresconarticulos` AS SELECT 
 1 AS `Razon_Social`,
 1 AS `Telefono`,
 1 AS `Email`,
 1 AS `Nombre_producto`,
 1 AS `Cantidad_Stock`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vistacantidadtotalventasxcliente`
--

/*!50001 DROP VIEW IF EXISTS `vistacantidadtotalventasxcliente`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vistacantidadtotalventasxcliente` AS select `c`.`Nombre` AS `Nombre`,`c`.`Apellido` AS `Apellido`,count(`p`.`id_pedido`) AS `Cantidad Total` from (`cliente` `c` join `pedido` `p` on((`p`.`Cliente` = `c`.`id_cliente`))) group by `c`.`Nombre`,`c`.`Apellido` order by count(`p`.`id_pedido`) desc limit 5 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vistacomprastotalesxproveedor`
--

/*!50001 DROP VIEW IF EXISTS `vistacomprastotalesxproveedor`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vistacomprastotalesxproveedor` AS select `p`.`Razon_Social` AS `Proveedor`,count(`c`.`Nro_orden_compra`) AS `Cantidad Compras`,sum(`c`.`Total_compra`) AS `Monto Total` from (`proveedor` `p` left join `compra` `c` on((`c`.`Proveedor` = `p`.`id_proveedor`))) group by `p`.`Razon_Social` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vistahistorialventasxcliente`
--

/*!50001 DROP VIEW IF EXISTS `vistahistorialventasxcliente`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vistahistorialventasxcliente` AS select concat(`c`.`Nombre`,' ',`c`.`Apellido`) AS `Cliente`,`pr`.`Nombre_producto` AS `Nombre_producto`,(`dp`.`Cantidad` * `dp`.`Precio_Unitario`) AS `Monto Total`,`p`.`Fecha_pedido` AS `Fecha_pedido` from (((`cliente` `c` join `pedido` `p` on((`p`.`Cliente` = `c`.`id_cliente`))) join `detalle_pedido` `dp` on((`p`.`id_pedido` = `dp`.`Pedido`))) join `producto` `pr` on((`dp`.`Producto` = `pr`.`id_producto`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vistaproductosmasvendidos`
--

/*!50001 DROP VIEW IF EXISTS `vistaproductosmasvendidos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vistaproductosmasvendidos` AS select `pr`.`Nombre_producto` AS `Nombre_producto`,sum(`dp`.`Cantidad`) AS `Total Vendido` from (`producto` `pr` join `detalle_pedido` `dp` on((`pr`.`id_producto` = `dp`.`Producto`))) group by `pr`.`Nombre_producto` order by sum(`dp`.`Cantidad`) desc limit 0,15 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vistaproveedoresconarticulos`
--

/*!50001 DROP VIEW IF EXISTS `vistaproveedoresconarticulos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vistaproveedoresconarticulos` AS select `p`.`Razon_Social` AS `Razon_Social`,`p`.`Telefono` AS `Telefono`,`p`.`Email` AS `Email`,`pr`.`Nombre_producto` AS `Nombre_producto`,`pr`.`Cantidad_Stock` AS `Cantidad_Stock` from (((`proveedor` `p` join `compra` `c` on((`p`.`id_proveedor` = `c`.`Proveedor`))) join `detalle_compra` `dc` on((`c`.`Nro_orden_compra` = `dc`.`Nro_Compra`))) join `producto` `pr` on((`dc`.`Producto` = `pr`.`id_producto`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-06 10:31:51

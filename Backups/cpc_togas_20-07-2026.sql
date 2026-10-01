-- MySQL dump 10.13  Distrib 8.0.46, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: cpc_togas
-- ------------------------------------------------------
-- Server version	8.0.46

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `alquiler_detalle_accesorios`
--

DROP TABLE IF EXISTS `alquiler_detalle_accesorios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alquiler_detalle_accesorios` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `alquiler_detalle_id` bigint unsigned NOT NULL,
  `producto_id` bigint unsigned NOT NULL,
  `tipo_accesorio` enum('COLLARIN','BIRRETE','BORLA') COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_cobro` enum('INCLUIDO','EXTRA') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INCLUIDO',
  `cantidad` int NOT NULL DEFAULT '1',
  `precio_unitario` decimal(10,2) NOT NULL DEFAULT '0.00',
  `total_linea` decimal(10,2) NOT NULL DEFAULT '0.00',
  `observaciones` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `alquiler_detalle_accesorios_alquiler_detalle_id_foreign` (`alquiler_detalle_id`),
  KEY `alquiler_detalle_accesorios_producto_id_foreign` (`producto_id`),
  CONSTRAINT `alquiler_detalle_accesorios_alquiler_detalle_id_foreign` FOREIGN KEY (`alquiler_detalle_id`) REFERENCES `alquiler_detalles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `alquiler_detalle_accesorios_producto_id_foreign` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alquiler_detalle_accesorios`
--

LOCK TABLES `alquiler_detalle_accesorios` WRITE;
/*!40000 ALTER TABLE `alquiler_detalle_accesorios` DISABLE KEYS */;
INSERT INTO `alquiler_detalle_accesorios` VALUES (1,1,13,'COLLARIN','INCLUIDO',8,0.00,0.00,NULL,'2026-07-08 17:17:13','2026-07-08 17:17:13'),(2,1,12,'BIRRETE','INCLUIDO',8,0.00,0.00,NULL,'2026-07-08 17:17:13','2026-07-08 17:17:13'),(3,2,13,'COLLARIN','INCLUIDO',4,0.00,0.00,NULL,'2026-07-08 17:17:13','2026-07-08 17:17:13'),(4,2,12,'BIRRETE','INCLUIDO',4,0.00,0.00,NULL,'2026-07-08 17:17:13','2026-07-08 17:17:13'),(5,3,13,'COLLARIN','INCLUIDO',45,0.00,0.00,NULL,'2026-07-08 17:17:13','2026-07-08 17:17:13'),(6,3,12,'BIRRETE','INCLUIDO',45,0.00,0.00,NULL,'2026-07-08 17:17:13','2026-07-08 17:17:13'),(7,4,13,'COLLARIN','INCLUIDO',34,0.00,0.00,NULL,'2026-07-08 17:17:13','2026-07-08 17:17:13'),(8,4,12,'BIRRETE','INCLUIDO',34,0.00,0.00,NULL,'2026-07-08 17:17:13','2026-07-08 17:17:13'),(9,5,13,'COLLARIN','INCLUIDO',1,0.00,0.00,NULL,'2026-07-08 17:17:13','2026-07-08 17:17:13'),(10,5,12,'BIRRETE','INCLUIDO',1,0.00,0.00,NULL,'2026-07-08 17:17:13','2026-07-08 17:17:13'),(11,6,13,'COLLARIN','INCLUIDO',1,0.00,0.00,NULL,'2026-07-08 17:17:13','2026-07-08 17:17:13'),(12,6,12,'BIRRETE','INCLUIDO',1,0.00,0.00,NULL,'2026-07-08 17:17:13','2026-07-08 17:17:13');
/*!40000 ALTER TABLE `alquiler_detalle_accesorios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alquiler_detalles`
--

DROP TABLE IF EXISTS `alquiler_detalles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alquiler_detalles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `alquiler_id` bigint unsigned NOT NULL,
  `producto_id` bigint unsigned NOT NULL,
  `cantidad` int unsigned NOT NULL,
  `precio_unitario` decimal(10,2) NOT NULL DEFAULT '0.00',
  `subtotal` decimal(10,2) NOT NULL DEFAULT '0.00',
  `estado` enum('PENDIENTE','ENTREGADO','DEVUELTO','CANCELADO') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'PENDIENTE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `alquiler_detalles_alquiler_id_foreign` (`alquiler_id`),
  KEY `alquiler_detalles_producto_id_foreign` (`producto_id`),
  CONSTRAINT `alquiler_detalles_alquiler_id_foreign` FOREIGN KEY (`alquiler_id`) REFERENCES `alquileres` (`id`) ON DELETE CASCADE,
  CONSTRAINT `alquiler_detalles_producto_id_foreign` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON DELETE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alquiler_detalles`
--

LOCK TABLES `alquiler_detalles` WRITE;
/*!40000 ALTER TABLE `alquiler_detalles` DISABLE KEYS */;
INSERT INTO `alquiler_detalles` VALUES (1,1,5,8,50.00,400.00,'PENDIENTE','2026-07-08 17:17:13','2026-07-08 17:17:13'),(2,1,8,4,50.00,200.00,'PENDIENTE','2026-07-08 17:17:13','2026-07-08 17:17:13'),(3,1,7,45,50.00,2250.00,'PENDIENTE','2026-07-08 17:17:13','2026-07-08 17:17:13'),(4,1,6,34,50.00,1700.00,'PENDIENTE','2026-07-08 17:17:13','2026-07-08 17:17:13'),(5,1,9,1,50.00,50.00,'PENDIENTE','2026-07-08 17:17:13','2026-07-08 17:17:13'),(6,1,4,1,50.00,50.00,'PENDIENTE','2026-07-08 17:17:13','2026-07-08 17:17:13');
/*!40000 ALTER TABLE `alquiler_detalles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `alquileres`
--

DROP TABLE IF EXISTS `alquileres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alquileres` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `cliente_id` bigint unsigned NOT NULL,
  `institucion_representada` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `representante_alquiler` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `codigo_recibo` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fecha_alquiler` date NOT NULL,
  `fecha_entrega` date DEFAULT NULL,
  `hora_entrega` time DEFAULT NULL,
  `hora_entrega_inicio` time DEFAULT NULL,
  `hora_entrega_fin` time DEFAULT NULL,
  `fecha_devolucion_programada` date DEFAULT NULL,
  `hora_devolucion_programada` time DEFAULT NULL,
  `fecha_devolucion_real` date DEFAULT NULL,
  `fecha_hora_devolucion_real` datetime DEFAULT NULL,
  `dias_mora` int unsigned NOT NULL DEFAULT '0',
  `monto_mora_calculado` decimal(10,2) NOT NULL DEFAULT '0.00',
  `descuento_mora` decimal(10,2) NOT NULL DEFAULT '0.00',
  `monto_mora` decimal(10,2) NOT NULL DEFAULT '0.00',
  `observacion_mora` text COLLATE utf8mb4_unicode_ci,
  `estado` enum('RESERVADO','ENTREGADO','DEVUELTO','CANCELADO') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'RESERVADO',
  `estado_pago` enum('PENDIENTE','PARCIAL','PAGADO') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'PENDIENTE',
  `subtotal` decimal(10,2) NOT NULL DEFAULT '0.00',
  `descuento` decimal(10,2) NOT NULL DEFAULT '0.00',
  `total` decimal(10,2) NOT NULL DEFAULT '0.00',
  `saldo_pendiente` decimal(10,2) NOT NULL DEFAULT '0.00',
  `fecha_limite_pago_final` date DEFAULT NULL,
  `observaciones` text COLLATE utf8mb4_unicode_ci,
  `usuario_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `alquileres_codigo_recibo_unique` (`codigo_recibo`),
  KEY `alquileres_cliente_id_foreign` (`cliente_id`),
  KEY `alquileres_usuario_id_foreign` (`usuario_id`),
  CONSTRAINT `alquileres_cliente_id_foreign` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `alquileres_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alquileres`
--

LOCK TABLES `alquileres` WRITE;
/*!40000 ALTER TABLE `alquileres` DISABLE KEYS */;
INSERT INTO `alquileres` VALUES (1,1,'Escuela Oficial Urbana De Niñas \"Berta Judith Franco Bonilla\"','Eleazar Ramos','REC-2026-000001','2026-07-08','2026-11-05','09:00:00','08:00:00','11:00:00','2026-11-07','10:00:00',NULL,NULL,0,0.00,0.00,0.00,NULL,'RESERVADO','PARCIAL',4650.00,465.00,4185.00,2093.00,'2026-11-05',NULL,NULL,'2026-07-08 17:17:13','2026-07-08 17:18:33');
/*!40000 ALTER TABLE `alquileres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` bigint NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache`
--

LOCK TABLES `cache` WRITE;
/*!40000 ALTER TABLE `cache` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` bigint NOT NULL,
  PRIMARY KEY (`key`),
  KEY `cache_locks_expiration_index` (`expiration`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cache_locks`
--

LOCK TABLES `cache_locks` WRITE;
/*!40000 ALTER TABLE `cache_locks` DISABLE KEYS */;
/*!40000 ALTER TABLE `cache_locks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nombres` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `apellidos` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefono` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dpi` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `direccion` text COLLATE utf8mb4_unicode_ci,
  `institucion_representada` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `observaciones` text COLLATE utf8mb4_unicode_ci,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `clientes_dpi_unique` (`dpi`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Fredy Isaac','Ramírez Hernández','5189-6371','1917 42236 2101','Avenida El Cementerio 1-46 Zona 2, Barrio San Francisco','Escuela Oficial Urbana De Niñas \"Berta Judith Franco Bonilla\"','Cliente frecuente',1,'2026-07-08 16:58:40','2026-07-08 16:58:40');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`),
  KEY `failed_jobs_connection_queue_failed_at_index` (`connection`,`queue`,`failed_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job_batches`
--

LOCK TABLES `job_batches` WRITE;
/*!40000 ALTER TABLE `job_batches` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_batches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` smallint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_01_01_000000_create_users_table',1),(2,'0001_01_01_000001_create_cache_table',1),(3,'0001_01_01_000002_create_jobs_table',1),(4,'2026_06_03_155813_create_productos_table',2),(5,'2026_06_03_155814_create_producto_togas_table',2),(6,'2026_06_03_155815_create_producto_birretes_table',2),(7,'2026_06_03_155816_create_producto_collarines_table',2),(8,'2026_06_03_164326_create_movimiento_inventarios_table',3),(9,'2026_06_03_165511_create_clientes_table',4),(10,'2026_06_03_165512_create_alquilers_table',4),(11,'2026_06_03_165513_create_alquiler_detalles_table',4),(12,'2026_06_03_171257_create_pagos_table',5),(13,'2026_06_03_175327_add_estado_pago_to_alquileres_table',6),(14,'2026_06_03_182349_create_personal_access_tokens_table',7),(15,'2026_06_04_183953_cambiar_cantidad_movimientos_inventario_a_integer',8),(16,'2026_06_08_093910_agregar_datos_extra_a_alquileres_table',9),(17,'2026_06_08_102739_create_producto_borlas_table',10),(18,'2026_06_08_102828_create_alquiler_detalle_accesorios_table',10),(19,'2026_06_08_123350_actualizar_enum_tipo_producto_agregar_borla',11),(20,'2026_06_09_101422_agregar_horas_a_alquileres_table',12),(21,'2026_06_09_105831_agregar_institucion_representada_a_clientes_table',13),(23,'2026_06_10_081325_add_mora_fields_to_alquileres_table',14),(24,'2026_06_11_094317_add_descuento_to_pagos_table',15),(25,'2026_07_16_105319_cambiar_color_collarin_a_varchar',16);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movimientos_inventario`
--

DROP TABLE IF EXISTS `movimientos_inventario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movimientos_inventario` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `producto_id` bigint unsigned NOT NULL,
  `tipo_movimiento` enum('ENTRADA','SALIDA','ALQUILER','DEVOLUCION','AJUSTE') COLLATE utf8mb4_unicode_ci NOT NULL,
  `cantidad` int NOT NULL,
  `stock_anterior_disponible` int unsigned NOT NULL,
  `stock_nuevo_disponible` int unsigned NOT NULL,
  `stock_anterior_alquilado` int unsigned NOT NULL,
  `stock_nuevo_alquilado` int unsigned NOT NULL,
  `motivo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referencia` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `usuario_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `movimientos_inventario_producto_id_foreign` (`producto_id`),
  KEY `movimientos_inventario_usuario_id_foreign` (`usuario_id`),
  CONSTRAINT `movimientos_inventario_producto_id_foreign` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON DELETE RESTRICT,
  CONSTRAINT `movimientos_inventario_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movimientos_inventario`
--

LOCK TABLES `movimientos_inventario` WRITE;
/*!40000 ALTER TABLE `movimientos_inventario` DISABLE KEYS */;
INSERT INTO `movimientos_inventario` VALUES (1,7,'AJUSTE',-20,40,20,0,0,'Conteo físico',NULL,NULL,'2026-07-08 17:12:00','2026-07-08 17:12:00'),(2,7,'AJUSTE',30,20,50,0,0,'Necesidad de stock',NULL,NULL,'2026-07-08 17:12:30','2026-07-08 17:12:30'),(3,12,'AJUSTE',177,300,477,5,5,'Ajuste de inventario real','Corrección de cantidad existente',NULL,'2026-07-13 15:26:14','2026-07-13 15:26:14'),(4,4,'AJUSTE',10,117,127,0,0,'Ajuste de inventario real','Inventario real',NULL,'2026-07-13 15:27:26','2026-07-13 15:27:26'),(5,5,'AJUSTE',-18,78,60,3,3,'Ajuste de inventario real','Inventario real',NULL,'2026-07-13 15:28:24','2026-07-13 15:28:24'),(6,6,'AJUSTE',-26,42,16,0,0,'Ajuste de inventario real','Inventario real',NULL,'2026-07-13 15:29:26','2026-07-13 15:29:26'),(7,3,'AJUSTE',4,81,85,0,0,'Ajuste de inventario real','Inventario real',NULL,'2026-07-13 15:30:00','2026-07-13 15:30:00'),(8,11,'AJUSTE',15,26,41,0,0,'Ajuste de inventario real','Inventario real',NULL,'2026-07-13 15:50:27','2026-07-13 15:50:27'),(9,7,'AJUSTE',-30,50,20,0,0,'Ajuste de inventario real','Inventario real - se va a mandar a hacer más togas',NULL,'2026-07-13 15:52:38','2026-07-13 15:52:38'),(10,10,'AJUSTE',-4,23,19,0,0,'Ajuste de inventario real','Inventario real',NULL,'2026-07-13 15:53:29','2026-07-13 15:53:29'),(11,15,'ENTRADA',5,0,5,0,0,'Registro inicial de producto','Producto nuevo',NULL,'2026-07-13 16:00:36','2026-07-13 16:00:36'),(12,9,'AJUSTE',-3,26,23,0,0,'Ajuste de inventario real','Inventario real',NULL,'2026-07-13 16:02:23','2026-07-13 16:02:23'),(13,13,'AJUSTE',161,300,461,0,0,'Ajuste de inventario real','Inventario real',NULL,'2026-07-13 16:03:28','2026-07-13 16:03:28'),(14,16,'ENTRADA',142,0,142,0,0,'Registro inicial de producto','Producto nuevo',NULL,'2026-07-13 16:06:03','2026-07-13 16:06:03'),(15,17,'ENTRADA',85,0,85,0,0,'Registro inicial de producto','Producto nuevo',NULL,'2026-07-13 16:07:46','2026-07-13 16:07:46'),(16,18,'ENTRADA',7,0,7,0,0,'Registro inicial de producto','Producto nuevo',NULL,'2026-07-13 16:17:46','2026-07-13 16:17:46'),(17,19,'ENTRADA',1,0,1,0,0,'Registro inicial de producto','Producto nuevo',NULL,'2026-07-13 16:20:42','2026-07-13 16:20:42'),(18,20,'ENTRADA',17,0,17,0,0,'Registro inicial de producto','Producto nuevo',NULL,'2026-07-13 16:23:16','2026-07-13 16:23:16'),(19,21,'ENTRADA',10,0,10,0,0,'Registro inicial de producto','Producto nuevo',NULL,'2026-07-13 19:13:16','2026-07-13 19:13:16'),(20,14,'AJUSTE',-7,10,3,0,0,'Ajuste de inventario real','Inventario real',NULL,'2026-07-13 19:16:03','2026-07-13 19:16:03'),(21,22,'ENTRADA',10,0,10,0,0,'Registro inicial de producto','Producto nuevo',NULL,'2026-07-13 21:31:21','2026-07-13 21:31:21'),(22,23,'ENTRADA',1,0,1,0,0,'Registro inicial de producto','Producto nuevo',NULL,'2026-07-13 21:42:26','2026-07-13 21:42:26'),(23,24,'ENTRADA',2,0,2,0,0,'Registro inicial de producto','Producto nuevo',NULL,'2026-07-13 21:46:02','2026-07-13 21:46:02'),(24,25,'ENTRADA',2,0,2,0,0,'Registro inicial de producto','Producto nuevo',NULL,'2026-07-13 21:48:12','2026-07-13 21:48:12'),(25,29,'ENTRADA',29,0,29,0,0,'Registro inicial de producto','Producto nuevo',NULL,'2026-07-16 17:14:02','2026-07-16 17:14:02');
/*!40000 ALTER TABLE `movimientos_inventario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pagos`
--

DROP TABLE IF EXISTS `pagos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pagos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `alquiler_id` bigint unsigned NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `descuento_aplicado` decimal(10,2) NOT NULL DEFAULT '0.00',
  `metodo_pago` enum('EFECTIVO','TRANSFERENCIA','TARJETA','OTRO') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'EFECTIVO',
  `referencia` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `observaciones` text COLLATE utf8mb4_unicode_ci,
  `observacion_descuento` text COLLATE utf8mb4_unicode_ci,
  `usuario_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pagos_alquiler_id_foreign` (`alquiler_id`),
  KEY `pagos_usuario_id_foreign` (`usuario_id`),
  CONSTRAINT `pagos_alquiler_id_foreign` FOREIGN KEY (`alquiler_id`) REFERENCES `alquileres` (`id`) ON DELETE CASCADE,
  CONSTRAINT `pagos_usuario_id_foreign` FOREIGN KEY (`usuario_id`) REFERENCES `users` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pagos`
--

LOCK TABLES `pagos` WRITE;
/*!40000 ALTER TABLE `pagos` DISABLE KEYS */;
INSERT INTO `pagos` VALUES (1,1,2092.00,0.00,'EFECTIVO','Adelanto',NULL,NULL,NULL,'2026-07-08 17:18:33','2026-07-08 17:18:33');
/*!40000 ALTER TABLE `pagos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  KEY `personal_access_tokens_expires_at_index` (`expires_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto_birretes`
--

DROP TABLE IF EXISTS `producto_birretes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto_birretes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `producto_id` bigint unsigned NOT NULL,
  `tipo_birrete` enum('ESTANDAR','NORMAL','UNIVERSITARIO') COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `carrera` enum('ADMINISTRACION','AGRONOMIA','DERECHO','PEDAGOGIA') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tiene_borlas_extra` tinyint(1) NOT NULL DEFAULT '0',
  `descripcion_borlas_extra` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `producto_birretes_producto_id_foreign` (`producto_id`),
  CONSTRAINT `producto_birretes_producto_id_foreign` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto_birretes`
--

LOCK TABLES `producto_birretes` WRITE;
/*!40000 ALTER TABLE `producto_birretes` DISABLE KEYS */;
INSERT INTO `producto_birretes` VALUES (1,12,'ESTANDAR','Azul',NULL,0,NULL,'2026-06-08 18:27:33','2026-07-13 15:25:04'),(2,21,'UNIVERSITARIO','Negro',NULL,0,NULL,'2026-07-13 19:13:16','2026-07-13 19:13:16');
/*!40000 ALTER TABLE `producto_birretes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto_borlas`
--

DROP TABLE IF EXISTS `producto_borlas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto_borlas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `producto_id` bigint unsigned NOT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `carrera` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `observaciones` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `producto_borlas_producto_id_foreign` (`producto_id`),
  CONSTRAINT `producto_borlas_producto_id_foreign` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto_borlas`
--

LOCK TABLES `producto_borlas` WRITE;
/*!40000 ALTER TABLE `producto_borlas` DISABLE KEYS */;
INSERT INTO `producto_borlas` VALUES (1,14,'Roja','Derecho','Prueba','2026-06-08 18:35:00','2026-06-08 21:13:44'),(2,22,'Celeste','Pedagogía',NULL,'2026-07-13 21:31:21','2026-07-13 21:31:21'),(3,23,'Naranja','Ciencias Económicas','Borla con velcro','2026-07-13 21:42:26','2026-07-13 21:42:26'),(4,24,'Amarillo','Medicina','Borla con velcro','2026-07-13 21:46:02','2026-07-13 21:46:02'),(5,25,'Verde','Agronomía','Borla con velcro','2026-07-13 21:48:12','2026-07-13 21:48:12');
/*!40000 ALTER TABLE `producto_borlas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto_collarines`
--

DROP TABLE IF EXISTS `producto_collarines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto_collarines` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `producto_id` bigint unsigned NOT NULL,
  `tipo_collarin` enum('NORMAL','UNIVERSITARIO') COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tamano` enum('PEQUENO','GRANDE') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `producto_collarines_producto_id_foreign` (`producto_id`),
  CONSTRAINT `producto_collarines_producto_id_foreign` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto_collarines`
--

LOCK TABLES `producto_collarines` WRITE;
/*!40000 ALTER TABLE `producto_collarines` DISABLE KEYS */;
INSERT INTO `producto_collarines` VALUES (1,13,'NORMAL','DORADO','GRANDE','2026-06-08 18:30:16','2026-07-13 16:04:36'),(2,16,'NORMAL','VERDE',NULL,'2026-07-13 16:06:03','2026-07-13 16:06:03'),(3,17,'NORMAL','ROJO',NULL,'2026-07-13 16:07:46','2026-07-13 16:07:46'),(4,29,'UNIVERSITARIO',NULL,'GRANDE','2026-07-16 17:14:02','2026-07-16 17:14:02');
/*!40000 ALTER TABLE `producto_collarines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto_togas`
--

DROP TABLE IF EXISTS `producto_togas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto_togas` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `producto_id` bigint unsigned NOT NULL,
  `talla` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Negro',
  `observaciones` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `producto_togas_producto_id_foreign` (`producto_id`),
  CONSTRAINT `producto_togas_producto_id_foreign` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto_togas`
--

LOCK TABLES `producto_togas` WRITE;
/*!40000 ALTER TABLE `producto_togas` DISABLE KEYS */;
INSERT INTO `producto_togas` VALUES (1,2,'L','Azul Marino','Incluye una tela fina que evita el calor excesivo, y un cierre zipper para mayor versatilidad','2026-06-05 17:37:24','2026-06-05 17:37:24'),(2,3,'M','Azul Marino',NULL,'2026-06-05 17:41:21','2026-06-05 17:41:21'),(3,4,'S','Azul Marino','Modelo estándar con tela fina que evita el calor excesivo, y un cierre zipper para más versatilidad','2026-06-08 14:25:26','2026-06-08 14:25:26'),(4,5,'16','Azul Marino','Modelo estándar con tela fina que evita el calor excesivo, y un cierre zipper para más versatilidad','2026-06-08 14:28:06','2026-06-08 14:28:06'),(5,6,'14','Azul Marino','Modelo estándar con tela fina que evita el calor excesivo, y un cierre zipper para más versatilidad','2026-06-08 14:29:26','2026-06-08 14:29:26'),(6,7,'12','Azul Marino','Modelo estándar con tela fina que evita el calor excesivo, y un cierre zipper para más versatilidad','2026-06-08 14:30:44','2026-06-08 14:30:44'),(7,8,'10','Azul Marino','Modelo estándar con tela fina que evita el calor excesivo, y un cierre zipper para más versatilidad','2026-06-08 14:32:09','2026-06-08 14:32:09'),(8,9,'8','Azul Marino','Modelo estándar con tela fina que evita el calor excesivo, y un cierre zipper para más versatilidad','2026-06-08 14:34:42','2026-06-08 14:34:42'),(9,10,'6','Azul Marino','Modelo estándar con tela fina que evita el calor excesivo, y un cierre zipper para más versatilidad','2026-06-08 14:36:05','2026-06-08 14:36:05'),(10,11,'4','Azul Marino','Modelo estándar con tela fina que evita el calor excesivo, y un cierre zipper para más versatilidad','2026-06-08 14:37:23','2026-06-08 14:37:23'),(11,15,'3','Azul Marino','Modelo estándar, con zipper para una mayor comodidad','2026-07-13 16:00:36','2026-07-13 16:00:36'),(12,18,'S','Celeste',NULL,'2026-07-13 16:17:46','2026-07-13 16:17:46'),(13,19,'16','Celeste',NULL,'2026-07-13 16:20:42','2026-07-13 16:20:42'),(14,20,'M','Celeste',NULL,'2026-07-13 16:23:16','2026-07-13 16:23:16');
/*!40000 ALTER TABLE `producto_togas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `codigo` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nombre` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo_producto` enum('TOGA','BIRRETE','COLLARIN','BORLA') COLLATE utf8mb4_unicode_ci NOT NULL,
  `descripcion` text COLLATE utf8mb4_unicode_ci,
  `precio_alquiler` decimal(10,2) NOT NULL DEFAULT '0.00',
  `stock_total` int unsigned NOT NULL DEFAULT '0',
  `stock_disponible` int unsigned NOT NULL DEFAULT '0',
  `stock_alquilado` int unsigned NOT NULL DEFAULT '0',
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `productos_codigo_unique` (`codigo`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (2,'TOGA-L','Toga Estándar Talla L','TOGA','Toga estándar color azul marino',50.00,52,52,0,1,'2026-06-05 17:37:24','2026-06-19 23:10:36'),(3,'TOGA-M','Toga estándar talla M','TOGA','Toga estándar talla M de color Azul marino',50.00,85,85,0,1,'2026-06-05 17:41:21','2026-07-13 15:30:00'),(4,'TOGA-S','Toga estándar talla S','TOGA','Toga de color azul marino, talla S',50.00,127,127,0,1,'2026-06-08 14:25:26','2026-07-13 15:27:26'),(5,'TOGA-16 (XS)','Toga estándar de talla 16','TOGA','Toga estándar de color azul marino',50.00,63,63,0,1,'2026-06-08 14:28:06','2026-07-13 15:28:24'),(6,'TOGA-14','Toga Estándar Talla 14','TOGA','Toga estándar de color azul marino',50.00,16,16,0,1,'2026-06-08 14:29:26','2026-07-13 15:29:26'),(7,'TOGA-12','Toga Estándar Talla 12','TOGA','Toga estándar de color azul marino',50.00,20,20,0,1,'2026-06-08 14:30:44','2026-07-13 15:52:38'),(8,'TOGA-10','Toga Estándar Talla 10','TOGA','Toga estándar de color azul marino',50.00,26,26,0,1,'2026-06-08 14:32:09','2026-06-15 18:34:19'),(9,'TOGA-8','Toga Estándar Talla 8','TOGA','Toga estándar de color azul marino',50.00,23,23,0,1,'2026-06-08 14:34:42','2026-07-13 16:02:23'),(10,'TOGA-6','Toga Estándar Talla 6','TOGA','Toga estándar de color azul marino',50.00,19,19,0,1,'2026-06-08 14:36:05','2026-07-13 15:53:29'),(11,'TOGA-4','Toga Estándar Talla 4','TOGA','Toga estándar de color azul marino',50.00,41,41,0,1,'2026-06-08 14:37:23','2026-07-13 15:50:27'),(12,'BIRRETE','Birrete estándar','BIRRETE','Birrete estándar de color azul',0.00,482,482,0,1,'2026-06-08 18:27:33','2026-07-13 15:26:14'),(13,'COLLARÍN-DORADO','Collarín dorado','COLLARIN','Collarín estándar dorado',0.00,461,461,0,1,'2026-06-08 18:30:16','2026-07-13 16:04:36'),(14,'BORLA-DER','Borla roja','BORLA','Borla para la carrera de derecho',0.00,3,3,0,1,'2026-06-08 18:35:00','2026-07-13 19:16:03'),(15,'TOGA-3','Toga Estándar Talla 3','TOGA','Toga estándar color azul marino',50.00,5,5,0,1,'2026-07-13 16:00:36','2026-07-13 16:01:23'),(16,'COLLARÍN-VERDE','Collarín verde','COLLARIN','Collarín estándar de color verde',0.00,142,142,0,1,'2026-07-13 16:06:03','2026-07-13 16:06:03'),(17,'COLLARÍN-ROJO','Collarín rojo','COLLARIN','Collarín estándar de color rojo',0.00,85,85,0,1,'2026-07-13 16:07:46','2026-07-13 16:07:46'),(18,'TOGA-UN-CELESTE-S','Toga universitaria talla S','TOGA','Toga universitaria de color celeste',85.00,7,7,0,0,'2026-07-13 16:17:46','2026-07-13 16:27:00'),(19,'TOGA-UN-CELESTE-XS','Toga universitaria talla XS','TOGA','Toga universitaria color celeste',85.00,1,1,0,0,'2026-07-13 16:20:42','2026-07-13 16:27:15'),(20,'TOGA-UN-CELESTE-M','Toga universitaria talla M','TOGA','Toga universitaria de color celeste',85.00,17,17,0,1,'2026-07-13 16:23:16','2026-07-13 16:28:12'),(21,'CAPELO','Capelo universitario','BIRRETE',NULL,0.00,10,10,0,1,'2026-07-13 19:13:16','2026-07-13 19:13:16'),(22,'BORLA-PED','Borla celeste','BORLA','Borla con velcro',0.00,10,10,0,1,'2026-07-13 21:31:21','2026-07-13 21:31:21'),(23,'BORLA-CE','Borla naranja','BORLA','Borla naranja con velcro',0.00,1,1,0,1,'2026-07-13 21:42:26','2026-07-13 21:42:26'),(24,'BORLA-MED','Borla amarilla','BORLA','Borla con velcro',0.00,2,2,0,1,'2026-07-13 21:46:02','2026-07-13 21:46:02'),(25,'BORLA-AGRO','Borla verde','BORLA','Borla verde con velcro',0.00,2,2,0,1,'2026-07-13 21:48:12','2026-07-13 21:48:12'),(29,'CUELLO-UNI','Cuello color azul','COLLARIN','Cuello universitario de color azul',0.00,29,29,0,1,'2026-07-16 17:14:02','2026-07-16 17:14:02');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES ('k7Za87YjJKes9LZDscE3GRt2LtD3LEgbz4YSrUy5',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36','eyJfdG9rZW4iOiJxNllUTXZReFFXWHczTUlDdWpaYWxCNFU0ZEFxQ1F6NzRUR0xUbHZjIiwiX2ZsYXNoIjp7Im5ldyI6W10sIm9sZCI6W119LCJfcHJldmlvdXMiOnsidXJsIjoiaHR0cDpcL1wvMTI3LjAuMC4xOjgwMDBcL3Byb2R1Y3Rvcy13ZWIiLCJyb3V0ZSI6InByb2R1Y3Rvcy5pbmRleCJ9fQ==',1783979292),('LZpPGyYrkHmkDDzoweOwmlDsEk7rH4vIBcYiiMAz',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36','eyJfdG9rZW4iOiJwZXFiY0JmODhoNkxkd3JvTEthN01lbTR3R1VFWnE2cGpDR3JtZFJSIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MDAwXC9wcm9kdWN0b3Mtd2ViXC9jcmVhciIsInJvdXRlIjoicHJvZHVjdG9zLmNyZWF0ZSJ9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX19',1783970178),('n2hUbrGSSUzpIC0gC1aZT6wnllYuP1WzmDZng8HS',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/150.0.0.0 Safari/537.36','eyJfdG9rZW4iOiJvRHl1NXJXV01vOGR5V2lSNmJFY2dwNTNVNFV3STVFVlV2TVZ4VGw0IiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MDAwXC9wcm9kdWN0b3Mtd2ViIiwicm91dGUiOiJwcm9kdWN0b3MuaW5kZXgifSwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119fQ==',1784222043),('nWvoIM4qKh5sTqwl9j2S3PNG6hwwGWiwViUsK8aq',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36','eyJfdG9rZW4iOiI4VkNPVzlhTllUQkl2RDF6ZVJuSUIxV0hhcHdYamM5N3JnRmlHVmlnIiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MDAwXC9wcm9kdWN0b3Mtd2ViXC9jcmVhciIsInJvdXRlIjoicHJvZHVjdG9zLmNyZWF0ZSJ9LCJfZmxhc2giOnsib2xkIjpbXSwibmV3IjpbXX19',1784048275),('Uh2R0Kx1csSTlpaDJw6HCIuiy5aWIeZHVt5NwrlE',NULL,'127.0.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/149.0.0.0 Safari/537.36','eyJfdG9rZW4iOiJWZlNhVFFaWHVYVnRyeXpzWG5EM0lFNXhOQVltT0hHU1RVSzFQQlJ4IiwiX3ByZXZpb3VzIjp7InVybCI6Imh0dHA6XC9cLzEyNy4wLjAuMTo4MDAwXC9wcm9kdWN0b3Mtd2ViIiwicm91dGUiOiJwcm9kdWN0b3MuaW5kZXgifSwiX2ZsYXNoIjp7Im9sZCI6W10sIm5ldyI6W119fQ==',1783960101);
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-07-20 10:36:59

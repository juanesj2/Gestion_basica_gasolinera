-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: tu-DB
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `consumir`
--

DROP TABLE IF EXISTS `consumir`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consumir` (
  `id` int NOT NULL AUTO_INCREMENT,
  `surtidor_id` int DEFAULT NULL,
  `tanque_id` int DEFAULT NULL,
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `cantidad` decimal(10,2) NOT NULL,
  `tipo` varchar(100) DEFAULT NULL,
  `importe` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `surtidor_id` (`surtidor_id`),
  KEY `tanque_id` (`tanque_id`),
  CONSTRAINT `consumir_ibfk_1` FOREIGN KEY (`surtidor_id`) REFERENCES `surtidor` (`id`),
  CONSTRAINT `consumir_ibfk_2` FOREIGN KEY (`tanque_id`) REFERENCES `tanque` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consumir`
--

LOCK TABLES `consumir` WRITE;
/*!40000 ALTER TABLE `consumir` DISABLE KEYS */;
INSERT INTO `consumir` VALUES (1,1,1,'2025-02-21 23:00:00',12.00,'Gasolina 95',18.00),(2,1,1,'2025-02-22 23:00:00',1.00,'Gasolina 95',1.50),(3,1,1,'2025-02-22 23:00:00',1.00,'Gasolina 95',1.50),(5,1,1,'2025-02-22 23:00:00',2.00,'Gasolina 95',3.00),(6,1,4,'2025-02-22 23:00:00',12.00,'Diesel premium',21.60),(7,2,1,'2025-02-23 09:35:32',21.00,'Gasolina 95',31.50);
/*!40000 ALTER TABLE `consumir` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `surtidor`
--

DROP TABLE IF EXISTS `surtidor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `surtidor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `surtidor`
--

LOCK TABLES `surtidor` WRITE;
/*!40000 ALTER TABLE `surtidor` DISABLE KEYS */;
INSERT INTO `surtidor` VALUES (1,'Surtidor 1'),(2,'Surtidor 2'),(3,'Surtidor 3'),(4,'surtidor 4');
/*!40000 ALTER TABLE `surtidor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tanque`
--

DROP TABLE IF EXISTS `tanque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tanque` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `capacidad` decimal(10,2) DEFAULT NULL,
  `cantidad` decimal(10,2) DEFAULT NULL,
  `producto` varchar(100) NOT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tanque`
--

LOCK TABLES `tanque` WRITE;
/*!40000 ALTER TABLE `tanque` DISABLE KEYS */;
INSERT INTO `tanque` VALUES (1,'Tanque 1',10000.00,4942.00,'Gasolina 95',1.50),(2,'Tanque 2',10000.00,5000.00,'Gasolina 98',1.70),(3,'Tanque 3',10000.00,4977.00,'Diesel',1.40),(4,'Tanque 4',10000.00,4988.00,'Diesel premium',1.80);
/*!40000 ALTER TABLE `tanque` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-23 10:39:53

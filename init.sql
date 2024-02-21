-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: localhost    Database: pillars
-- ------------------------------------------------------
-- Server version	8.0.36-0ubuntu0.22.04.1

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
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking` (
  `id` int NOT NULL AUTO_INCREMENT,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `user_id` int NOT NULL,
  `room_id` int NOT NULL,
  `price` int DEFAULT NULL,
  `latency` int DEFAULT '0',
  `adults` int NOT NULL DEFAULT '1',
  `childs` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `user_id_idx` (`user_id`),
  KEY `room_id_idx` (`room_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES (1,'2024-01-01','2024-01-05',1,1,500,0,2,2),(2,'2024-01-01','2024-01-05',3,2,16000,0,2,2),(3,'2024-01-01','2024-01-05',3,2,20000,0,2,2),(4,'2024-01-01','2024-01-05',3,2,20000,0,2,2),(5,'2024-01-01','2024-01-05',3,2,20000,0,2,2),(6,'2024-01-01','2024-01-05',3,2,20000,0,2,2),(7,'2024-01-01','2024-01-05',3,2,20000,5,1,1),(8,'2024-01-01','2024-01-05',3,2,20000,5,1,1),(9,'2024-01-01','2024-01-05',3,2,20000,5,1,1),(10,'2024-01-01','2024-01-05',3,2,20000,5,1,1),(11,'2024-01-01','2024-01-05',3,2,20000,5,1,1),(12,'2024-01-01','2024-01-05',3,2,20000,5,1,1),(13,'2024-01-01','2024-01-05',3,2,20000,5,1,1),(14,'2024-01-01','2024-01-05',3,2,20000,5,1,1),(15,'2024-02-05','2024-02-26',3,2,88000,22,2,2),(16,'2024-02-19','2024-02-22',1,2,16000,4,2,2),(17,'2024-01-31','2024-02-18',10,9,95000,19,1,1),(18,'2024-02-20','2024-02-20',11,10,5000,1,2,2),(21,'2024-02-21','2024-02-21',11,5,5000,1,1,1),(22,'2024-02-20','2024-02-20',3,10,5000,1,2,2),(23,'2024-02-20','2024-02-21',3,10,10000,2,2,2),(24,'2024-02-20','2024-02-21',3,10,10000,2,1,1),(25,'2024-02-20','2024-02-21',3,10,10000,2,1,1);
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `convinient`
--

DROP TABLE IF EXISTS `convinient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `convinient` (
  `id` int NOT NULL AUTO_INCREMENT,
  `tv` tinyint(1) DEFAULT '0',
  `conditioner` tinyint(1) DEFAULT '0',
  `mirror` tinyint(1) DEFAULT '0',
  `bathroom` tinyint(1) DEFAULT '0',
  `breakfast` tinyint(1) DEFAULT '0',
  `safe` tinyint(1) DEFAULT '0',
  `hair_dryer` tinyint(1) DEFAULT '0',
  `wifi` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `convinient`
--

LOCK TABLES `convinient` WRITE;
/*!40000 ALTER TABLE `convinient` DISABLE KEYS */;
INSERT INTO `convinient` VALUES (1,1,1,1,1,1,1,1,1),(2,1,1,1,1,1,1,1,1),(3,1,1,1,1,1,1,1,1),(4,1,1,1,1,1,1,1,1),(5,1,1,1,1,1,1,1,1),(6,1,1,1,1,1,1,1,1),(7,1,1,1,1,1,1,1,1),(8,1,1,1,0,0,0,0,0);
/*!40000 ALTER TABLE `convinient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `image` (
  `id` int NOT NULL AUTO_INCREMENT,
  `room_id` int NOT NULL,
  `src` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `src_UNIQUE` (`src`),
  KEY `room_id_idx` (`room_id`),
  CONSTRAINT `room_id` FOREIGN KEY (`room_id`) REFERENCES `room` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_type`
--

DROP TABLE IF EXISTS `login_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` enum('EMAIL','PHONE') DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_type`
--

LOCK TABLES `login_type` WRITE;
/*!40000 ALTER TABLE `login_type` DISABLE KEYS */;
INSERT INTO `login_type` VALUES (1,'EMAIL');
/*!40000 ALTER TABLE `login_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room` (
  `id` int NOT NULL AUTO_INCREMENT,
  `room_number` int NOT NULL,
  `max_guest_number` int NOT NULL,
  `bed_number` int NOT NULL,
  `price_night` int NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  `convinient` int DEFAULT NULL,
  `title` varchar(45) DEFAULT NULL,
  `image` varchar(250) DEFAULT NULL,
  `quadrature` int DEFAULT NULL,
  `modal_visible` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `convinient_idx` (`convinient`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (2,2,6,4,4000,'test test test',6,'Тест тайтл','/uploads/room/1.jpg',40,0),(3,2,6,4,4000,'test test test',7,'Тест тайтл','/uploads/room/2.jpg',40,0),(4,4,10,6,2000,'antoher description',8,'one more title','/uploads/room/3.jpg',70,0),(5,5,7,3,5000,'Хорощий вариант Хороший',8,'Название тоже хорошее','/uploads/room/2.jpg',50,0),(6,5,7,3,5000,'Еще один хороший вариант',5,'Название тоже хорошее','/uploads/room/2.jpg',50,0),(7,5,7,3,5000,'Еще вариант',5,'Название тоже хорошее','/uploads/room/2.jpg',50,0),(8,5,7,3,5000,'Еще вариант',5,'Название тоже хорошее','/uploads/room/2.jpg',50,0),(9,5,7,3,5000,'Еще вариант',5,'Название тоже хорошее','/uploads/room/2.jpg',50,0),(10,5,7,3,5000,'Еще вариант',5,'Название тоже хорошее','/uploads/room/2.jpg',50,0);
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `firstname` varchar(45) NOT NULL,
  `lastname` varchar(45) NOT NULL,
  `middlename` varchar(45) NOT NULL,
  `phonenumber` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `phonenumber_UNIQUE` (`phonenumber`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'1','1','1','1','1','1'),(3,'2','2','2','2','2','2'),(8,'2','2','2','5','5','2'),(10,'2','2','2','8','8','2'),(11,'Yunus','Kussiev','Ilesovich','89225645805','yunuskus2007@gmail.com','IseetTop2022');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-21  3:19:18

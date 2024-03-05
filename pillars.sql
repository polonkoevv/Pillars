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
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES (40,'2024-03-04','2024-03-11',3,2,32000,8,1,1),(41,'2024-03-04','2024-03-11',3,2,32000,8,1,1),(42,'2024-03-02','2024-03-04',3,6,15000,3,2,2),(43,'2024-03-01','2024-03-01',3,2,8000,2,1,1),(44,'2024-03-04','2024-03-11',113,2,32000,8,2,1),(45,'2024-03-05','2024-03-17',113,3,52000,13,3,2);
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
INSERT INTO `room` VALUES (2,2,2,4,4000,'Test',6,'Номер “Стандарт”','/uploads/room/1.png',45,0),(3,2,2,4,4000,'Просторный номер более 30м² с видом на горы. Классические сдержанные оттенки в оформлении и максимум дневного света.',6,'Номер “Комфорт”','/uploads/room/2.png',45,0),(4,2,2,6,2000,'Каждый номер отеля оснащен кроватями с ортопедическими матрасами, бесплатным доступом к Wi-Fi, индивидуальной системой кондиционирования и принадлежностями для чая и кофе. ',6,'Апартаменты “Dark”','/uploads/room/3.png',45,0),(5,2,2,3,5000,'Каждый номер отеля оснащен кроватями с ортопедическими матрасами, бесплатным доступом к Wi-Fi, индивидуальной системой кондиционирования и принадлежностями для чая и кофе. ',6,'Номер “Яркий”','/uploads/room/4.png',45,0),(6,2,2,3,5000,'Каждый номер отеля оснащен кроватями с ортопедическими матрасами, бесплатным доступом к Wi-Fi, индивидуальной системой кондиционирования и принадлежностями для чая и кофе. ',6,'Апартаменты “White”','/uploads/room/5.png',45,0),(7,2,2,2,5000,'Каждый номер отеля оснащен кроватями с ортопедическими матрасами, бесплатным доступом к Wi-Fi, индивидуальной системой кондиционирования и принадлежностями для чая и кофе. ',5,'Апартаменты “Green”','/uploads/room/9.png',45,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'1','1','1','1','1','1'),(3,'2','2','2','2','2','2'),(8,'2','2','2','5','5','2'),(10,'11','2','2','8','11','22'),(11,'Yunus','Kussiev','Ilesovich','89225645805','yunuskus2007@gmail.com','IseetTop2022'),(83,'V','LUX','v','mmeuriev@gmail.com','mmeuriev@gmail.com','2'),(90,'Петро','Петро','Петро','89509995130','anton.supic@yandex.ru','toxa4345678'),(113,'Ilez','Kussiev','Magomedovich','89287964856','kussiev@gmail.com','Kfadsf234');
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

-- Dump completed on 2024-03-05  6:12:35

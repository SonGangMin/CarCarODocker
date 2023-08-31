-- MySQL dump 10.13  Distrib 8.0.32, for Linux (x86_64)
--
-- Host: localhost    Database: CarCarO
-- ------------------------------------------------------
-- Server version	8.0.32-0ubuntu0.22.04.2

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
-- Table structure for table `advertises`
--

DROP TABLE IF EXISTS `advertises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `advertises` (
  `no` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `href` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `img` json DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `advertises`
--

LOCK TABLES `advertises` WRITE;
/*!40000 ALTER TABLE `advertises` DISABLE KEYS */;
INSERT INTO `advertises` VALUES (1,'11111111111111','https://naver.com','[{\"url\": \"/img/greenfactory1683189625880.png\", \"filename\": \"greenfactory1683189625880.png\"}]','2023-05-04 08:40:25','2023-05-04 08:40:25'),(24,'asdfasfasdf','https://google.com','[{\"url\": \"/img/145968_153522_17431683189976335.jpg\", \"filename\": \"145968_153522_17431683189976335.jpg\"}]','2023-05-04 08:46:16','2023-05-04 08:46:16');
/*!40000 ALTER TABLE `advertises` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `boards`
--

DROP TABLE IF EXISTS `boards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `boards` (
  `postId` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `content` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `grade` int NOT NULL DEFAULT '1',
  `count` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`postId`),
  KEY `boards_FK` (`user_id`),
  CONSTRAINT `boards_FK` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1124 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boards`
--

LOCK TABLES `boards` WRITE;
/*!40000 ALTER TABLE `boards` DISABLE KEYS */;
/*!40000 ALTER TABLE `boards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cars`
--

DROP TABLE IF EXISTS `cars`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cars` (
  `num` bigint NOT NULL AUTO_INCREMENT,
  `carNum` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `user_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `from` varchar(255) NOT NULL,
  `brand` varchar(255) NOT NULL,
  `model` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `mile` bigint NOT NULL,
  `year` bigint NOT NULL,
  `fuel` varchar(100) NOT NULL,
  `trans` varchar(100) NOT NULL,
  `seater` varchar(255) NOT NULL,
  `disp` varchar(255) NOT NULL,
  `type` varchar(100) NOT NULL,
  `method` varchar(100) NOT NULL,
  `color` varchar(100) NOT NULL,
  `tel` varchar(100) NOT NULL,
  `picture` json NOT NULL,
  `roof` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nav` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `light` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `sensor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `camera` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `box` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `leather` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `heated` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `airbag` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `etc` varchar(255) DEFAULT NULL,
  `hashtag` varchar(100) DEFAULT NULL,
  `likes_count` int DEFAULT '0',
  `price` bigint NOT NULL,
  `status` int NOT NULL DEFAULT '1',
  `recommends` int NOT NULL DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`num`),
  UNIQUE KEY `cars_UN` (`carNum`),
  KEY `cars_FK` (`user_id`),
  CONSTRAINT `cars_FK` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=312 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cars`
--

LOCK TABLES `cars` WRITE;
/*!40000 ALTER TABLE `cars` DISABLE KEYS */;
INSERT INTO `cars` VALUES (263,'2323','skm0628','수입','아우디','911',5555,1993,'휘발유','수동','4','2','경차','전륜','','','[{\"url\": \"/carImg/logo_1683022992332.png\", \"filename\": \"logo_1683022992332.png\"}]','2','2','2','2','2','2','2','2','2','undefined','','#3131 #2222 #ss',2,4444,1,0,'2023-05-02 10:23:12','2023-05-02 10:23:12'),(264,'12345','skm0628','국산','제네시스','그랜저',5555,2002,'휘발유','수동','4','2','경차','전륜','','','[{\"url\": \"/carImg/다운로드_1683081265510.jpeg\", \"filename\": \"다운로드_1683081265510.jpeg\"}]','2','2','2','2','2','2','2','2','2','undefined','','',1,444,1,0,'2023-05-03 02:34:25','2023-05-03 02:34:25'),(265,'1414','user','국산','제네시스','그랜저',4444,1993,'전기','수동','4','2','경차','전륜','','','[{\"url\": \"/carImg/스크린샷 2023-02-07 09-11-30_1683081321634.png\", \"filename\": \"스크린샷 2023-02-07 09-11-30_1683081321634.png\"}]','2','2','2','2','2','2','2','2','2','undefined','','#ss #11 #22 #33 #44',1,1313,1,0,'2023-05-03 02:35:21','2023-05-03 02:35:21'),(266,'23234','skm0628','수입','아우디','911',5555,1993,'휘발유','수동','4','2','경차','전륜','','','[{\"url\": \"/carImg/logo_1683022992332.png\", \"filename\": \"logo_1683022992332.png\"}]','2','2','2','2','2','2','2','2','2','undefined','','#3131 #2222 #ss',2,4444,1,0,'2023-05-02 10:23:12','2023-05-02 10:23:12'),(267,'123454','skm0628','국산','제네시스','그랜저',5555,2002,'휘발유','수동','4','2','경차','전륜','','','[{\"url\": \"/carImg/다운로드_1683081265510.jpeg\", \"filename\": \"다운로드_1683081265510.jpeg\"}]','2','2','2','2','2','2','2','2','2','undefined','','',2,444,1,0,'2023-05-03 02:34:25','2023-05-03 02:34:25'),(268,'14144','user','국산','제네시스','그랜저',4444,1993,'전기','수동','4','2','경차','전륜','','','[{\"url\": \"/carImg/스크린샷 2023-02-07 09-11-30_1683081321634.png\", \"filename\": \"스크린샷 2023-02-07 09-11-30_1683081321634.png\"}]','2','2','2','2','2','2','2','2','2','undefined','','#ss #11 #22 #33 #44',0,1313,1,0,'2023-05-03 02:35:21','2023-05-03 02:35:21'),(269,'23235','skm0628','수입','아우디','911',5555,1993,'휘발유','수동','4','2','경차','전륜','','','[{\"url\": \"/carImg/logo_1683022992332.png\", \"filename\": \"logo_1683022992332.png\"}]','2','2','2','2','2','2','2','2','2','undefined','','#3131 #2222 #ss',2,4444,1,0,'2023-05-02 10:23:12','2023-05-02 10:23:12'),(270,'123455','skm0628','국산','제네시스','그랜저',5555,2002,'휘발유','수동','4','2','경차','전륜','','','[{\"url\": \"/carImg/다운로드_1683081265510.jpeg\", \"filename\": \"다운로드_1683081265510.jpeg\"}]','2','2','2','2','2','2','2','2','2','undefined','','',2,444,1,0,'2023-05-03 02:34:25','2023-05-03 02:34:25'),(271,'14145','user','국산','제네시스','그랜저',4444,1993,'전기','수동','4','2','경차','전륜','','','[{\"url\": \"/carImg/스크린샷 2023-02-07 09-11-30_1683081321634.png\", \"filename\": \"스크린샷 2023-02-07 09-11-30_1683081321634.png\"}]','2','2','2','2','2','2','2','2','2','undefined','','#ss #11 #22 #33 #44',0,1313,1,0,'2023-05-03 02:35:21','2023-05-03 02:35:21'),(272,'23231','skm0628','수입','아우디','911',5555,1993,'휘발유','수동','4','2','경차','전륜','','','[{\"url\": \"/carImg/logo_1683022992332.png\", \"filename\": \"logo_1683022992332.png\"}]','2','2','2','2','2','2','2','2','2','undefined','','#3131 #2222 #ss',0,4444,1,0,'2023-05-02 10:23:12','2023-05-02 10:23:12'),(273,'123451','skm0628','국산','제네시스','그랜저',5555,2002,'휘발유','수동','4','2','경차','전륜','','','[{\"url\": \"/carImg/다운로드_1683081265510.jpeg\", \"filename\": \"다운로드_1683081265510.jpeg\"}]','2','2','2','2','2','2','2','2','2','undefined','','',0,444,1,0,'2023-05-03 02:34:25','2023-05-03 02:34:25'),(274,'14141','user','국산','제네시스','그랜저',4444,1993,'전기','수동','4','2','경차','전륜','','','[{\"url\": \"/carImg/스크린샷 2023-02-07 09-11-30_1683081321634.png\", \"filename\": \"스크린샷 2023-02-07 09-11-30_1683081321634.png\"}]','2','2','2','2','2','2','2','2','2','undefined','','#ss #11 #22 #33 #44',0,1313,1,0,'2023-05-03 02:35:21','2023-05-03 02:35:21'),(275,'23232','skm0628','수입','아우디','911',5555,1993,'휘발유','수동','4','2','경차','전륜','','','[{\"url\": \"/carImg/logo_1683022992332.png\", \"filename\": \"logo_1683022992332.png\"}]','2','2','2','2','2','2','2','2','2','undefined','','#3131 #2222 #ss',0,4444,1,0,'2023-05-02 10:23:12','2023-05-02 10:23:12'),(276,'123452','skm0628','국산','제네시스','그랜저',5555,2002,'휘발유','수동','4','2','경차','전륜','','','[{\"url\": \"/carImg/다운로드_1683081265510.jpeg\", \"filename\": \"다운로드_1683081265510.jpeg\"}]','2','2','2','2','2','2','2','2','2','undefined','','',0,444,1,0,'2023-05-03 02:34:25','2023-05-03 02:34:25'),(277,'14142','user','국산','제네시스','그랜저',4444,1993,'전기','수동','4','2','경차','전륜','','','[{\"url\": \"/carImg/스크린샷 2023-02-07 09-11-30_1683081321634.png\", \"filename\": \"스크린샷 2023-02-07 09-11-30_1683081321634.png\"}]','2','2','2','2','2','2','2','2','2','undefined','','#ss #11 #22 #33 #44',0,1313,1,0,'2023-05-03 02:35:21','2023-05-03 02:35:21'),(278,'23233','skm0628','수입','아우디','911',5555,1993,'휘발유','수동','4','2','경차','전륜','','','[{\"url\": \"/carImg/logo_1683022992332.png\", \"filename\": \"logo_1683022992332.png\"}]','2','2','2','2','2','2','2','2','2','undefined','','#3131 #2222 #ss',0,4444,1,0,'2023-05-02 10:23:12','2023-05-02 10:23:12'),(279,'123453','skm0628','국산','제네시스','그랜저',5555,2002,'휘발유','수동','4','2','경차','전륜','','','[{\"url\": \"/carImg/다운로드_1683081265510.jpeg\", \"filename\": \"다운로드_1683081265510.jpeg\"}]','2','2','2','2','2','2','2','2','2','undefined','','',0,444,1,0,'2023-05-03 02:34:25','2023-05-03 02:34:25'),(280,'14143','user','국산','제네시스','그랜저',4444,1993,'전기','수동','4','2','경차','전륜','','','[{\"url\": \"/carImg/스크린샷 2023-02-07 09-11-30_1683081321634.png\", \"filename\": \"스크린샷 2023-02-07 09-11-30_1683081321634.png\"}]','2','2','2','2','2','2','2','2','2','undefined','','#ss #11 #22 #33 #44',0,1313,1,0,'2023-05-03 02:35:21','2023-05-03 02:35:21'),(281,'23236','skm0628','수입','아우디','911',5555,1993,'휘발유','수동','4','2','경차','전륜','','','[{\"url\": \"/carImg/logo_1683022992332.png\", \"filename\": \"logo_1683022992332.png\"}]','2','2','2','2','2','2','2','2','2','undefined','','#3131 #2222 #ss',0,4444,1,0,'2023-05-02 10:23:12','2023-05-02 10:23:12'),(282,'123456','skm0628','국산','제네시스','그랜저',5555,2002,'휘발유','수동','4','2','경차','전륜','','','[{\"url\": \"/carImg/다운로드_1683081265510.jpeg\", \"filename\": \"다운로드_1683081265510.jpeg\"}]','2','2','2','2','2','2','2','2','2','undefined','','',0,444,1,0,'2023-05-03 02:34:25','2023-05-03 02:34:25'),(283,'14146','user','국산','제네시스','그랜저',4444,1993,'전기','수동','4','2','경차','전륜','','','[{\"url\": \"/carImg/스크린샷 2023-02-07 09-11-30_1683081321634.png\", \"filename\": \"스크린샷 2023-02-07 09-11-30_1683081321634.png\"}]','2','2','2','2','2','2','2','2','2','undefined','','#ss #11 #22 #33 #44',1,1313,1,0,'2023-05-03 02:35:21','2023-05-03 02:35:21'),(284,'23237','skm0628','수입','아우디','911',5555,1993,'휘발유','수동','4','2','경차','전륜','','','[{\"url\": \"/carImg/logo_1683022992332.png\", \"filename\": \"logo_1683022992332.png\"}]','2','2','2','2','2','2','2','2','2','undefined','','#3131 #2222 #ss',0,4444,1,0,'2023-05-02 10:23:12','2023-05-02 10:23:12'),(285,'123457','skm0628','국산','제네시스','그랜저',5555,2002,'휘발유','수동','4','2','경차','전륜','','','[{\"url\": \"/carImg/다운로드_1683081265510.jpeg\", \"filename\": \"다운로드_1683081265510.jpeg\"}]','2','2','2','2','2','2','2','2','2','undefined','','',0,444,1,0,'2023-05-03 02:34:25','2023-05-03 02:34:25'),(286,'14147','user','국산','제네시스','그랜저',4444,1993,'전기','수동','4','2','경차','전륜','','','[{\"url\": \"/carImg/스크린샷 2023-02-07 09-11-30_1683081321634.png\", \"filename\": \"스크린샷 2023-02-07 09-11-30_1683081321634.png\"}]','2','2','2','2','2','2','2','2','2','undefined','','#ss #11 #22 #33 #44',0,1313,1,0,'2023-05-03 02:35:21','2023-05-03 02:35:21'),(287,'23238','skm0628','수입','아우디','911',5555,1993,'휘발유','수동','4','2','경차','전륜','','','[{\"url\": \"/carImg/logo_1683022992332.png\", \"filename\": \"logo_1683022992332.png\"}]','2','2','2','2','2','2','2','2','2','undefined','','#3131 #2222 #ss',0,4444,1,0,'2023-05-02 10:23:12','2023-05-02 10:23:12'),(288,'123458','skm0628','국산','제네시스','그랜저',5555,2002,'휘발유','수동','4','2','경차','전륜','','','[{\"url\": \"/carImg/다운로드_1683081265510.jpeg\", \"filename\": \"다운로드_1683081265510.jpeg\"}]','2','2','2','2','2','2','2','2','2','undefined','','',0,444,1,0,'2023-05-03 02:34:25','2023-05-03 02:34:25'),(289,'14148','user','국산','제네시스','그랜저',4444,1993,'전기','수동','4','2','경차','전륜','','','[{\"url\": \"/carImg/스크린샷 2023-02-07 09-11-30_1683081321634.png\", \"filename\": \"스크린샷 2023-02-07 09-11-30_1683081321634.png\"}]','2','2','2','2','2','2','2','2','2','undefined','','#ss #11 #22 #33 #44',0,1313,1,0,'2023-05-03 02:35:21','2023-05-03 02:35:21'),(290,'23239','skm0628','수입','아우디','911',5555,1993,'휘발유','수동','4','2','경차','전륜','','','[{\"url\": \"/carImg/logo_1683022992332.png\", \"filename\": \"logo_1683022992332.png\"}]','2','2','2','2','2','2','2','2','2','undefined','','#3131 #2222 #ss',0,4444,1,0,'2023-05-02 10:23:12','2023-05-02 10:23:12'),(291,'123459','skm0628','국산','제네시스','그랜저',5555,2002,'휘발유','수동','4','2','경차','전륜','','','[{\"url\": \"/carImg/다운로드_1683081265510.jpeg\", \"filename\": \"다운로드_1683081265510.jpeg\"}]','2','2','2','2','2','2','2','2','2','undefined','','',0,444,1,0,'2023-05-03 02:34:25','2023-05-03 02:34:25'),(292,'14149','user','국산','제네시스','그랜저',4444,1993,'전기','수동','4','2','경차','전륜','','','[{\"url\": \"/carImg/스크린샷 2023-02-07 09-11-30_1683081321634.png\", \"filename\": \"스크린샷 2023-02-07 09-11-30_1683081321634.png\"}]','2','2','2','2','2','2','2','2','2','undefined','','#ss #11 #22 #33 #44',0,1313,1,0,'2023-05-03 02:35:21','2023-05-03 02:35:21'),(293,'232313','skm0628','수입','아우디','911',5555,1993,'휘발유','수동','4','2','경차','전륜','','','[{\"url\": \"/carImg/logo_1683022992332.png\", \"filename\": \"logo_1683022992332.png\"}]','2','2','2','2','2','2','2','2','2','undefined','','#3131 #2222 #ss',0,4444,1,0,'2023-05-02 10:23:12','2023-05-02 10:23:12'),(294,'1234513','skm0628','국산','제네시스','그랜저',5555,2002,'휘발유','수동','4','2','경차','전륜','','','[{\"url\": \"/carImg/다운로드_1683081265510.jpeg\", \"filename\": \"다운로드_1683081265510.jpeg\"}]','2','2','2','2','2','2','2','2','2','undefined','','',0,444,1,0,'2023-05-03 02:34:25','2023-05-03 02:34:25'),(295,'141413','user','국산','제네시스','그랜저',4444,1993,'전기','수동','4','2','경차','전륜','','','[{\"url\": \"/carImg/스크린샷 2023-02-07 09-11-30_1683081321634.png\", \"filename\": \"스크린샷 2023-02-07 09-11-30_1683081321634.png\"}]','2','2','2','2','2','2','2','2','2','undefined','','#ss #11 #22 #33 #44',0,1313,1,0,'2023-05-03 02:35:21','2023-05-03 02:35:21'),(296,'232312','skm0628','수입','아우디','911',5555,1993,'휘발유','수동','4','2','경차','전륜','','','[{\"url\": \"/carImg/logo_1683022992332.png\", \"filename\": \"logo_1683022992332.png\"}]','2','2','2','2','2','2','2','2','2','undefined','','#3131 #2222 #ss',0,4444,1,0,'2023-05-02 10:23:12','2023-05-02 10:23:12'),(297,'1234512','skm0628','국산','제네시스','그랜저',5555,2002,'휘발유','수동','4','2','경차','전륜','','','[{\"url\": \"/carImg/다운로드_1683081265510.jpeg\", \"filename\": \"다운로드_1683081265510.jpeg\"}]','2','2','2','2','2','2','2','2','2','undefined','','',0,444,1,0,'2023-05-03 02:34:25','2023-05-03 02:34:25'),(298,'141412','user','국산','제네시스','그랜저',4444,1993,'전기','수동','4','2','경차','전륜','','','[{\"url\": \"/carImg/스크린샷 2023-02-07 09-11-30_1683081321634.png\", \"filename\": \"스크린샷 2023-02-07 09-11-30_1683081321634.png\"}]','2','2','2','2','2','2','2','2','2','undefined','','#ss #11 #22 #33 #44',0,1313,1,0,'2023-05-03 02:35:21','2023-05-03 02:35:21'),(299,'232311','skm0628','수입','아우디','911',5555,1993,'휘발유','수동','4','2','경차','전륜','','','[{\"url\": \"/carImg/logo_1683022992332.png\", \"filename\": \"logo_1683022992332.png\"}]','2','2','2','2','2','2','2','2','2','undefined','','#3131 #2222 #ss',0,4444,1,0,'2023-05-02 10:23:12','2023-05-02 10:23:12'),(300,'1234511','skm0628','국산','제네시스','그랜저',5555,2002,'휘발유','수동','4','2','경차','전륜','','','[{\"url\": \"/carImg/다운로드_1683081265510.jpeg\", \"filename\": \"다운로드_1683081265510.jpeg\"}]','2','2','2','2','2','2','2','2','2','undefined','','',0,444,2,0,'2023-05-03 02:34:25','2023-05-04 04:59:43'),(301,'141411','user','국산','제네시스','그랜저',4444,1993,'전기','수동','4','2','경차','전륜','','','[{\"url\": \"/carImg/스크린샷 2023-02-07 09-11-30_1683081321634.png\", \"filename\": \"스크린샷 2023-02-07 09-11-30_1683081321634.png\"}]','2','2','2','2','2','2','2','2','2','undefined','','#ss #11 #22 #33 #44',0,1313,1,0,'2023-05-03 02:35:21','2023-05-04 00:15:23'),(302,'1234','user','국산','제네시스','911',5555,1993,'휘발유','수동','4','2','경차','전륜','','','[{\"url\": \"/carImg/다운로드_1683083123224.jpeg\", \"filename\": \"다운로드_1683083123224.jpeg\"}]','2','2','2','2','2','2','2','2','2','undefined','','',1,444,1,0,'2023-05-03 03:05:23','2023-05-03 03:05:23'),(303,'123444123','user','국산','제네시스','그랜저',5555,2021,'경유','수동','4','2','경차','전륜','','','[{\"url\": \"/carImg/다운로드_1683083165826.jpeg\", \"filename\": \"다운로드_1683083165826.jpeg\"}]','2','2','2','2','2','2','2','2','2','undefined','','#허허허 #ㅋㅋㅋ',3,444,1,0,'2023-05-03 03:06:05','2023-05-04 00:15:22'),(304,'232332','admin','수입','아우디','A6',5000,2022,'휘발유','수동','4','2','경차','전륜','','','[{\"url\": \"/carImg/아우디A6_1683115546788.jpg\", \"filename\": \"아우디A6_1683115546788.jpg\"}]','2','2','2','2','2','2','2','2','2','undefined','','#중년의자존심 #A6',2,10000,2,1,'2023-05-03 12:05:46','2023-05-04 00:15:36'),(305,'13가 5656','user','수입','아우디','A6',15000,2023,'휘발유','자동','4','1','소형차','전륜','검정','','[{\"url\": \"/carImg/다운로드_1683163802117.jpeg\", \"filename\": \"다운로드_1683163802117.jpeg\"}, {\"url\": \"/carImg/아우디A6_1683163802119.jpg\", \"filename\": \"아우디A6_1683163802119.jpg\"}]','1','1','1','1','1','1','1','1','2','undefined','싸다','#싸다 #아우디 #A6 #개멋잇다 #여자꼬시러가자 #갑부',3,8000,1,1,'2023-05-04 01:30:02','2023-05-04 01:33:35'),(306,'12가 1212','aldo9974','수입','볼보','S90',1000,2023,'하이브리드','자동','4','1','중형차','전륜','쥐색','','[{\"url\": \"/carImg/다운로드 (1)_1683176069435.jpeg\", \"filename\": \"다운로드 (1)_1683176069435.jpeg\"}]','1','1','1','1','1','1','1','1','1','undefined','개멋짐','#존나멋짐 #개간지',2,10000,1,1,'2023-05-04 04:54:29','2023-05-04 04:58:19'),(307,'123가456','kbj','수입','포르쉐','카이엔',0,2023,'전기','자동','5','1','SUV','사륜','흰색','','[{\"url\": \"/carImg/카이엔_1683185688295.png\", \"filename\": \"카이엔_1683185688295.png\"}]','1','1','1','1','1','1','1','1','1','undefined','쳐쥑이네','#개간지 #카이엔 #가보자고',0,53621,1,0,'2023-05-04 07:34:48','2023-05-04 07:34:48'),(311,'4123123','skm0628','국산','제네시스','그랜저',5555,1,'휘발유','수동','4','2','경차','전륜','','','[{\"url\": \"/carImg/다운로드 (1)_1683204700727.jpeg\", \"filename\": \"다운로드 (1)_1683204700727.jpeg\"}]','2','2','2','2','2','2','2','2','2','undefined','','',0,444,1,0,'2023-05-04 12:51:40','2023-05-04 12:51:40');
/*!40000 ALTER TABLE `cars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `number` bigint NOT NULL AUTO_INCREMENT,
  `content` varchar(100) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `post_id` bigint NOT NULL,
  PRIMARY KEY (`number`),
  KEY `comments_FK` (`user_id`),
  KEY `comments_FK_1` (`post_id`),
  CONSTRAINT `comments_FK` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comments_FK_1` FOREIGN KEY (`post_id`) REFERENCES `boards` (`postId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `increment_count` AFTER INSERT ON `comments` FOR EACH ROW BEGIN

  UPDATE boards SET count = count + 1 WHERE postId = NEW.post_id;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `decrement_count` AFTER DELETE ON `comments` FOR EACH ROW begin

    update boards set count = count -1 where postId = old.post_id;

end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `faqs`
--

DROP TABLE IF EXISTS `faqs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faqs` (
  `number` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `content` varchar(100) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `grade` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`number`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faqs`
--

LOCK TABLES `faqs` WRITE;
/*!40000 ALTER TABLE `faqs` DISABLE KEYS */;
INSERT INTO `faqs` VALUES (5,'ddd','ddd','2023-05-03 08:04:31','2023-05-04 00:27:07',1);
/*!40000 ALTER TABLE `faqs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hashtags`
--

DROP TABLE IF EXISTS `hashtags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hashtags` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cars_num` bigint NOT NULL,
  `cars_hashtag` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `hashtags_FK` (`cars_num`),
  CONSTRAINT `hashtags_FK` FOREIGN KEY (`cars_num`) REFERENCES `cars` (`num`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hashtags`
--

LOCK TABLES `hashtags` WRITE;
/*!40000 ALTER TABLE `hashtags` DISABLE KEYS */;
INSERT INTO `hashtags` VALUES (14,263,'3131'),(15,263,'2222'),(16,263,'ss'),(17,265,'ss'),(18,265,'11'),(19,265,'22'),(20,265,'33'),(21,265,'44'),(22,303,'허허허'),(23,303,'ㅋㅋㅋ'),(24,304,'중년의자존심'),(25,304,'a6'),(26,305,'싸다'),(27,305,'아우디'),(28,305,'a6'),(29,305,'개멋잇다'),(30,305,'여자꼬시러가자'),(31,305,'갑부'),(32,306,'존나멋짐'),(33,306,'개간지'),(34,307,'개간지'),(35,307,'카이엔'),(36,307,'가보자고');
/*!40000 ALTER TABLE `hashtags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inquirys`
--

DROP TABLE IF EXISTS `inquirys`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inquirys` (
  `number` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `content` varchar(255) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  `answer` varchar(100) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`number`),
  KEY `inquiry_FK` (`user_id`),
  CONSTRAINT `inquiry_FK` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inquirys`
--

LOCK TABLES `inquirys` WRITE;
/*!40000 ALTER TABLE `inquirys` DISABLE KEYS */;
INSERT INTO `inquirys` VALUES (9,'aaa','aaa','skm0628',NULL,'2023-05-04 05:32:43','2023-05-04 05:32:43'),(10,'fff','fff','skm0628',NULL,'2023-05-04 05:32:46','2023-05-04 05:32:46'),(11,'ggg','ggg','skm0628',NULL,'2023-05-04 05:32:49','2023-05-04 05:32:49'),(12,'afaf','afaf','skm0628',NULL,'2023-05-04 05:32:52','2023-05-04 05:32:52'),(13,'ㅁㄻㄹ','ㅁㄻㄹ','skm0628','    ㅋㅋㅋㅋㅋ','2023-05-04 05:36:02','2023-05-04 06:34:54'),(14,'ㅋㅋㅋ','ㅋㅋㅋㅋ','skm0628','    ㄹㅇㅋㅋㅋㅋㅋ','2023-05-04 05:36:05','2023-05-04 06:34:51');
/*!40000 ALTER TABLE `inquirys` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likes`
--

DROP TABLE IF EXISTS `likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likes` (
  `number` bigint NOT NULL AUTO_INCREMENT,
  `car_num` bigint NOT NULL,
  `user_id` varchar(100) NOT NULL,
  PRIMARY KEY (`number`),
  KEY `likes_FK_1` (`user_id`),
  KEY `likes_FK` (`car_num`),
  CONSTRAINT `likes_FK` FOREIGN KEY (`car_num`) REFERENCES `cars` (`num`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `likes_FK_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
INSERT INTO `likes` VALUES (42,263,'user'),(43,264,'user'),(44,266,'user'),(45,270,'user'),(46,267,'user'),(47,269,'user'),(48,303,'admin'),(49,265,'admin'),(50,263,'admin'),(51,270,'admin'),(52,266,'admin'),(53,267,'admin'),(55,269,'admin'),(56,305,'admin'),(57,305,'skm0628'),(58,283,'skm0628'),(59,303,'skm0628'),(60,306,'skm0628'),(61,306,'kbj'),(63,302,'kbj'),(64,304,'kbj'),(65,305,'kbj'),(66,303,'kbj'),(67,304,'skm0628');
/*!40000 ALTER TABLE `likes` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `increment_likes_count` AFTER INSERT ON `likes` FOR EACH ROW BEGIN

  UPDATE cars SET likes_count = likes_count + 1 WHERE num = NEW.car_num;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `decrement_likes_count` AFTER DELETE ON `likes` FOR EACH ROW begin

	update cars set likes_count = likes_count -1 where num = old.car_num;

end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `no` bigint NOT NULL AUTO_INCREMENT,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `tel` varchar(13) NOT NULL,
  `birth` varchar(10) DEFAULT NULL,
  `provider` enum('local','kakao') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'local',
  `grade` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_UN` (`email`,`tel`),
  UNIQUE KEY `users_UN2` (`no`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('admin',3,'admin@admin.com','최고관리자','$2b$12$u.Gotepc4gM/2BdFsWitu.iIV0ULRgaQBHqo.X6EMw9PUnFxv4ru.','01099999999','99','local',3),('aldo9974',11,'alxo9974@naver.com','마앵이','$2b$12$t1xgNIPmUDeWQQX7E7TsT.Ez1aG7v6dod2u.oxw83/wKsfN0K8/9.','01066669750','27','local',1),('kbj',7,'s@s.com','김병제쒸','$2b$12$VBBlD42EuGauy5FzBWyQ5uxb630KGyfgpPQ2WdjpHHODQyr6vg9ya','01011111111','3','local',2),('kdh',6,'28@naver.com','김다훈','$2b$12$5SdjkUn.rFYCVObGtCLJeOpRQT/40uHkWDJKaJ5bOEPc.NwqdXEpS','01011111111','2','local',2),('lsh',9,'s@s.com2','이승호','$2b$12$mtUnLIEYpSHDBPEubS6ZYOePtc5TQxNr3RcE1e0aw1W20RLv7qZtC','01011111112','13','local',2),('skm0628',5,'skm0628@naver.com','손강민','$2b$12$h2nm2QvwJKQ6AX8q2K.WyeOtCownhDRAtaOPrRut/vYcDrNIM4g.i','01011111111','12','local',2),('user',4,'user@user.com','일반유저','$2b$12$U8whBmo/OY7Z/pqBivutGuF.I15hSwYhs/TgbBfrOHn9jcFijD3TK','01011111111','1','local',1);
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

-- Dump completed on 2023-05-08  9:10:29

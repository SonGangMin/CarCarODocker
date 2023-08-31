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
  PRIMARY KEY (`postId`),
  KEY `boards_FK` (`user_id`),
  CONSTRAINT `boards_FK` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1078 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `boards`
--

LOCK TABLES `boards` WRITE;
/*!40000 ALTER TABLE `boards` DISABLE KEYS */;
INSERT INTO `boards` VALUES (1058,'공지사항1','공지사항1','2023-04-27 02:09:24','2023-04-27 02:11:21','admin',2),(1059,'공지사항2ㄹㄹ','공지사항2ddffㄹㄹㄹddffgggfffdddggg','2023-04-27 02:09:31','2023-04-28 02:42:39','admin',2),(1061,'일반게시글','일반게시글','2023-04-27 02:09:44','2023-04-27 02:09:44','admin',1),(1062,'일반게시글3','일반게시글3','2023-04-27 02:09:48','2023-04-27 02:09:48','admin',1),(1063,'일반게시글4','일반게시글4','2023-04-27 02:09:53','2023-04-27 02:09:53','admin',1),(1064,'일반게시글5','일반게시글5','2023-04-27 02:09:57','2023-04-27 02:09:57','admin',1),(1065,'일반게시글','일반게시글','2023-04-27 02:10:14','2023-04-27 02:10:14','user',1),(1066,'일반게시글6','일반게시글6','2023-04-27 02:10:19','2023-04-27 02:10:19','user',1),(1067,'일반게시글7','일반게시글7','2023-04-27 02:10:24','2023-04-27 02:10:24','user',1),(1068,'일반게시글8','일반게시글8','2023-04-27 02:10:29','2023-04-27 02:10:29','user',1),(1070,'일반게시글10','일반게시글10','2023-04-27 02:10:41','2023-04-27 02:10:41','user',1),(1071,'일반게시글11','일반게시글11','2023-04-27 02:10:46','2023-04-27 02:10:46','user',1),(1072,'일반게시글12','일반게시글12','2023-04-27 02:10:50','2023-04-27 02:10:50','user',1),(1073,'일반게시글13','13','2023-04-27 02:10:54','2023-04-27 02:10:54','user',1),(1074,'일반게시글14','일반게시글14','2023-04-27 02:10:58','2023-04-28 03:03:48','user',1),(1077,'아아아','오오오\r\n','2023-05-01 03:52:59','2023-05-01 03:52:59','skmin0628',1);
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
  `brand` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `from` varchar(255) NOT NULL,
  `model` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `mile` varchar(255) NOT NULL,
  `year` varchar(255) NOT NULL,
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
  `hashtag` varchar(100) DEFAULT NULL,
  `likes_count` int DEFAULT '0',
  `price` bigint NOT NULL,
  `etc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `status` int NOT NULL DEFAULT '1',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`num`),
  UNIQUE KEY `cars_UN` (`carNum`),
  KEY `cars_FK` (`user_id`),
  KEY `cars_FK_2` (`brand`),
  CONSTRAINT `cars_FK` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cars`
--

LOCK TABLES `cars` WRITE;
/*!40000 ALTER TABLE `cars` DISABLE KEYS */;
INSERT INTO `cars` VALUES (61,'12가 1212','skmin0628','제네시스','국산','그랜저','5555','93','경유','수동','3','2','경차','전륜','ㅅㅅ','','[{\"url\": \"/carImg/logo_1682913397976.png\", \"filename\": \"logo_1682913397976.png\"}, {\"url\": \"/carImg/ì¤í¬ë¦°ì· 2023-02-07 09-09-17_1682913397980.png\", \"filename\": \"ì¤í¬ë¦°ì· 2023-02-07 09-09-17_1682913397980.png\"}, {\"url\": \"/carImg/ì¤í¬ë¦°ì· 2023-02-07 09-11-30_1682913397986.png\", \"filename\": \"ì¤í¬ë¦°ì· 2023-02-07 09-11-30_1682913397986.png\"}]','2','2','2','2','2','2','2','2','2','undefined','#13 #12 #55',0,123,'ㅅㅅ',2,'2023-05-01 03:56:37','2023-05-01 04:24:52'),(62,'2323','skmin0628','제네시스','국산','911','5555','93','경유','자동','3','2','경차','전륜','빨강','','[{\"url\": \"/carImg/logo_1682913803236.png\", \"filename\": \"logo_1682913803236.png\"}]','2','2','2','2','2','2','2','2','2','undefined','555 #13 #5555',0,333,'ㅇ',2,'2023-05-01 04:03:23','2023-05-01 04:21:06');
/*!40000 ALTER TABLE `cars` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carsHashtags`
--

DROP TABLE IF EXISTS `carsHashtags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carsHashtags` (
  `carsId` bigint NOT NULL,
  `hashtagId` bigint NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`carsId`,`hashtagId`),
  KEY `carsHashtags_FK_1` (`hashtagId`),
  CONSTRAINT `carsHashtags_FK` FOREIGN KEY (`carsId`) REFERENCES `cars` (`num`),
  CONSTRAINT `carsHashtags_FK_1` FOREIGN KEY (`hashtagId`) REFERENCES `hashtags` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carsHashtags`
--

LOCK TABLES `carsHashtags` WRITE;
/*!40000 ALTER TABLE `carsHashtags` DISABLE KEYS */;
/*!40000 ALTER TABLE `carsHashtags` ENABLE KEYS */;
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
  CONSTRAINT `comments_FK` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `comments_FK_1` FOREIGN KEY (`post_id`) REFERENCES `boards` (`postId`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (64,'ㄹㄹgg','2023-04-27 12:01:40','2023-04-27 23:54:40','admin',1059),(66,'ㅅㅅ','2023-04-27 12:03:56','2023-04-27 12:03:56','skm0628',1074),(67,'ㅅㅅ','2023-04-27 12:03:58','2023-04-27 12:03:58','skm0628',1074),(68,'ㅅㅅㄹㄹfff','2023-04-27 12:04:33','2023-04-28 03:03:57','skm0628',1072),(69,'ㅅㅅㅅ','2023-04-27 12:04:50','2023-04-27 12:04:50','user',1073),(70,'ㅅㅅㄹㄹ','2023-04-27 12:04:56','2023-04-27 23:58:10','user',1058),(71,'ㅅㅅㄹㄹㄹㄹ','2023-04-27 12:12:13','2023-04-27 12:21:52','user',1074),(81,'ff','2023-04-27 23:54:41','2023-04-27 23:57:14','admin',1059),(82,'fffㄹㄹ','2023-04-27 23:54:42','2023-04-27 23:57:12','admin',1059),(83,'ㄹ','2023-04-28 01:35:11','2023-04-28 01:35:11','user',1058),(84,'ttt','2023-04-28 01:47:10','2023-04-28 01:47:10','admin',1070),(85,'tttt','2023-04-28 01:47:12','2023-04-28 01:47:12','admin',1070),(86,'ffff','2023-04-28 01:47:13','2023-04-28 01:47:13','admin',1070),(88,'ㄹㄹggg','2023-04-28 02:14:29','2023-04-28 02:29:05','user',1059),(89,'dddd','2023-04-28 02:14:30','2023-04-28 02:29:03','user',1059),(90,'ㅎㅎㅎ','2023-04-28 02:14:49','2023-04-28 02:14:49','skm0628',1059),(91,'ㅎㅎㅎ','2023-04-28 02:14:50','2023-04-28 02:14:50','skm0628',1059),(92,'ㅎㅎ','2023-04-28 02:15:00','2023-04-28 02:15:00','admin',1059),(93,'ㄹㄹㄹffff','2023-04-28 02:15:09','2023-04-28 02:28:59','user',1059),(95,'aa','2023-04-28 02:38:34','2023-04-28 02:38:34','admin',1059);
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

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
INSERT INTO `faqs` VALUES (5,'FAQ입니다.','자주묻는질문~','2023-04-28 04:52:05','2023-04-28 04:52:51',2);
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
  `cars_hashtag` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hashtags`
--

LOCK TABLES `hashtags` WRITE;
/*!40000 ALTER TABLE `hashtags` DISABLE KEYS */;
INSERT INTO `hashtags` VALUES (7,'13'),(8,'12'),(9,'55'),(10,'5555');
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
  PRIMARY KEY (`number`),
  KEY `inquiry_FK` (`user_id`),
  CONSTRAINT `inquiry_FK` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inquirys`
--

LOCK TABLES `inquirys` WRITE;
/*!40000 ALTER TABLE `inquirys` DISABLE KEYS */;
INSERT INTO `inquirys` VALUES (4,'홈페이지 좋네요','ㅎㅎ','admin','   ㅇㅈ합니다.');
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
  `car_num` varchar(255) NOT NULL,
  `user_id` varchar(100) NOT NULL,
  PRIMARY KEY (`number`),
  KEY `likes_FK_1` (`user_id`),
  KEY `likes_FK` (`car_num`),
  CONSTRAINT `likes_FK` FOREIGN KEY (`car_num`) REFERENCES `cars` (`carNum`),
  CONSTRAINT `likes_FK_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likes`
--

LOCK TABLES `likes` WRITE;
/*!40000 ALTER TABLE `likes` DISABLE KEYS */;
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
  UPDATE cars SET likes_count = likes_count + 1 WHERE carNum = NEW.car_num;
END */;;
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
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `email` varchar(100) NOT NULL,
  `tel` varchar(13) NOT NULL,
  `birth` varchar(10) DEFAULT NULL,
  `grade` int NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_UN` (`email`,`tel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('admin','관리자','$2b$12$axVl/qpDI46EsU1oDepL1.l0BH/Bwfmp55rSycQf21CBMzV5RUBRS','admin@admin.com','01012345678','99',2),('kbj001211','김병제','$2b$12$nf24.NvqhxZ6xvbcyF/7yu/Hkj.4x1HIqRSHGXEBk7fSGwx9FaBw2','kbj@kbj','01010101010','24',2),('rlaekgns1','김다훈','$2b$12$1PjAaFRR38z3U1lFXl8qbuCrv8eVO9eDmWkKKieXwtwxzGFNamkfC','2','2','2',2),('skm0628','손강민','$2b$12$MX3gNEjrvIjIIUUDRXgF3O.4sRXSWiJoduEo2EVQ5neVtqnPiopLa','skm0628@naver.com','01049775695','31',2),('skmin0628','손강민','$2b$12$Dg91tjy9JeO2DVnMwjQzfullOQU9oeH9iL.BlQG4xrq6Mwis9YbSe','s@s.com','01049775695','13',1),('user','일반유저','$2b$12$J4WpzT4lxse1QG4DPRFsReNfWqssbd19YOnTk58LgunwaWDUD6Y92','user@user.com','01011111111','1',1),('weise','LSH','$2b$12$Xy0cQJP9A6O2stOhdi99suM0QoLnmTQ95/jfVgUaxvrVbYTom7252','a','123123','3',2);
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

-- Dump completed on 2023-05-01 13:30:48

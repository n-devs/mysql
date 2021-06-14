-- MySQL dump 10.13  Distrib 8.0.20, for macos10.15 (x86_64)
--
-- Host: localhost    Database: blackboardV2
-- ------------------------------------------------------
-- Server version	8.0.23

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
-- Table structure for table `certificate`
--

DROP TABLE IF EXISTS `certificate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `certificate` (
  `id` int NOT NULL AUTO_INCREMENT,
  `key` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `discription` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `photoURL` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status_type` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idlesson_UNIQUE` (`id`),
  UNIQUE KEY `key_UNIQUE` (`key`),
  KEY `fk_certificate_user1_idx` (`user_id`),
  KEY `fk_certificate_status1_idx` (`status_type`),
  CONSTRAINT `fk_certificate_status1` FOREIGN KEY (`status_type`) REFERENCES `status` (`type`),
  CONSTRAINT `fk_certificate_user1` FOREIGN KEY (`user_id`) REFERENCES `auths`.`user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificate`
--

LOCK TABLES `certificate` WRITE;
/*!40000 ALTER TABLE `certificate` DISABLE KEYS */;
/*!40000 ALTER TABLE `certificate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `id` int NOT NULL AUTO_INCREMENT,
  `key` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `discription` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `coverURL` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idlesson_UNIQUE` (`id`),
  UNIQUE KEY `key_UNIQUE` (`key`),
  KEY `fk_course_user1_idx` (`user_id`),
  CONSTRAINT `fk_course_user1` FOREIGN KEY (`user_id`) REFERENCES `auths`.`user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `follow`
--

DROP TABLE IF EXISTS `follow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `follow` (
  `id` int NOT NULL AUTO_INCREMENT,
  `unit` int NOT NULL DEFAULT '1',
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `user_follow_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_follow_user_idx` (`user_id`),
  KEY `fk_follow_user1_idx` (`user_follow_id`),
  CONSTRAINT `fk_follow_user` FOREIGN KEY (`user_id`) REFERENCES `auths`.`user` (`id`),
  CONSTRAINT `fk_follow_user1` FOREIGN KEY (`user_follow_id`) REFERENCES `auths`.`user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `follow`
--

LOCK TABLES `follow` WRITE;
/*!40000 ALTER TABLE `follow` DISABLE KEYS */;
/*!40000 ALTER TABLE `follow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lesson`
--

DROP TABLE IF EXISTS `lesson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lesson` (
  `id` int NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` text COLLATE utf8_unicode_ci,
  `discription` text COLLATE utf8_unicode_ci,
  `coverURL` text COLLATE utf8_unicode_ci,
  `videoURL` text COLLATE utf8_unicode_ci,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `course_id` int NOT NULL,
  `pricing_type` int NOT NULL,
  `publishing_type` int NOT NULL,
  `status_type` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idlesson_UNIQUE` (`id`),
  UNIQUE KEY `key_UNIQUE` (`key`),
  KEY `fk_lesson_course1_idx` (`course_id`),
  KEY `fk_lesson_pricing1_idx` (`pricing_type`),
  KEY `fk_lesson_publishing1_idx` (`publishing_type`),
  KEY `fk_lesson_status1_idx` (`status_type`),
  CONSTRAINT `fk_lesson_course1` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`),
  CONSTRAINT `fk_lesson_pricing1` FOREIGN KEY (`pricing_type`) REFERENCES `pricing` (`type`),
  CONSTRAINT `fk_lesson_publishing1` FOREIGN KEY (`publishing_type`) REFERENCES `publishing` (`type`),
  CONSTRAINT `fk_lesson_status1` FOREIGN KEY (`status_type`) REFERENCES `status` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lesson`
--

LOCK TABLES `lesson` WRITE;
/*!40000 ALTER TABLE `lesson` DISABLE KEYS */;
/*!40000 ALTER TABLE `lesson` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `transaction` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `amount` int NOT NULL DEFAULT '0',
  `brand` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `status` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`,`transaction`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_has_lesson_and_course`
--

DROP TABLE IF EXISTS `payment_has_lesson_and_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_has_lesson_and_course` (
  `payment_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `payment_transaction` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lesson_id` int NOT NULL,
  `course_id` int NOT NULL,
  PRIMARY KEY (`payment_id`,`payment_transaction`,`lesson_id`,`course_id`),
  KEY `fk_payment_has_lesson_lesson1_idx` (`lesson_id`),
  KEY `fk_payment_has_lesson_payment1_idx` (`payment_id`,`payment_transaction`),
  KEY `fk_payment_has_lesson_course1_idx` (`course_id`),
  CONSTRAINT `fk_payment_has_lesson_course1` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`),
  CONSTRAINT `fk_payment_has_lesson_lesson1` FOREIGN KEY (`lesson_id`) REFERENCES `lesson` (`id`),
  CONSTRAINT `fk_payment_has_lesson_payment1` FOREIGN KEY (`payment_id`, `payment_transaction`) REFERENCES `payment` (`id`, `transaction`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_has_lesson_and_course`
--

LOCK TABLES `payment_has_lesson_and_course` WRITE;
/*!40000 ALTER TABLE `payment_has_lesson_and_course` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_has_lesson_and_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `position`
--

DROP TABLE IF EXISTS `position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `position` (
  `type` int NOT NULL,
  `discription` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  PRIMARY KEY (`type`),
  UNIQUE KEY `type_UNIQUE` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position`
--

LOCK TABLES `position` WRITE;
/*!40000 ALTER TABLE `position` DISABLE KEYS */;
INSERT INTO `position` VALUES (0,'นักเรียน'),(1,'ครูฟรีแลนซ์'),(2,'วิชาชีพ'),(3,'สถาบัน');
/*!40000 ALTER TABLE `position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pricing`
--

DROP TABLE IF EXISTS `pricing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pricing` (
  `type` int NOT NULL,
  `discription` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  PRIMARY KEY (`type`),
  UNIQUE KEY `type_UNIQUE` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pricing`
--

LOCK TABLES `pricing` WRITE;
/*!40000 ALTER TABLE `pricing` DISABLE KEYS */;
INSERT INTO `pricing` VALUES (0,'ฟรี'),(1,'คิดราคา');
/*!40000 ALTER TABLE `pricing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `privilege`
--

DROP TABLE IF EXISTS `privilege`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `privilege` (
  `type` int NOT NULL,
  `discription` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`type`),
  UNIQUE KEY `type_UNIQUE` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `privilege`
--

LOCK TABLES `privilege` WRITE;
/*!40000 ALTER TABLE `privilege` DISABLE KEYS */;
INSERT INTO `privilege` VALUES (0,'user'),(1,'admin');
/*!40000 ALTER TABLE `privilege` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publishing`
--

DROP TABLE IF EXISTS `publishing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publishing` (
  `type` int NOT NULL,
  `discription` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  PRIMARY KEY (`type`),
  UNIQUE KEY `type_UNIQUE` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publishing`
--

LOCK TABLES `publishing` WRITE;
/*!40000 ALTER TABLE `publishing` DISABLE KEYS */;
INSERT INTO `publishing` VALUES (0,'ส่วนตัว'),(1,'สาธารณะ'),(2,'ไม่เป็นสาธารณะ');
/*!40000 ALTER TABLE `publishing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `share`
--

DROP TABLE IF EXISTS `share`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `share` (
  `id` int NOT NULL AUTO_INCREMENT,
  `unit` int NOT NULL DEFAULT '1',
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `course_id` int NOT NULL,
  `lesson_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_share_course1_idx` (`course_id`),
  KEY `fk_share_lesson1_idx` (`lesson_id`),
  CONSTRAINT `fk_share_course1` FOREIGN KEY (`course_id`) REFERENCES `course` (`id`),
  CONSTRAINT `fk_share_lesson1` FOREIGN KEY (`lesson_id`) REFERENCES `lesson` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `share`
--

LOCK TABLES `share` WRITE;
/*!40000 ALTER TABLE `share` DISABLE KEYS */;
/*!40000 ALTER TABLE `share` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status` (
  `type` int NOT NULL AUTO_INCREMENT,
  `discription` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_has_position`
--

DROP TABLE IF EXISTS `user_has_position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_has_position` (
  `user_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `position_type` int NOT NULL,
  PRIMARY KEY (`user_id`,`position_type`),
  KEY `fk_user_has_position_position1_idx` (`position_type`),
  KEY `fk_user_has_position_user1_idx` (`user_id`),
  CONSTRAINT `fk_user_has_position_position1` FOREIGN KEY (`position_type`) REFERENCES `position` (`type`),
  CONSTRAINT `fk_user_has_position_user1` FOREIGN KEY (`user_id`) REFERENCES `auths`.`user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_has_position`
--

LOCK TABLES `user_has_position` WRITE;
/*!40000 ALTER TABLE `user_has_position` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_has_position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_has_privilege`
--

DROP TABLE IF EXISTS `user_has_privilege`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_has_privilege` (
  `user_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `privilege_type` int NOT NULL,
  PRIMARY KEY (`user_id`,`privilege_type`),
  KEY `fk_user_has_privilege_privilege1_idx` (`privilege_type`),
  KEY `fk_user_has_privilege_user1_idx` (`user_id`),
  CONSTRAINT `fk_user_has_privilege_privilege1` FOREIGN KEY (`privilege_type`) REFERENCES `privilege` (`type`),
  CONSTRAINT `fk_user_has_privilege_user1` FOREIGN KEY (`user_id`) REFERENCES `auths`.`user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_has_privilege`
--

LOCK TABLES `user_has_privilege` WRITE;
/*!40000 ALTER TABLE `user_has_privilege` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_has_privilege` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `view`
--

DROP TABLE IF EXISTS `view`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `view` (
  `id` int NOT NULL AUTO_INCREMENT,
  `unit` int NOT NULL DEFAULT '1',
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lesson_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_view_user1_idx` (`user_id`),
  KEY `fk_view_lesson1_idx` (`lesson_id`),
  CONSTRAINT `fk_view_lesson1` FOREIGN KEY (`lesson_id`) REFERENCES `lesson` (`id`),
  CONSTRAINT `fk_view_user1` FOREIGN KEY (`user_id`) REFERENCES `auths`.`user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `view`
--

LOCK TABLES `view` WRITE;
/*!40000 ALTER TABLE `view` DISABLE KEYS */;
/*!40000 ALTER TABLE `view` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-15  1:25:56

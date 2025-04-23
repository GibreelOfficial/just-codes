-- MySQL dump 10.13  Distrib 8.0.40, for macos14 (x86_64)
--
-- Host: localhost    Database: voting_sys
-- ------------------------------------------------------
-- Server version	8.0.40

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
-- Table structure for table `ballot`
--

DROP TABLE IF EXISTS `ballot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ballot` (
  `ballot_id` int NOT NULL AUTO_INCREMENT,
  `election_id` int NOT NULL,
  `student_id` int NOT NULL,
  `candidate_id` int NOT NULL,
  PRIMARY KEY (`ballot_id`),
  KEY `candidate_id` (`candidate_id`),
  KEY `student_id` (`student_id`),
  CONSTRAINT `ballot_ibfk_1` FOREIGN KEY (`candidate_id`) REFERENCES `candidate` (`candidate_id`) ON DELETE CASCADE,
  CONSTRAINT `ballot_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ballot`
--

LOCK TABLES `ballot` WRITE;
/*!40000 ALTER TABLE `ballot` DISABLE KEYS */;
INSERT INTO `ballot` VALUES (1,1,1,51),(2,1,2,51),(3,1,3,52),(4,2,2,53),(5,2,4,52),(6,3,3,51),(7,3,1,53),(8,3,2,52),(9,4,2,51),(10,4,1,53),(11,4,3,52),(12,5,2,51),(13,5,1,51),(14,5,3,51);
/*!40000 ALTER TABLE `ballot` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `candidate`
--

DROP TABLE IF EXISTS `candidate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `candidate` (
  `candidate_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `student_id` int NOT NULL,
  `position_id` int NOT NULL,
  PRIMARY KEY (`candidate_id`),
  KEY `position_id` (`position_id`),
  KEY `student_id` (`student_id`),
  CONSTRAINT `candidate_ibfk_1` FOREIGN KEY (`position_id`) REFERENCES `position` (`position_id`) ON DELETE CASCADE,
  CONSTRAINT `candidate_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candidate`
--

LOCK TABLES `candidate` WRITE;
/*!40000 ALTER TABLE `candidate` DISABLE KEYS */;
INSERT INTO `candidate` VALUES (51,'John','Okello',1,12),(52,'Sarah','Namukwaya',2,13),(53,'David','Obote',3,14),(54,'Alice','Kanyomozi',4,15),(55,'Joel','Kanyomozi',5,16);
/*!40000 ALTER TABLE `candidate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `election`
--

DROP TABLE IF EXISTS `election`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `election` (
  `election_id` int NOT NULL AUTO_INCREMENT,
  `election_name` varchar(255) NOT NULL,
  `election_date` date NOT NULL,
  `election_status` varchar(50) NOT NULL,
  PRIMARY KEY (`election_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `election`
--

LOCK TABLES `election` WRITE;
/*!40000 ALTER TABLE `election` DISABLE KEYS */;
INSERT INTO `election` VALUES (1,'2025 Guild Elections','2025-03-15','Open'),(2,'2024 Parliamentary Elections','2024-03-15','Closed'),(3,'2023 Parliamentary Elections','2023-03-15','Closed'),(4,'2022 Parliamentary Elections','2022-03-15','Closed'),(5,'2021 Parliamentary Elections','2021-03-15','Closed'),(6,'2020 Guild  Elections','2020-03-15','Closed');
/*!40000 ALTER TABLE `election` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `election_results`
--

DROP TABLE IF EXISTS `election_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `election_results` (
  `result_no` int NOT NULL AUTO_INCREMENT,
  `election_id` int NOT NULL,
  `student_id` int NOT NULL,
  `position_id` int NOT NULL,
  `candidate_id` int NOT NULL,
  PRIMARY KEY (`result_no`),
  KEY `fk_election` (`election_id`),
  KEY `fk_student` (`student_id`),
  KEY `fk_candidate` (`candidate_id`),
  KEY `fk_position` (`position_id`),
  CONSTRAINT `fk_candidate` FOREIGN KEY (`candidate_id`) REFERENCES `candidate` (`candidate_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_election` FOREIGN KEY (`election_id`) REFERENCES `election` (`election_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_position` FOREIGN KEY (`position_id`) REFERENCES `position` (`position_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_student` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `election_results`
--

LOCK TABLES `election_results` WRITE;
/*!40000 ALTER TABLE `election_results` DISABLE KEYS */;
INSERT INTO `election_results` VALUES (1,1,1,12,51),(2,1,2,13,52),(3,2,2,13,54),(4,2,4,13,54),(5,3,2,12,54),(6,3,2,12,51),(7,4,1,12,52),(8,4,2,12,51),(9,5,1,13,51),(10,5,5,20,54);
/*!40000 ALTER TABLE `election_results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `position`
--

DROP TABLE IF EXISTS `position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `position` (
  `position_id` int NOT NULL AUTO_INCREMENT,
  `election_id` int NOT NULL,
  `position_name` varchar(100) NOT NULL,
  PRIMARY KEY (`position_id`),
  KEY `fk_position_election` (`election_id`),
  CONSTRAINT `fk_position_election` FOREIGN KEY (`election_id`) REFERENCES `election` (`election_id`) ON DELETE CASCADE,
  CONSTRAINT `position_ibfk_1` FOREIGN KEY (`election_id`) REFERENCES `election` (`election_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position`
--

LOCK TABLES `position` WRITE;
/*!40000 ALTER TABLE `position` DISABLE KEYS */;
INSERT INTO `position` VALUES (12,1,'Guild President'),(13,1,'Lady Vice President'),(14,1,'Sports Minister'),(15,2,'ICT Minister'),(16,2,'Finance Minister'),(17,3,'Dhwa Minister'),(18,3,'Information Minister'),(19,4,'Disaster Minister'),(20,4,'Public Relations Minister'),(21,5,'Presidency Minister'),(22,5,'Education Minister');
/*!40000 ALTER TABLE `position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `student_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `course` varchar(50) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `contact` varchar(10) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'John','Okello','BCS','Male','0701234567','john.okello@gmail.com'),(2,'Sarah','Namukwaya','BIT','Female','0707654321','sarah.namukwaya@gmail.com'),(3,'David','Obote','BIT','Male','0709876543','david.obote@gmail.com'),(4,'Alice','Kanyomozi','BIT','Female','0704567890','kanyomozi@gmail.com'),(5,'Joel','Kanyomozi','BCS','Male','0701122334','kanyomozi@gmail.com');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `voters_register`
--

DROP TABLE IF EXISTS `voters_register`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `voters_register` (
  `voter_id` int NOT NULL AUTO_INCREMENT,
  `election_id` int NOT NULL,
  `student_id` int NOT NULL,
  `vote_status` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`voter_id`),
  KEY `election_id` (`election_id`),
  KEY `student_id` (`student_id`),
  CONSTRAINT `voters_register_ibfk_1` FOREIGN KEY (`election_id`) REFERENCES `election` (`election_id`),
  CONSTRAINT `voters_register_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `student` (`student_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `voters_register`
--

LOCK TABLES `voters_register` WRITE;
/*!40000 ALTER TABLE `voters_register` DISABLE KEYS */;
INSERT INTO `voters_register` VALUES (1,1,1,0),(2,1,2,0),(3,1,3,0),(4,1,4,0),(5,1,5,0);
/*!40000 ALTER TABLE `voters_register` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'voting_sys'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-23 14:26:38

-- MySQL dump 10.13  Distrib 8.0.19, for macos10.15 (x86_64)
--
-- Host: mydb.cigic3cefobe.us-east-2.rds.amazonaws.com    Database: TrainTicketing
-- ------------------------------------------------------
-- Server version	5.7.22-log

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
-- Table structure for table `Business_fare`
--

DROP TABLE IF EXISTS `Business_fare`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Business_fare` (
  `transit_line_name` varchar(50) NOT NULL,
  `monthly_fee` float DEFAULT NULL,
  `weekly_fee` float DEFAULT NULL,
  `one_way_fee` float DEFAULT NULL,
  `round_trip_fee` float DEFAULT NULL,
  PRIMARY KEY (`transit_line_name`),
  CONSTRAINT `Business_fare_ibfk_1` FOREIGN KEY (`transit_line_name`) REFERENCES `Fare` (`transit_line_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Business_fare`
--

LOCK TABLES `Business_fare` WRITE;
/*!40000 ALTER TABLE `Business_fare` DISABLE KEYS */;
INSERT INTO `Business_fare` VALUES ('A',300,100,13,15),('b',250,80,12,18),('ee',300,100,7,13),('LX',500,300,30,50),('Rexl',400,100,15,28),('Rutgers line',300,100,15,25),('short line',200,70,8,50);
/*!40000 ALTER TABLE `Business_fare` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customer`
--

DROP TABLE IF EXISTS `Customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customer` (
  `username` varchar(20) NOT NULL,
  `first_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `state` varchar(10) DEFAULT NULL,
  `zip_code` varchar(10) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer`
--

LOCK TABLES `Customer` WRITE;
/*!40000 ALTER TABLE `Customer` DISABLE KEYS */;
INSERT INTO `Customer` VALUES ('Blue','Jam','Karl','435@gmail.com','Silvers Apartment','Piscataway','NJ','10085','1992345633','123321'),('Fire','Andy','Zhang','er@gmail.com','Skarkey Apartment','New Brunswick','NJ','8854','1770004249','321'),('hi','Hick','Helo','hh11@scarletmail.rutgers.edu','20_BPO_way','Piscataway','NJ','08854','9997774444','hello'),('IEEELALA','Guofu','Zhou','34532@gmail.com','Quad 304','New Brunswick','NJ','8855','77394002223','332211'),('junyi','junyi','yao','junyiyao670@gmail.com','Rutgers','Piscataway','NJ','08854','8482521275','spark670'),('LOVEQQ','Kun','Liu','liukun23@gmai.com','32 Phelps Ave','NewBrunswick','NJ','08901','7326852235','6656677'),('qw1','Qingyang','Wang','qw1@gmail.com','123 BPO Way','Piscataway','NJ','08854','1231231235','123'),('qw2','Qin','Wan','qw2@gmail.com','12 BPO Way','Piscataway','NJ','08854','7897891230','123'),('qw3','Qy','Wan','qw3@gmail.com','567 BPO Way','Bridgewater','NJ','08807','6536537890','123'),('Qz','quanqin','Wang','Qz_17@yahoo.com','640 dpo way','piscataway','NJ','08854','7328974432','2222256'),('sam','sam','bellvue','sb@rutgers.edu','22_BPO_way','Piscataway','NJ','08854','1234561231','123321'),('Sky','Bob','Tom','1@gmail.com','Rutgers Univ','New Brunswick','NJ','10085','1990009988','123'),('Time2Go','Taiquan','Li','Quanli112@gmail.com','1002 Musko drive','Piscataway','NJ','08854','5143665877','789456'),('vick','vick','vick','vick@gmail.com','rutgers','new brunswick','NJ','08901','8482521275','spark670');
/*!40000 ALTER TABLE `Customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Customer_representative`
--

DROP TABLE IF EXISTS `Customer_representative`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Customer_representative` (
  `SSN` int(11) NOT NULL,
  PRIMARY KEY (`SSN`),
  CONSTRAINT `Customer_representative_ibfk_1` FOREIGN KEY (`SSN`) REFERENCES `Employee` (`SSN`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customer_representative`
--

LOCK TABLES `Customer_representative` WRITE;
/*!40000 ALTER TABLE `Customer_representative` DISABLE KEYS */;
INSERT INTO `Customer_representative` VALUES (77432),(222444),(2343233),(243785283);
/*!40000 ALTER TABLE `Customer_representative` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Economy_fare`
--

DROP TABLE IF EXISTS `Economy_fare`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Economy_fare` (
  `transit_line_name` varchar(50) NOT NULL,
  `monthly_fee` float DEFAULT NULL,
  `weekly_fee` float DEFAULT NULL,
  `one_way_fee` float DEFAULT NULL,
  `round_trip_fee` float DEFAULT NULL,
  PRIMARY KEY (`transit_line_name`),
  CONSTRAINT `Economy_fare_ibfk_1` FOREIGN KEY (`transit_line_name`) REFERENCES `Fare` (`transit_line_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Economy_fare`
--

LOCK TABLES `Economy_fare` WRITE;
/*!40000 ALTER TABLE `Economy_fare` DISABLE KEYS */;
INSERT INTO `Economy_fare` VALUES ('A',300,80,20,30),('b',150,60,8,10),('ee',300,100,7,13),('LX',300,200,13,24),('Rexl',400,100,15,28),('Rutgers line',240,80,10,16),('short line',140,50,6,10);
/*!40000 ALTER TABLE `Economy_fare` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employee`
--

DROP TABLE IF EXISTS `Employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Employee` (
  `SSN` int(11) NOT NULL,
  `First_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(20) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`SSN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employee`
--

LOCK TABLES `Employee` WRITE;
/*!40000 ALTER TABLE `Employee` DISABLE KEYS */;
INSERT INTO `Employee` VALUES (77432,'Jeffs','Ken','Aliener','43234'),(87654,'JUNYI','vick','junjun','spark670'),(222444,'Xiao','Zhang','Green','333333'),(2343233,'Mike','Torror','Earth','123321'),(123456789,'David','Joe','admin','password'),(243785283,'Ruimin','Li','Ruimin Li','1998829');
/*!40000 ALTER TABLE `Employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Fare`
--

DROP TABLE IF EXISTS `Fare`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Fare` (
  `transit_line_name` varchar(50) NOT NULL,
  `senior_discount` float DEFAULT NULL,
  `children_discount` float DEFAULT NULL,
  `disabled_discount` float DEFAULT NULL,
  PRIMARY KEY (`transit_line_name`),
  CONSTRAINT `Fare_ibfk_1` FOREIGN KEY (`transit_line_name`) REFERENCES `Route` (`transit_line_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Fare`
--

LOCK TABLES `Fare` WRITE;
/*!40000 ALTER TABLE `Fare` DISABLE KEYS */;
INSERT INTO `Fare` VALUES ('A',0.7,0.8,0.7),('b',0.55,0.55,0.5),('ee',0.7,0.7,0.5),('LX',0.6,0.6,0.7),('Rexl',0.6,0.6,0.4),('Rutgers line',0.5,0.5,0.45),('short line',0.6,0.6,0.6);
/*!40000 ALTER TABLE `Fare` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `First_fare`
--

DROP TABLE IF EXISTS `First_fare`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `First_fare` (
  `transit_line_name` varchar(50) NOT NULL,
  `monthly_fee` float DEFAULT NULL,
  `weekly_fee` float DEFAULT NULL,
  `one_way_fee` float DEFAULT NULL,
  `round_trip_fee` float DEFAULT NULL,
  PRIMARY KEY (`transit_line_name`),
  CONSTRAINT `First_fare_ibfk_1` FOREIGN KEY (`transit_line_name`) REFERENCES `Fare` (`transit_line_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `First_fare`
--

LOCK TABLES `First_fare` WRITE;
/*!40000 ALTER TABLE `First_fare` DISABLE KEYS */;
INSERT INTO `First_fare` VALUES ('A',600,200,100,150),('b',500,150,20,30),('ee',500,300,10,17),('LX',800,300,20,50),('Rexl',700,500,15,28),('Rutgers line',800,260,30,45),('short line',340,100,12,20);
/*!40000 ALTER TABLE `First_fare` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Questions`
--

DROP TABLE IF EXISTS `Questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Questions` (
  `Qid` int(11) NOT NULL AUTO_INCREMENT,
  `Customer` varchar(45) NOT NULL,
  `Question` varchar(250) NOT NULL,
  `Response` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`Qid`),
  KEY `Customer_idx` (`Customer`),
  CONSTRAINT `Customer` FOREIGN KEY (`Customer`) REFERENCES `Customer` (`username`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Questions`
--

LOCK TABLES `Questions` WRITE;
/*!40000 ALTER TABLE `Questions` DISABLE KEYS */;
INSERT INTO `Questions` VALUES (61,'qw1','How to edit reservation','go to Edit_my_reservation'),(63,'junyi','how is the weather today','\' a'),(65,'junyi','answer my question',NULL),(66,'junyi','waiting for answers','thank you for your patience'),(67,'qw1','How to cancel?',NULL),(68,'qw2','Any more route?',NULL),(69,'qw2','where to search','use search'),(70,'Qz','How many people usualy on the train',NULL),(74,'hi','Can you ask question for me?','yes'),(75,'hi','Can you ask questions instead of me?',NULL),(76,'hi','How do I know if my train get cancelled?',NULL),(77,'Time2Go','Will the train arive late?',NULL),(79,'junyi','Alert','Your Train Schedule Rutgers line has some changes!'),(80,'Sky','Alert','Your Train Schedule Rutgers line has some changes!'),(81,'qw1','Alert','Your Train Schedule Rutgers line has some changes!'),(82,'LOVEQQ','Alert','Your Train Schedule Rutgers line has some changes!'),(83,'sam','Alert','Your Train Schedule Rutgers line has some changes!'),(84,'qw2','Alert','Your Train Schedule Rutgers line has some changes!'),(86,'qw3','Alert','Your Train Schedule Rutgers line has some changes!'),(87,'hi','Alert','Your Train Schedule Rutgers line has some changes!'),(88,'Qz','Alert','Your Train Schedule Rutgers line has some changes!'),(89,'sam','Can I get free lunch on the train?',NULL),(90,'sam','How much is the dinner on the train',NULL),(91,'sam','Can first cart customer get free wine on the train&#65311;',NULL),(92,'vick','Hi there!',NULL),(93,'vick','Good morning!',NULL),(94,'vick','See you!',NULL),(95,'qw3','How old are you?',NULL),(96,'qw3','Can I change schedule',NULL),(97,'junyi','how are you',NULL),(98,'junyi','how do you do',NULL),(99,'junyi','can i cancel my train?','of course you can'),(100,'junyi','Alert','Your Train Schedule Rutgers line has some changes!'),(101,'Sky','Alert','Your Train Schedule Rutgers line has some changes!'),(102,'qw1','Alert','Your Train Schedule Rutgers line has some changes!'),(103,'LOVEQQ','Alert','Your Train Schedule Rutgers line has some changes!'),(104,'sam','Alert','Your Train Schedule Rutgers line has some changes!'),(105,'vick','Alert','Your Train Schedule Rutgers line has some changes!'),(106,'qw2','Alert','Your Train Schedule Rutgers line has some changes!'),(107,'qw3','Alert','Your Train Schedule Rutgers line has some changes!'),(108,'hi','Alert','Your Train Schedule Rutgers line has some changes!'),(109,'Qz','Alert','Your Train Schedule Rutgers line has some changes!');
/*!40000 ALTER TABLE `Questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Reservation`
--

DROP TABLE IF EXISTS `Reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Reservation` (
  `total_fare` float DEFAULT NULL,
  `seat_number` int(11) DEFAULT NULL,
  `class` varchar(15) DEFAULT NULL,
  `booking_fee` float DEFAULT NULL,
  `reservation_date` date DEFAULT NULL,
  `dep_Train_ID` int(11) NOT NULL,
  `dep_Transit_line_name` varchar(50) NOT NULL,
  `dep_Station_ID` int(11) NOT NULL,
  `dep_date` date NOT NULL,
  `arr_Train_ID` int(11) NOT NULL,
  `arr_Transit_line_name` varchar(50) NOT NULL,
  `arr_Station_ID` int(11) NOT NULL,
  `arr_date` date NOT NULL,
  `assist_representative_SSN` int(11) DEFAULT NULL,
  `customer_Username` varchar(20) NOT NULL,
  `reservation_number` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(30) DEFAULT NULL,
  `discount` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`reservation_number`),
  KEY `dep_Train_ID` (`dep_Train_ID`,`dep_Transit_line_name`,`dep_Station_ID`),
  KEY `arr_Train_ID` (`arr_Train_ID`,`arr_Transit_line_name`,`arr_Station_ID`),
  KEY `Reservation_ibfk_4` (`customer_Username`),
  KEY `Reservation_ibfk_5` (`assist_representative_SSN`),
  CONSTRAINT `Reservation_ibfk_1` FOREIGN KEY (`dep_Train_ID`, `dep_Transit_line_name`, `dep_Station_ID`) REFERENCES `Stop` (`train_ID`, `transit_line_name`, `station_ID`),
  CONSTRAINT `Reservation_ibfk_2` FOREIGN KEY (`arr_Train_ID`, `arr_Transit_line_name`, `arr_Station_ID`) REFERENCES `Stop` (`train_ID`, `transit_line_name`, `station_ID`),
  CONSTRAINT `Reservation_ibfk_4` FOREIGN KEY (`customer_Username`) REFERENCES `Customer` (`username`) ON DELETE CASCADE,
  CONSTRAINT `Reservation_ibfk_5` FOREIGN KEY (`assist_representative_SSN`) REFERENCES `Customer_representative` (`SSN`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=186 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Reservation`
--

LOCK TABLES `Reservation` WRITE;
/*!40000 ALTER TABLE `Reservation` DISABLE KEYS */;
INSERT INTO `Reservation` VALUES (11,1,'Economy',1,'2020-05-01',1000,'Rutgers line',1,'2020-05-10',1000,'Rutgers line',9,'2020-05-10',243785283,'junyi',142,'One Way','None'),(21,1,'Economy',1,'2020-05-01',1006,'A',1,'2020-05-10',1006,'A',5,'2020-05-10',NULL,'junyi',146,'One Way','None'),(11,1,'Economy',1,'2020-05-01',1000,'Rutgers line',1,'2020-05-01',1000,'Rutgers line',4,'2020-05-01',243785283,'Sky',147,'One Way','None'),(21,1,'Economy',1,'2020-05-01',1006,'A',1,'2020-05-10',1006,'A',5,'2020-05-10',NULL,'junyi',148,'One Way','None'),(121,5,'Economy',1,'2020-05-01',1006,'A',1,'2020-05-01',1006,'A',2,'2020-05-01',243785283,'qw1',150,'Round Trip','Children'),(31,2,'Business',1,'2020-05-01',1000,'Rutgers line',1,'2020-05-01',1000,'Rutgers line',3,'2020-05-01',NULL,'qw1',153,'One Way','None'),(751,5,'First',1,'2020-05-02',1006,'A',2,'2020-05-02',1006,'A',5,'2020-05-02',NULL,'qw1',154,'Round Trip','None'),(21,2,'Economy',1,'2020-05-01',1000,'Rutgers line',1,'2020-05-01',1000,'Rutgers line',9,'2020-05-01',NULL,'LOVEQQ',155,'One Way','None'),(11,1,'Economy',1,'2020-05-01',1000,'Rutgers line',1,'2020-05-01',1000,'Rutgers line',9,'2020-05-01',243785283,'Sky',156,'One Way','None'),(31,3,'Economy',1,'2020-05-01',1000,'Rutgers line',3,'2020-05-05',1000,'Rutgers line',6,'2020-05-05',NULL,'qw2',157,'One Way','None'),(16,3,'Economy',1,'2020-05-01',1000,'Rutgers line',7,'2020-05-07',1000,'Rutgers line',9,'2020-05-07',NULL,'hi',159,'One Way','Children'),(91,2,'First',1,'2020-05-01',1000,'Rutgers line',8,'2020-05-06',1000,'Rutgers line',1,'2020-05-06',243785283,'Qz',160,'Round Trip','None'),(63.4,6,'Business',1,'2020-05-01',1006,'A',2,'2020-05-01',1006,'A',3,'2020-05-01',NULL,'qw2',162,'One Way','Children'),(181,6,'First',1,'2020-05-01',1000,'Rutgers line',4,'2020-05-07',1000,'Rutgers line',9,'2020-05-07',NULL,'hi',163,'One Way','None'),(31,1,'Business',1,'2020-05-01',1007,'LX',5,'2020-05-01',1007,'LX',7,'2020-05-01',NULL,'hi',165,'One Way','None'),(241,1,'Economy',1,'2020-05-01',1000,'Rutgers line',3,'2020-05-01',1000,'Rutgers line',6,'2020-05-01',NULL,'qw3',166,'Monthly Pass','None'),(9,1,'Economy',1,'2020-05-01',1111,'b',1,'2020-05-01',1111,'b',2,'2020-05-01',243785283,'Sky',167,'One Way','None'),(151,3,'Business',1,'2020-05-01',1007,'LX',6,'2020-05-01',1007,'LX',9,'2020-05-01',NULL,'Time2Go',168,'Round Trip','None'),(301,30,'Economy',1,'2020-05-01',1000,'Rutgers line',1,'2020-05-02',1000,'Rutgers line',9,'2020-05-02',NULL,'sam',169,'One Way','None'),(11,1,'Economy',1,'2020-05-01',1000,'Rutgers line',8,'2020-05-01',1000,'Rutgers line',1,'2020-05-01',243785283,'Sky',170,'One Way','None'),(11,1,'Economy',1,'2020-05-01',1000,'Rutgers line',8,'2020-05-01',1000,'Rutgers line',2,'2020-05-01',243785283,'Sky',171,'One Way','None'),(101,10,'Economy',1,'2020-05-02',1000,'Rutgers line',1,'2020-05-02',1000,'Rutgers line',9,'2020-05-02',NULL,'sam',172,'One Way','None'),(901,20,'First',1,'2020-05-02',1000,'Rutgers line',1,'2020-05-02',1000,'Rutgers line',9,'2020-05-02',NULL,'sam',173,'Round Trip','None'),(11,1,'Economy',1,'2020-05-01',1000,'Rutgers line',1,'2020-05-11',1000,'Rutgers line',8,'2020-05-11',NULL,'vick',174,'One Way','None'),(7,1,'Economy',1,'2020-05-01',1001,'short line',1,'2020-05-05',1001,'short line',2,'2020-05-05',243785283,'vick',175,'One Way','None'),(16,1,'Economy',1,'2020-05-01',1005,'Rexl',5,'2020-05-13',1005,'Rexl',6,'2020-05-13',NULL,'vick',176,'One Way','None'),(101,1,'Economy',1,'2020-05-01',1004,'ee',2,'2020-05-01',1004,'ee',3,'2020-05-01',NULL,'qw3',177,'Weekly Pass','None'),(131,10,'Business',1,'2020-05-01',1006,'A',4,'2020-05-09',1006,'A',6,'2020-05-09',NULL,'qw3',178,'One Way','None'),(11,2,'Economy',1,'2020-05-02',1000,'Rutgers line',1,'2020-05-13',1000,'Rutgers line',7,'2020-05-13',243785283,'junyi',180,'One Way','Senior'),(16,1,'Business',1,'2020-05-02',1000,'Rutgers line',1,'2020-05-13',1000,'Rutgers line',3,'2020-05-13',243785283,'junyi',182,'One Way','None'),(8.5,1,'Business',1,'2020-05-02',1000,'Rutgers line',6,'2020-05-13',1000,'Rutgers line',9,'2020-05-13',243785283,'junyi',184,'One Way','Senior');
/*!40000 ALTER TABLE `Reservation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Route`
--

DROP TABLE IF EXISTS `Route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Route` (
  `transit_line_name` varchar(50) NOT NULL,
  `origin_Station_ID` int(11) NOT NULL,
  `destination_Station_ID` int(11) NOT NULL,
  PRIMARY KEY (`transit_line_name`),
  KEY `origin_Station_ID` (`origin_Station_ID`),
  KEY `destination_Station_ID` (`destination_Station_ID`),
  CONSTRAINT `Route_ibfk_1` FOREIGN KEY (`origin_Station_ID`) REFERENCES `Station` (`station_ID`),
  CONSTRAINT `Route_ibfk_2` FOREIGN KEY (`destination_Station_ID`) REFERENCES `Station` (`station_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Route`
--

LOCK TABLES `Route` WRITE;
/*!40000 ALTER TABLE `Route` DISABLE KEYS */;
INSERT INTO `Route` VALUES ('A',1,6),('b',1,4),('ee',2,3),('LX',5,9),('Rexl',3,6),('Rutgers line',1,9),('short line',1,2);
/*!40000 ALTER TABLE `Route` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Site_manager`
--

DROP TABLE IF EXISTS `Site_manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Site_manager` (
  `SSN` int(11) NOT NULL,
  PRIMARY KEY (`SSN`),
  CONSTRAINT `Site_manager_ibfk_1` FOREIGN KEY (`SSN`) REFERENCES `Employee` (`SSN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Site_manager`
--

LOCK TABLES `Site_manager` WRITE;
/*!40000 ALTER TABLE `Site_manager` DISABLE KEYS */;
INSERT INTO `Site_manager` VALUES (123456789);
/*!40000 ALTER TABLE `Site_manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Station`
--

DROP TABLE IF EXISTS `Station`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Station` (
  `station_ID` int(11) NOT NULL,
  `station_name` varchar(50) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  `state` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`station_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Station`
--

LOCK TABLES `Station` WRITE;
/*!40000 ALTER TABLE `Station` DISABLE KEYS */;
INSERT INTO `Station` VALUES (1,'Pennsylvania Station','New york city','New york'),(2,'Secaucus','Secaucus','New jersey'),(3,'Elizabeth','Elizabeth','New jersey'),(4,'Linden','Linden','New jersey'),(5,'Rahway','Rahway','New jersey'),(6,'Menlo Park','Menlo Park','New jersey'),(7,'Metuchen','Metuchen','New jersey'),(8,'Edison','Edison','New jersey'),(9,'New Brunswick','New Brunswick','New jersey');
/*!40000 ALTER TABLE `Station` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Stop`
--

DROP TABLE IF EXISTS `Stop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Stop` (
  `train_ID` int(11) NOT NULL,
  `transit_line_name` varchar(50) NOT NULL,
  `station_ID` int(11) NOT NULL,
  `departure_time` time DEFAULT NULL,
  `arrival_time` time DEFAULT NULL,
  PRIMARY KEY (`train_ID`,`transit_line_name`,`station_ID`),
  KEY `station_ID` (`station_ID`),
  CONSTRAINT `Stop_ibfk_1` FOREIGN KEY (`train_ID`, `transit_line_name`) REFERENCES `Train_schedule` (`train_ID`, `transit_line_name`),
  CONSTRAINT `Stop_ibfk_2` FOREIGN KEY (`station_ID`) REFERENCES `Station` (`station_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Stop`
--

LOCK TABLES `Stop` WRITE;
/*!40000 ALTER TABLE `Stop` DISABLE KEYS */;
INSERT INTO `Stop` VALUES (1000,'Rutgers line',1,'01:46:01','01:40:01'),(1000,'Rutgers line',2,'02:00:01','01:56:01'),(1000,'Rutgers line',3,'02:16:01','02:10:01'),(1000,'Rutgers line',4,'02:31:01','02:25:01'),(1000,'Rutgers line',5,'02:41:01','02:35:01'),(1000,'Rutgers line',6,'02:51:01','02:45:01'),(1000,'Rutgers line',7,'03:05:01','02:55:01'),(1000,'Rutgers line',8,'03:25:01','03:15:01'),(1000,'Rutgers line',9,'03:40:01','03:46:01'),(1001,'short line',1,'03:20:01','03:30:01'),(1001,'short line',2,'03:30:01','03:50:01'),(1004,'ee',2,'13:00:00','13:00:03'),(1004,'ee',3,'14:00:00','14:00:03'),(1005,'Rexl',3,'15:00:10','15:00:20'),(1005,'Rexl',4,'17:00:00','17:00:20'),(1005,'Rexl',5,'18:00:40','18:00:50'),(1005,'Rexl',6,'20:00:31','20:00:45'),(1006,'A',1,'01:00:00','00:50:00'),(1006,'A',2,'01:30:00','01:20:00'),(1006,'A',3,'02:00:00','01:50:00'),(1006,'A',4,'02:30:00','02:20:00'),(1006,'A',5,'03:00:00','02:50:00'),(1006,'A',6,'05:01:00','05:00:00'),(1007,'LX',5,'17:00:00','16:50:00'),(1007,'LX',6,'17:30:00','17:20:00'),(1007,'LX',7,'17:50:00','17:40:00'),(1007,'LX',8,'18:30:00','18:20:00'),(1007,'LX',9,'20:01:00','20:00:00'),(1111,'b',1,'01:00:00','00:55:00'),(1111,'b',2,'01:25:00','01:20:00'),(1111,'b',4,'05:01:00','02:00:00');
/*!40000 ALTER TABLE `Stop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Train`
--

DROP TABLE IF EXISTS `Train`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Train` (
  `train_ID` int(11) NOT NULL,
  `total_number_of_car` int(11) DEFAULT NULL,
  `total_number_of_seats` int(11) DEFAULT NULL,
  PRIMARY KEY (`train_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Train`
--

LOCK TABLES `Train` WRITE;
/*!40000 ALTER TABLE `Train` DISABLE KEYS */;
INSERT INTO `Train` VALUES (1000,5,130),(1001,6,195),(1002,4,500),(1003,5,700),(1004,5,690),(1005,10,1403),(1006,10,1400),(1007,10,1500),(1008,5,700),(1009,8,1000),(1010,9,1200),(1111,1,995);
/*!40000 ALTER TABLE `Train` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Train_schedule`
--

DROP TABLE IF EXISTS `Train_schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Train_schedule` (
  `train_ID` int(11) NOT NULL,
  `transit_line_name` varchar(50) NOT NULL,
  `available_number_of_seats` int(11) DEFAULT NULL,
  `number_of_stops` int(11) DEFAULT NULL,
  `departure_time` time DEFAULT NULL,
  `arrival_time` time DEFAULT NULL,
  `travel_time` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`train_ID`,`transit_line_name`),
  KEY `transit_line_name` (`transit_line_name`),
  CONSTRAINT `Train_schedule_ibfk_1` FOREIGN KEY (`train_ID`) REFERENCES `Train` (`train_ID`),
  CONSTRAINT `Train_schedule_ibfk_2` FOREIGN KEY (`transit_line_name`) REFERENCES `Route` (`transit_line_name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Train_schedule`
--

LOCK TABLES `Train_schedule` WRITE;
/*!40000 ALTER TABLE `Train_schedule` DISABLE KEYS */;
INSERT INTO `Train_schedule` VALUES (1000,'Rutgers line',200,9,'02:00:00','10:10:00','8:10'),(1001,'short line',200,2,'03:30:01','03:50:01','0:20'),(1004,'ee',699,2,'01:00:00','03:00:00','2:00'),(1005,'Rexl',1400,4,'15:00:00','20:00:00','5:00'),(1006,'A',300,6,'01:00:00','05:00:00','4:00'),(1007,'LX',300,5,'17:00:00','20:00:00','3:00'),(1111,'b',333,3,'01:00:00','06:00:00','5:00');
/*!40000 ALTER TABLE `Train_schedule` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-02  1:31:45

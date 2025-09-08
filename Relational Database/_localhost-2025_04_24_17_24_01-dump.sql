-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: relational database
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `port`
--

DROP TABLE IF EXISTS `port`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `port` (
  `PortID` int NOT NULL AUTO_INCREMENT,
  `Pname` varchar(100) NOT NULL,
  PRIMARY KEY (`PortID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `port`
--

LOCK TABLES `port` WRITE;
/*!40000 ALTER TABLE `port` DISABLE KEYS */;
/*!40000 ALTER TABLE `port` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `port_sea`
--

DROP TABLE IF EXISTS `port_sea`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `port_sea` (
  `PortID` int NOT NULL,
  `SeaOceanLakeID` int NOT NULL,
  PRIMARY KEY (`PortID`,`SeaOceanLakeID`),
  KEY `SeaOceanLakeID` (`SeaOceanLakeID`),
  CONSTRAINT `port_sea_ibfk_1` FOREIGN KEY (`PortID`) REFERENCES `port` (`PortID`),
  CONSTRAINT `port_sea_ibfk_2` FOREIGN KEY (`SeaOceanLakeID`) REFERENCES `sea_ocean_lake` (`SeaOceanLakeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `port_sea`
--

LOCK TABLES `port_sea` WRITE;
/*!40000 ALTER TABLE `port_sea` DISABLE KEYS */;
/*!40000 ALTER TABLE `port_sea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `port_state`
--

DROP TABLE IF EXISTS `port_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `port_state` (
  `PortID` int NOT NULL,
  `StateCountryID` int NOT NULL,
  PRIMARY KEY (`PortID`,`StateCountryID`),
  KEY `StateCountryID` (`StateCountryID`),
  CONSTRAINT `port_state_ibfk_1` FOREIGN KEY (`PortID`) REFERENCES `port` (`PortID`),
  CONSTRAINT `port_state_ibfk_2` FOREIGN KEY (`StateCountryID`) REFERENCES `state_country` (`StateCountryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `port_state`
--

LOCK TABLES `port_state` WRITE;
/*!40000 ALTER TABLE `port_state` DISABLE KEYS */;
/*!40000 ALTER TABLE `port_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `port_visit`
--

DROP TABLE IF EXISTS `port_visit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `port_visit` (
  `PortVisitID` int NOT NULL AUTO_INCREMENT,
  `ShipID` int NOT NULL,
  `PortID` int NOT NULL,
  `Start_date` date NOT NULL,
  `End_date` date DEFAULT NULL,
  PRIMARY KEY (`PortVisitID`),
  KEY `ShipID` (`ShipID`),
  KEY `PortID` (`PortID`),
  CONSTRAINT `port_visit_ibfk_1` FOREIGN KEY (`ShipID`) REFERENCES `ship` (`ShipID`),
  CONSTRAINT `port_visit_ibfk_2` FOREIGN KEY (`PortID`) REFERENCES `port` (`PortID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `port_visit`
--

LOCK TABLES `port_visit` WRITE;
/*!40000 ALTER TABLE `port_visit` DISABLE KEYS */;
/*!40000 ALTER TABLE `port_visit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sea_ocean_lake`
--

DROP TABLE IF EXISTS `sea_ocean_lake`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sea_ocean_lake` (
  `SeaOceanLakeID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  PRIMARY KEY (`SeaOceanLakeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sea_ocean_lake`
--

LOCK TABLES `sea_ocean_lake` WRITE;
/*!40000 ALTER TABLE `sea_ocean_lake` DISABLE KEYS */;
/*!40000 ALTER TABLE `sea_ocean_lake` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ship`
--

DROP TABLE IF EXISTS `ship`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ship` (
  `ShipID` int NOT NULL AUTO_INCREMENT,
  `Sname` varchar(100) NOT NULL,
  `Owner` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ShipID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ship`
--

LOCK TABLES `ship` WRITE;
/*!40000 ALTER TABLE `ship` DISABLE KEYS */;
/*!40000 ALTER TABLE `ship` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ship_home_port`
--

DROP TABLE IF EXISTS `ship_home_port`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ship_home_port` (
  `ShipID` int NOT NULL,
  `HomePortID` int NOT NULL,
  PRIMARY KEY (`ShipID`),
  KEY `HomePortID` (`HomePortID`),
  CONSTRAINT `ship_home_port_ibfk_1` FOREIGN KEY (`ShipID`) REFERENCES `ship` (`ShipID`),
  CONSTRAINT `ship_home_port_ibfk_2` FOREIGN KEY (`HomePortID`) REFERENCES `port` (`PortID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ship_home_port`
--

LOCK TABLES `ship_home_port` WRITE;
/*!40000 ALTER TABLE `ship_home_port` DISABLE KEYS */;
/*!40000 ALTER TABLE `ship_home_port` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ship_movement`
--

DROP TABLE IF EXISTS `ship_movement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ship_movement` (
  `MovementID` int NOT NULL AUTO_INCREMENT,
  `ShipID` int NOT NULL,
  `Latitude` decimal(9,6) NOT NULL,
  `Longitude` decimal(9,6) NOT NULL,
  `Time_stamp` timestamp NOT NULL,
  `Date` date DEFAULT NULL,
  `Time` time DEFAULT NULL,
  PRIMARY KEY (`MovementID`),
  KEY `ShipID` (`ShipID`),
  CONSTRAINT `ship_movement_ibfk_1` FOREIGN KEY (`ShipID`) REFERENCES `ship` (`ShipID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ship_movement`
--

LOCK TABLES `ship_movement` WRITE;
/*!40000 ALTER TABLE `ship_movement` DISABLE KEYS */;
/*!40000 ALTER TABLE `ship_movement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ship_ship_type`
--

DROP TABLE IF EXISTS `ship_ship_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ship_ship_type` (
  `ShipID` int NOT NULL,
  `ShipTypeID` int NOT NULL,
  PRIMARY KEY (`ShipID`),
  KEY `ShipTypeID` (`ShipTypeID`),
  CONSTRAINT `ship_ship_type_ibfk_1` FOREIGN KEY (`ShipID`) REFERENCES `ship` (`ShipID`),
  CONSTRAINT `ship_ship_type_ibfk_2` FOREIGN KEY (`ShipTypeID`) REFERENCES `ship_type` (`ShipTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ship_ship_type`
--

LOCK TABLES `ship_ship_type` WRITE;
/*!40000 ALTER TABLE `ship_ship_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `ship_ship_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ship_type`
--

DROP TABLE IF EXISTS `ship_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ship_type` (
  `ShipTypeID` int NOT NULL AUTO_INCREMENT,
  `Type` varchar(50) NOT NULL,
  `Tonnage` int DEFAULT NULL,
  `Hull` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ShipTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ship_type`
--

LOCK TABLES `ship_type` WRITE;
/*!40000 ALTER TABLE `ship_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `ship_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `state_country`
--

DROP TABLE IF EXISTS `state_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `state_country` (
  `StateCountryID` int NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  `Continent` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`StateCountryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `state_country`
--

LOCK TABLES `state_country` WRITE;
/*!40000 ALTER TABLE `state_country` DISABLE KEYS */;
/*!40000 ALTER TABLE `state_country` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-24 17:24:02

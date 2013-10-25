-- MySQL dump 10.13  Distrib 5.6.7-rc, for osx10.6 (i386)
--
-- Host: localhost    Database: tbu
-- ------------------------------------------------------
-- Server version	5.6.7-rc

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Addd`
--

DROP TABLE IF EXISTS `Addd`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Addd` (
  `FID` int(11) DEFAULT NULL,
  `DID` int(11) DEFAULT NULL,
  KEY `FID` (`FID`),
  KEY `DID` (`DID`),
  CONSTRAINT `addd_ibfk_1` FOREIGN KEY (`FID`) REFERENCES `Faculty` (`FID`),
  CONSTRAINT `addd_ibfk_2` FOREIGN KEY (`DID`) REFERENCES `Departments` (`DID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Addd`
--

LOCK TABLES `Addd` WRITE;
/*!40000 ALTER TABLE `Addd` DISABLE KEYS */;
/*!40000 ALTER TABLE `Addd` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Assignment`
--

DROP TABLE IF EXISTS `Assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Assignment` (
  `AID` int(11) NOT NULL DEFAULT '0',
  `Description` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`AID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Assignment`
--

LOCK TABLES `Assignment` WRITE;
/*!40000 ALTER TABLE `Assignment` DISABLE KEYS */;
/*!40000 ALTER TABLE `Assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Departments`
--

DROP TABLE IF EXISTS `Departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Departments` (
  `DID` int(11) NOT NULL,
  `DName` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`DID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Departments`
--

LOCK TABLES `Departments` WRITE;
/*!40000 ALTER TABLE `Departments` DISABLE KEYS */;
/*!40000 ALTER TABLE `Departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Do`
--

DROP TABLE IF EXISTS `Do`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Do` (
  `AID` int(11) DEFAULT NULL,
  `SID` int(11) DEFAULT NULL,
  `grade` int(11) DEFAULT NULL,
  KEY `AID` (`AID`),
  KEY `SID` (`SID`),
  CONSTRAINT `do_ibfk_1` FOREIGN KEY (`AID`) REFERENCES `Assignment` (`AID`),
  CONSTRAINT `do_ibfk_2` FOREIGN KEY (`SID`) REFERENCES `Students` (`SID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Do`
--

LOCK TABLES `Do` WRITE;
/*!40000 ALTER TABLE `Do` DISABLE KEYS */;
/*!40000 ALTER TABLE `Do` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Employs`
--

DROP TABLE IF EXISTS `Employs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Employs` (
  `FID` int(11) DEFAULT NULL,
  `DID` int(11) DEFAULT NULL,
  KEY `FID` (`FID`),
  KEY `DID` (`DID`),
  CONSTRAINT `employs_ibfk_1` FOREIGN KEY (`FID`) REFERENCES `Faculty` (`FID`),
  CONSTRAINT `employs_ibfk_2` FOREIGN KEY (`DID`) REFERENCES `Departments` (`DID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Employs`
--

LOCK TABLES `Employs` WRITE;
/*!40000 ALTER TABLE `Employs` DISABLE KEYS */;
/*!40000 ALTER TABLE `Employs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Enrolled`
--

DROP TABLE IF EXISTS `Enrolled`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Enrolled` (
  `SID` int(11) DEFAULT NULL,
  `DID` int(11) DEFAULT NULL,
  KEY `SID` (`SID`),
  KEY `DID` (`DID`),
  CONSTRAINT `enrolled_ibfk_1` FOREIGN KEY (`SID`) REFERENCES `Students` (`SID`),
  CONSTRAINT `enrolled_ibfk_2` FOREIGN KEY (`DID`) REFERENCES `Departments` (`DID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Enrolled`
--

LOCK TABLES `Enrolled` WRITE;
/*!40000 ALTER TABLE `Enrolled` DISABLE KEYS */;
/*!40000 ALTER TABLE `Enrolled` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Faculty`
--

DROP TABLE IF EXISTS `Faculty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Faculty` (
  `FID` int(11) NOT NULL,
  `Name` varchar(20) DEFAULT NULL,
  `Address` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`FID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Faculty`
--

LOCK TABLES `Faculty` WRITE;
/*!40000 ALTER TABLE `Faculty` DISABLE KEYS */;
INSERT INTO `Faculty` VALUES (1,'Prof Hill',NULL),(2,'Prof Under',NULL),(3,'Prof Tree',NULL),(4,'Prof Logic',NULL),(5,'Prof Word',NULL),(6,'Prof Number',NULL),(7,'Prof Moore',NULL);
/*!40000 ALTER TABLE `Faculty` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Register`
--

DROP TABLE IF EXISTS `Register`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Register` (
  `SID` int(11) DEFAULT NULL,
  `CID` int(11) DEFAULT NULL,
  `Section` varchar(4) DEFAULT NULL,
  `Year` int(11) DEFAULT NULL,
  `FinalGrade` varchar(1) DEFAULT NULL,
  KEY `SID` (`SID`),
  KEY `CID` (`CID`,`Section`,`Year`),
  CONSTRAINT `register_ibfk_1` FOREIGN KEY (`SID`) REFERENCES `Students` (`SID`),
  CONSTRAINT `register_ibfk_2` FOREIGN KEY (`CID`, `Section`, `Year`) REFERENCES `Offering` (`CID`, `Section`, `Year`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Register`
--

LOCK TABLES `Register` WRITE;
/*!40000 ALTER TABLE `Register` DISABLE KEYS */;
INSERT INTO `Register` VALUES (10202,1000,'0C01',2011,'C'),(10303,1000,'0C02',2011,'F'),(10606,1000,'0C02',2011,'A'),(10707,1000,'0C02',2011,'B'),(10909,1000,'0C03',2011,'B'),(10404,1000,'0C01',2012,'A'),(10303,1000,'0C01',2012,'C'),(10505,1000,'1C01',2012,'B'),(10606,2000,'2C01',2011,'A'),(10707,2000,'2C01',2011,'A'),(10808,2000,'2C01',2011,'A'),(10303,2000,'2C01',2011,'B'),(10101,2000,'0C01',2012,'A'),(10202,2000,'0C01',2012,'B'),(10909,2000,'0C01',2012,'B'),(10101,3000,'0C01',2012,'A'),(10202,3000,'0C01',2012,'C'),(10303,3000,'0C02',2012,'B'),(10606,3000,'0C02',2012,'A'),(10707,3000,'0C02',2012,'A'),(10101,4000,'0C01',2012,'A'),(10202,4000,'0C01',2012,'C'),(10909,4000,'0C01',2012,'B'),(10606,5000,'2C01',2011,'A'),(10707,5000,'2C01',2011,'B'),(10808,5000,'2C01',2011,'A'),(10909,5000,'2C01',2011,'B'),(10606,5100,'0C01',2012,'A'),(10707,5100,'0C01',2012,'B'),(10808,5100,'0C01',2012,'A'),(10606,5200,'1C01',2012,'A'),(10707,5200,'1C01',2012,'B'),(10606,5300,'2C01',2011,'A'),(10707,5300,'2C01',2011,'B'),(10808,5300,'0C01',2012,'A'),(10909,5300,'0C01',2012,'B'),(10606,5400,'1C01',2012,'A'),(10707,5400,'1C01',2012,'B'),(10808,5400,'0C01',2012,'A'),(10909,5400,'0C01',2012,'B'),(10101,1000,'0C01',2011,'A'),(10808,1000,'0C03',2011,'A'),(10909,5400,'2C01',2012,NULL),(10707,5100,'2C01',2012,NULL),(10808,5100,'2C01',2012,NULL);
/*!40000 ALTER TABLE `Register` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger iRegisterCheck before insert on register
for each row
begin
	call CheckGrade(new.FinalGrade);
	call CheckMaxEnroll(new.CID, new.Year, new.Section);
	call CheckRepeatRegister(new.SID, new.CID, new.Year, new.Section);
	call PrerequisitesCheck(new.CID, new.SID);
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger uRegisterCheck before update on register
for each row
begin
	call CheckGrade(new.FinalGrade);
	call CheckMaxEnroll(new.CID, new.Year, new.Section);
	call CheckRepeatRegister(new.SID, new.CID, new.Year, new.Section);
	call PrerequisitesCheck(new.CID, new.SID);
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger DRegisterCheck before delete on register
for each row
begin
	call IsthereGrade(old.CID, old.Year, old.Section);
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses` (
  `CID` int(11) NOT NULL,
  `CName` varchar(20) DEFAULT NULL,
  `IsGraduate` tinyint(1) DEFAULT NULL,
  `Prerequisite1` int(11) DEFAULT NULL,
  `Prerequisite2` int(11) DEFAULT NULL,
  `Prerequisite3` int(11) DEFAULT NULL,
  PRIMARY KEY (`CID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `courses`
--

LOCK TABLES `courses` WRITE;
/*!40000 ALTER TABLE `courses` DISABLE KEYS */;
INSERT INTO `courses` VALUES (1000,'Introduction to Comp',0,NULL,NULL,NULL),(2000,'Data Structures',0,1000,NULL,NULL),(3000,'Digitial Logic',0,2000,NULL,NULL),(4000,'Graphical User Inter',0,1000,NULL,NULL),(5000,'Formal Language Theo',1,NULL,NULL,NULL),(5100,'Compiler Constructio',1,5000,NULL,NULL),(5200,'Algorithm',1,NULL,NULL,NULL),(5300,'Networking',1,NULL,NULL,NULL),(5400,'Databases',1,1000,5300,NULL);
/*!40000 ALTER TABLE `courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instruct`
--

DROP TABLE IF EXISTS `instruct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `instruct` (
  `FID` int(11) DEFAULT NULL,
  `CID` int(11) DEFAULT NULL,
  `Section` varchar(4) DEFAULT NULL,
  `Year` int(11) DEFAULT NULL,
  KEY `FID` (`FID`),
  KEY `CID` (`CID`,`Section`,`Year`),
  CONSTRAINT `instruct_ibfk_1` FOREIGN KEY (`FID`) REFERENCES `faculty` (`FID`),
  CONSTRAINT `instruct_ibfk_2` FOREIGN KEY (`CID`, `Section`, `Year`) REFERENCES `offering` (`CID`, `Section`, `Year`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instruct`
--

LOCK TABLES `instruct` WRITE;
/*!40000 ALTER TABLE `instruct` DISABLE KEYS */;
INSERT INTO `instruct` VALUES (1,1000,'0C01',2011),(1,1000,'0C02',2011),(1,1000,'0C03',2011),(1,1000,'0C01',2012),(1,1000,'1C01',2012),(1,1000,'2C01',2012),(2,2000,'2C01',2011),(2,2000,'0C01',2012),(3,2000,'2C01',2011),(3,2000,'0C01',2012),(3,2000,'2C01',2012),(4,3000,'0C01',2012),(4,3000,'0C02',2012),(3,4000,'0C01',2012),(5,5000,'2C01',2011),(5,5100,'0C01',2012),(6,5200,'1C01',2012),(6,5300,'2C01',2011),(6,5300,'0C01',2012),(7,5400,'1C01',2012),(7,5400,'0C01',2012),(7,5400,'2C01',2012),(7,5300,'0C01',2012),(5,5100,'2C01',2012),(NULL,5000,'2C01',2012),(6,5100,'2C01',2012);
/*!40000 ALTER TABLE `instruct` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger DatLeastOne_Course before Delete on Instruct
for each row
begin
	CALL AtLeastOneCourse(OLD.FID);
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `offering`
--

DROP TABLE IF EXISTS `offering`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `offering` (
  `CID` int(11) NOT NULL DEFAULT '0',
  `Section` varchar(4) NOT NULL DEFAULT '',
  `Year` int(11) NOT NULL DEFAULT '0',
  `MaxEnroll` int(11) DEFAULT NULL,
  PRIMARY KEY (`CID`,`Section`,`Year`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offering`
--

LOCK TABLES `offering` WRITE;
/*!40000 ALTER TABLE `offering` DISABLE KEYS */;
INSERT INTO `offering` VALUES (1000,'0C01',2011,2),(1000,'0C01',2012,2),(1000,'0C02',2011,3),(1000,'0C03',2011,5),(1000,'1C01',2012,2),(1000,'2C01',2012,3),(2000,'0C01',2012,3),(2000,'2C01',2011,4),(2000,'2C01',2012,3),(3000,'0C01',2012,4),(3000,'0C02',2012,5),(4000,'0C01',2012,3),(5000,'2C01',2011,5),(5000,'2C01',2012,2),(5100,'0C01',2012,3),(5100,'2C01',2012,2),(5200,'1C01',2012,2),(5300,'0C01',2012,2),(5300,'2C01',2011,2),(5400,'0C01',2012,2),(5400,'1C01',2012,2),(5400,'2C01',2012,3);
/*!40000 ALTER TABLE `offering` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `q4`
--

DROP TABLE IF EXISTS `q4`;
/*!50001 DROP VIEW IF EXISTS `q4`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `q4` (
  `cid` tinyint NOT NULL,
  `scount` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `q5`
--

DROP TABLE IF EXISTS `q5`;
/*!50001 DROP VIEW IF EXISTS `q5`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `q5` (
  `cid` tinyint NOT NULL,
  `Isgraduate` tinyint NOT NULL,
  `scount` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `q6`
--

DROP TABLE IF EXISTS `q6`;
/*!50001 DROP VIEW IF EXISTS `q6`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `q6` (
  `cid` tinyint NOT NULL,
  `Isgraduate` tinyint NOT NULL,
  `scount` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `semester`
--

DROP TABLE IF EXISTS `semester`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `semester` (
  `ID` int(11) NOT NULL,
  `season` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `semester`
--

LOCK TABLES `semester` WRITE;
/*!40000 ALTER TABLE `semester` DISABLE KEYS */;
INSERT INTO `semester` VALUES (0,'spring'),(1,'summer'),(2,'fall');
/*!40000 ALTER TABLE `semester` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `students` (
  `SID` int(11) NOT NULL,
  `SName` varchar(20) DEFAULT NULL,
  `Address` varchar(30) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`SID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (10101,'Joe1','Some Dorm room 123','undergraduate'),(10202,'Jill1','Some Dorm room 234','undergraduate'),(10303,'John1','Some Dorm room 345','undergraduate'),(10404,'Sam1','off campus apartment 14','undergraduate'),(10505,'Sally1','off campus apartment 28','undergraduate'),(10515,'Pete1','Some Dorm room 567','undergraduate'),(10606,'Joe2','off campus apartment 42','graduate'),(10707,'Jill2','Local housing 55','graduate'),(10808,'John2','Some Dorm room 456','graduate'),(10909,'Sam2','Local housing 88','graduate'),(11000,'Sally2',NULL,'graduate');
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `q4`
--

/*!50001 DROP TABLE IF EXISTS `q4`*/;
/*!50001 DROP VIEW IF EXISTS `q4`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `q4` AS select `i`.`CID` AS `cid`,count(distinct `i`.`SID`) AS `scount` from (`register` `i` join `offering` on(((`i`.`CID` = `offering`.`CID`) and (`i`.`Section` = `offering`.`Section`) and (`i`.`Year` = `offering`.`Year`)))) group by `i`.`CID` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `q5`
--

/*!50001 DROP TABLE IF EXISTS `q5`*/;
/*!50001 DROP VIEW IF EXISTS `q5`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `q5` AS select `courses`.`CID` AS `cid`,`courses`.`IsGraduate` AS `Isgraduate`,`q4`.`scount` AS `scount` from (`courses` join `q4` on((`courses`.`CID` = `q4`.`cid`))) where (`courses`.`IsGraduate` = 0) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `q6`
--

/*!50001 DROP TABLE IF EXISTS `q6`*/;
/*!50001 DROP VIEW IF EXISTS `q6`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `q6` AS select `courses`.`CID` AS `cid`,`courses`.`IsGraduate` AS `Isgraduate`,`q4`.`scount` AS `scount` from (`courses` join `q4` on((`courses`.`CID` = `q4`.`cid`))) where (`courses`.`IsGraduate` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-12-11 20:26:42

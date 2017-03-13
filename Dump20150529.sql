CREATE DATABASE  IF NOT EXISTS `softwaredata` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `softwaredata`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win32 (x86)
--
-- Host: john-server    Database: softwaredata
-- ------------------------------------------------------
-- Server version	5.6.23-log

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
-- Table structure for table `anatomicallocation`
--

DROP TABLE IF EXISTS `anatomicallocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `anatomicallocation` (
  `AnatomicalLocationID` smallint(5) NOT NULL AUTO_INCREMENT,
  `LocationName` varchar(100) NOT NULL,
  PRIMARY KEY (`AnatomicalLocationID`),
  UNIQUE KEY `Anatomical Location ID_UNIQUE` (`AnatomicalLocationID`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anatomicallocation`
--

LOCK TABLES `anatomicallocation` WRITE;
/*!40000 ALTER TABLE `anatomicallocation` DISABLE KEYS */;
INSERT INTO `anatomicallocation` VALUES (1,'Head'),(2,'Neck'),(3,'Ant.trunk'),(4,'Post.trunk'),(5,'R.buttock'),(6,'L.buttock'),(7,'Genitalia'),(8,'R.U.arm'),(9,'L.U.arm'),(10,'R.L.arm'),(11,'L.L.arm'),(12,'R.hand'),(13,'L.hand'),(14,'R.thigh'),(15,'L.thigh'),(16,'R.leg'),(17,'L.leg'),(18,'R.foot'),(19,'L.foot'),(20,'Back_Burn1'),(21,'Back_Burn2'),(22,'Back_Burn3'),(23,'Back_Burn4'),(24,'Back_Burn5'),(25,'Back_Burn6');
/*!40000 ALTER TABLE `anatomicallocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `images`
--

DROP TABLE IF EXISTS `images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `images` (
  `IMFILEID` int(11) NOT NULL,
  `IMCOLLID` int(11) DEFAULT NULL,
  `ImageFileName` varchar(100) NOT NULL,
  `ImageType` tinyint(4) DEFAULT NULL,
  `NumImagesInFile` smallint(5) DEFAULT NULL,
  `FileSeqOrder` smallint(5) DEFAULT NULL COMMENT 'Sequential order among all other files for this series instance',
  `CreateDateTime` bigint(20) DEFAULT NULL,
  `LastUpdate` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`IMFILEID`,`ImageFileName`),
  KEY `fk_IMCOLLID_idx` (`IMCOLLID`),
  CONSTRAINT `fk_IMCOLLID` FOREIGN KEY (`IMCOLLID`) REFERENCES `imagescollection` (`IMCOLLID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `images`
--

LOCK TABLES `images` WRITE;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
/*!40000 ALTER TABLE `images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagescollection`
--

DROP TABLE IF EXISTS `imagescollection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagescollection` (
  `IMCOLLID` int(11) NOT NULL,
  `SERID` varchar(60) NOT NULL,
  `SeriesInstanceUID` varchar(45) DEFAULT NULL,
  `ImageCollFolderName` varchar(100) DEFAULT NULL,
  `XDimension` smallint(5) DEFAULT NULL,
  `YDimension` smallint(5) DEFAULT NULL,
  `QualityStatus` tinyint(4) DEFAULT NULL,
  `CreateDateTime` bigint(20) DEFAULT NULL,
  `LastUpdate` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`IMCOLLID`),
  KEY `fk_SERID_idx` (`SERID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagescollection`
--

LOCK TABLES `imagescollection` WRITE;
/*!40000 ALTER TABLE `imagescollection` DISABLE KEYS */;
/*!40000 ALTER TABLE `imagescollection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient`
--

DROP TABLE IF EXISTS `patient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient` (
  `PID` varchar(60) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Identified` smallint(1) DEFAULT NULL,
  `Height` float DEFAULT NULL,
  `Weight` float DEFAULT NULL,
  `Birthday` varchar(50) DEFAULT NULL,
  `Sex` varchar(10) DEFAULT NULL,
  `TypeofPID` varchar(45) DEFAULT NULL,
  `PatientIdentityRemoved` varchar(20) DEFAULT NULL,
  `DeidentificationMethod` varchar(45) DEFAULT NULL,
  `DeidentificationMethodCodeSequence` varchar(45) DEFAULT NULL,
  `LastUpdate` bigint(20) DEFAULT NULL,
  `CreateDateTime` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`PID`),
  UNIQUE KEY `PID_UNIQUE` (`PID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient`
--

LOCK TABLES `patient` WRITE;
/*!40000 ALTER TABLE `patient` DISABLE KEYS */;
INSERT INTO `patient` VALUES ('1','John','Doe',0,5.5,50,'01/01/2010','Female','TEXT','','','',130711774569772230,130711774569672230),('10','John123','Doe',0,5.5,50,'11/01/2009','Female','TEXT','','','',130728059435988098,130728059435888098),('11','John','Doe',0,5.5,50,'01/01/2010','Female','TEXT','','','',130728278092796960,130728278092796960),('12','weeee','faaaaaa',1,5.9,120,'01/01/2010','male','TEXT','','','',130729164198789513,130729164198769512),('13','2345','Doe',1,6.3,120,'01/01/2010','FMALE','TEXT','','','',130729201079508970,130729201079498969),('14','John','Doe',0,6,110,'01/01/2010','MALE','TEXT','','','',130729204767709923,130729204767689922),('15','John','Doe',0,4.5,678,'01/01/2010','femal','TEXT','','','',130730798310178067,130730798310178067),('16','John','Doe',1,5.3,89,'01/01/2010','male','TEXT','','','',130732775814752333,130732775814752333),('17','John','Doe',0,5.5,60,'01/01/2010','Male','TEXT','','','',130734214744503097,130734214744503097),('18','John','Doe',0,5.5,60,'01/01/2010','Male','TEXT','','','',130735143744731311,130735143744731311),('19','John','Doe',0,5.5,60,'01/01/2010','Male','TEXT','','','',130736950384777473,130736950384777473),('2','lyly','Doe',0,5.5,50,'11/01/2009','Female','TEXT','','','',130711914615330029,130711914615230029),('20','John','Doe',0,5.5,60,'01/01/2010','Male','TEXT','','','',130737078362419535,130737078362419535),('21','John','Doe',0,5.5,60,'01/01/2010','Male','TEXT','','','',130737078919200319,130737078919200319),('22','John','Doe',0,5.5,60,'01/01/2010','Male','TEXT','','','',130737486122112881,130737486122112881),('23','John','Doe',0,5.6,80,'01/01/2010','male','TEXT','','','',130737868001471695,130737868001461694),('24','John','Doe',0,5.6,80,'01/01/2010','male','TEXT','','','',130737881085170039,130737881085160039),('25','John','Doe',0,5.6,80,'01/01/2010','male','TEXT','','','',130747328320058202,130747328320048202),('26','Yuzhi','Wu',NULL,NULL,NULL,'09/06/1990','Male',NULL,NULL,NULL,NULL,NULL,NULL),('3','good','Doe',1,5.5,50,'11/01/2009','male','TEXT','','','',130711964886729208,130711964886729208),('37450222','yamin','li',NULL,NULL,NULL,'01/01/2015','Male',NULL,NULL,NULL,NULL,NULL,NULL),('4','Jane','Doe',0,6.7,100,'02/15/2011','Female','TEXT','','','',130712707572418944,130712707572418944),('5','John','Doe',0,5.5,50,'01/01/2010','Female','TEXT','','','',130723932444667983,130723932444647982),('6','JANE','Doe',0,6.5,50,'01/01/2010','Female','TEXT','','','',130723946669880657,130723946669780657),('7','John','Doe',0,5.5,50,'01/01/2010','Female','TEXT','','','',130724602472609965,130724602472609965),('8','John','Doe',0,5.5,50,'01/01/2010','Female','TEXT','','','',130725716374557857,130725716374557857),('9','wenwen','dou',1,6.5,100,'08/02/2012','Male','TEXT','','','',130725724405317950,130725724405317950);
/*!40000 ALTER TABLE `patient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `patientlist`
--

DROP TABLE IF EXISTS `patientlist`;
/*!50001 DROP VIEW IF EXISTS `patientlist`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `patientlist` (
  `PatientID` tinyint NOT NULL,
  `FirstName` tinyint NOT NULL,
  `LastName` tinyint NOT NULL,
  `Birthday` tinyint NOT NULL,
  `Sex` tinyint NOT NULL,
  `Anatomical Locatioin` tinyint NOT NULL,
  `Study ID` tinyint NOT NULL,
  `Study Instance UID` tinyint NOT NULL,
  `Series ID` tinyint NOT NULL,
  `Series Instance UID` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `series`
--

DROP TABLE IF EXISTS `series`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `series` (
  `SERID` varchar(60) NOT NULL,
  `SID` varchar(60) NOT NULL,
  `Modality` varchar(45) DEFAULT NULL,
  `SeriesInstanceUID` varchar(45) DEFAULT NULL,
  `SeriesNumber` varchar(45) DEFAULT NULL,
  `AnatomicalLocationID` smallint(5) NOT NULL,
  `LastUpdate` bigint(20) DEFAULT NULL,
  `CreateDateTime` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`SERID`),
  UNIQUE KEY `SERID_UNIQUE` (`SERID`),
  KEY `fk_StudyID_idx` (`SID`),
  KEY `fk_AnatomicalLocationID_idx` (`AnatomicalLocationID`),
  CONSTRAINT `fk_AnatomicalLocationID` FOREIGN KEY (`AnatomicalLocationID`) REFERENCES `anatomicallocation` (`AnatomicalLocationID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `series`
--

LOCK TABLES `series` WRITE;
/*!40000 ALTER TABLE `series` DISABLE KEYS */;
INSERT INTO `series` VALUES ('007','007',NULL,NULL,NULL,20,NULL,NULL),('1','1','DeepView','','',1,130719523111193351,130719523111193351),('10','8','DeepView Gen2','','',1,130737882168652011,130737882168662012),('11','9','DeepView Gen2','','',1,130737891030638888,130737891030638888),('12','10',NULL,NULL,NULL,2,NULL,NULL),('13','11',NULL,NULL,NULL,4,NULL,NULL),('14','12',NULL,NULL,NULL,3,NULL,NULL),('15','13',NULL,NULL,NULL,15,NULL,NULL),('16','15',NULL,NULL,NULL,8,NULL,NULL),('17','16',NULL,NULL,NULL,7,NULL,NULL),('18','17',NULL,NULL,NULL,9,NULL,NULL),('19','18',NULL,NULL,NULL,10,NULL,NULL),('2','2','Gen2 DeepView','','',1,130719533335280884,130719533335280884),('20','60',NULL,NULL,NULL,19,NULL,NULL),('21','20',NULL,NULL,NULL,24,NULL,NULL),('22','19',NULL,NULL,NULL,16,NULL,NULL),('23','14',NULL,NULL,NULL,6,NULL,NULL),('3','3','Gen2DeepView','','',1,130719596623253096,130719596623233094),('4','4','DeepView333','3333','',1,130723938332807807,130723938332807807),('5','5','DeepView Gen2','','',1,130737078391219575,130737078391219575),('6','6','DeepView Gen2','','',1,130737078946600357,130737078946600357),('7','44','DeepView Gen2','','',1,130737486152812924,130737486152812924),('8','46','DeepView Gen2','','',1,130737881203006779,130737881203016780),('9','7','DeepView Gen2','','',1,130737881417359040,130737881417359040);
/*!40000 ALTER TABLE `series` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `study`
--

DROP TABLE IF EXISTS `study`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `study` (
  `SID` varchar(60) NOT NULL,
  `PID` varchar(60) NOT NULL,
  `StudyInstanceUID` mediumint(9) DEFAULT NULL,
  `AccessionNumber` varchar(45) DEFAULT NULL,
  `ClinicianFirstName` varchar(50) DEFAULT NULL,
  `ClinicianLastName` varchar(50) DEFAULT NULL,
  `ProcessedStatus` tinyint(1) DEFAULT NULL,
  `DiagnosticLog` varchar(2000) DEFAULT NULL,
  `LastUpdate` bigint(20) DEFAULT NULL,
  `CreateDatetime` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`SID`,`PID`),
  UNIQUE KEY `SID_UNIQUE` (`SID`),
  KEY `fk_PatientID_idx` (`PID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `study`
--

LOCK TABLES `study` WRITE;
/*!40000 ALTER TABLE `study` DISABLE KEYS */;
INSERT INTO `study` VALUES ('001','200811907',2,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('007','37450222',7,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('1','1',1,'test','Jane','Doe',0,'',130718765388648465,130718765388648465),('10','4',0,'','333','444',0,'',130729085468937023,130729085468937023),('11','1',0,'','22','33',0,'',130729103086841542,130729103086841542),('12','4',0,'','hj','jk',0,'',130729148017503997,130729148017503997),('13','2',0,'','1234','3456',0,'',130729899188435169,130729899188435169),('14','3',0,'','345','678',0,'',130729901790919515,130729901790919515),('15','1',0,'','234','567',0,'serious',130729903139551572,130729903139551572),('16','7',0,'','ert','tyu',0,'',130729157516187291,130729157516177290),('17','12',0,'','vvivie','cheng',0,'so serious in leg!',130729164200709623,130729164200699623),('18','4',0,'','klyu','hjk',0,'',130729188674929469,130729188674929469),('19','9',0,'','ert','ghj',0,'',130729188985327222,130729188985317222),('2','1',0,'1234','Jane','Doe2',0,'',130719427527811402,130719427527791401),('20','1',0,'','12345','4567',0,'',130729906177712111,130729906177712111),('21','1',0,'','123','456',0,'',130729908309008693,130729908308998692),('22','1',0,'','345','678',0,'',130729915478831566,130729915478831566),('23','1',0,'','wer','tyu',0,'',130729918968017298,130729918968017298),('24','13',0,'','345','567',0,'',130729201080769042,130729201080769042),('25','14',0,'','GENG','CHENG',0,'',130729204769810043,130729204769810043),('26','1',0,'','wer','rty',0,'',130729920417221708,130729920417221708),('27','1',0,'','123','456',0,'',130729921107739080,130729921107729080),('28','5',0,'','FFFF','SSSSS',0,'',130729814958666356,130729814958666356),('29','1',0,'','222','4444',0,'',130729922028600357,130729922028600357),('3','2',22,'222','Lyly','Doe2',0,'Serious!',130722266230730371,130722266230630371),('30','7',0,'','2345','6789',0,'',130729831832811553,130729831832811553),('31','1',0,'','123','456',0,'',130729926045907543,130729926045907543),('32','1',0,'','vivien','geng',0,'need to treated three times!',130729930005704805,130729930005704805),('33','1',0,'','123','456',0,'good',130729941508837231,130729941508837231),('34','1',0,'','asd','fgh',0,'qwerty',130729947125774063,130729947125774063),('35','3',0,'','234','567',0,'',130729947634758346,130729947634758346),('36','1',0,'','123','456',0,'',130730790987216657,130730790987216657),('37','15',0,'','123','456',0,'',130730798312178070,130730798312178070),('38','16',0,'','vivi','ge',0,'',130732775820152340,130732775820152340),('39','17',0,'','Vivien','Cheng',0,'',130734214749643112,130734214749643112),('4','2',333,'23838','Vivien','Doe2',0,'Serious!',130723937640296407,130723937640276406),('40','18',0,'','Vivien','Cheng',0,'',130735143751131320,130735143751131320),('41','19',0,'','Vivien','Cheng',0,'Serious',130736950390587482,130736950390587482),('42','20',0,'','Vivien','Cheng',0,'111',130737078369319545,130737078369319545),('43','21',0,'','Vivien','Cheng',0,'good',130737078925300327,130737078925300327),('44','22',0,'','Vivien','Cheng',0,'',130737486126112887,130737486126112887),('45','23',0,'','Julie','Julie',0,'11',130737868008542099,130737868008542099),('46','24',0,'','Julie','Julie',0,'',130737881090920368,130737881090920368),('47','25',0,'','Julie','Julie',0,'gfghf',130747328326598576,130747328326598576),('48','4',0,'','','',0,'',130747333372347177,130747333372347177),('49','2',0,'','','',0,'',130747333452881783,130747333452881783),('5','8',333,'','Vivien','Doe2',0,'',130725716376257860,130725716376257860),('50','2',0,'','TEST','test2',0,'',130747333887596647,130747333887596647),('51','5',0,'','11','22',0,'333',130764727120708672,130764727120708672),('6','9',333,'12345679xcv','Vivien','Doe2',0,'good friend',130725724407017953,130725724407017953),('60','26',2222,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('7','10',333,'FGHJKL0908','Vivien','Doe2',0,'ERTYUIIII',130728059440488105,130728059440488105),('8','11',333,'','Vivien','Doe2',0,'',130728278097296966,130728278097296966),('9','2',0,'','111','222',0,'',130729080924274673,130729080924274673);
/*!40000 ALTER TABLE `study` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'softwaredata'
--

--
-- Dumping routines for database 'softwaredata'
--

--
-- Final view structure for view `patientlist`
--

/*!50001 DROP TABLE IF EXISTS `patientlist`*/;
/*!50001 DROP VIEW IF EXISTS `patientlist`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `patientlist` AS select `patient`.`PID` AS `PatientID`,`patient`.`FirstName` AS `FirstName`,`patient`.`LastName` AS `LastName`,`patient`.`Birthday` AS `Birthday`,`patient`.`Sex` AS `Sex`,`anatomicallocation`.`LocationName` AS `Anatomical Locatioin`,`study`.`SID` AS `Study ID`,`study`.`StudyInstanceUID` AS `Study Instance UID`,`series`.`SERID` AS `Series ID`,`series`.`SeriesInstanceUID` AS `Series Instance UID` from (((`patient` left join `study` on((`patient`.`PID` = `study`.`PID`))) left join `series` on((`study`.`SID` = `series`.`SID`))) left join `anatomicallocation` on((`series`.`AnatomicalLocationID` = `anatomicallocation`.`AnatomicalLocationID`))) */;
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

-- Dump completed on 2015-05-29 17:25:25

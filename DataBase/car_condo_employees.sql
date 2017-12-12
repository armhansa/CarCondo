-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: car_condo
-- ------------------------------------------------------
-- Server version	5.7.18-log

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
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employees` (
  `Emp_username` varchar(30) NOT NULL,
  `Emp_password` varchar(30) NOT NULL,
  `Emp_firstname` varchar(30) NOT NULL,
  `Emp_lastname` varchar(30) NOT NULL,
  `Emp_phone` varchar(10) NOT NULL,
  `Emp_email` varchar(50) NOT NULL,
  `Emp_citizenID` varchar(13) NOT NULL,
  `Emp_address` varchar(250) NOT NULL,
  `Emp_salary` int(11) DEFAULT '0',
  `Emp_department` varchar(15) DEFAULT NULL,
  `Branch_NO` int(11) DEFAULT NULL,
  PRIMARY KEY (`Emp_username`),
  UNIQUE KEY `Emp_email_UNIQUE` (`Emp_email`),
  UNIQUE KEY `Emp_username_UNIQUE` (`Emp_username`),
  UNIQUE KEY `Emp_citizenID_UNIQUE` (`Emp_citizenID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES ('Emp_armhansa','11111111','หรรษธร','ช่วยอ่อน','0915945612','armhansa@gmail.com','1100400885678','661/3 บ้านกลางสวย ฉลองกรุง1 ลาดกระบัง',0,'mechanic',NULL),('Emp_danaya','11111111','ดนยา','สร้างสุข','0900001010','danaya@gmail.com','1300000000112','บนมอไซที่นั่งแล้วทำเขาล้ม',0,'driver',NULL),('Emp_natthawat','11111111','นาตทาวาต','เฮดสันไอที','0898889999','natthanwat@gmail.com','1010101010101','1234 หน้าร้านหมีไอทีลาดกระบัง',0,'mechanic',NULL),('Emp_phongtat','11111111','พงธัชชช','แย้ม','0919199999','phongtat@gmail.com','1103347612001','304 บ้านกลางสวน ลาดกระบัง',0,'mechanic',NULL),('Emp_thanawin','11111111','ธนวินซ์','อัศวินไอทีลาดกระบัง','0991111111','thanawin@gmail.com','1111111111111','แฟชั่น ที่บ้านน้องน่ารักมาก',0,'driver',NULL);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-24 12:53:27

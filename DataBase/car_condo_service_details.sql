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
-- Table structure for table `service_details`
--

DROP TABLE IF EXISTS `service_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `service_details` (
  `Service_NO` int(11) NOT NULL AUTO_INCREMENT,
  `Service_name` varchar(30) NOT NULL,
  `Service_desc` varchar(200) NOT NULL DEFAULT '-',
  `Service_price` int(11) NOT NULL,
  PRIMARY KEY (`Service_NO`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_details`
--

LOCK TABLES `service_details` WRITE;
/*!40000 ALTER TABLE `service_details` DISABLE KEYS */;
INSERT INTO `service_details` VALUES (1,'ฝากรถยนต์','นำรถมาไว้ในคอนโด (คิดราคาตามวันที่เก็บ)',2000),(2,'รับรถยนต์','ให้พนักงานไปรับรถยนต์ของคุณลูกค้า',0),(3,'ส่งรถยนต์','นำรถยนต์ไปส่งตามจุดหมายปลายทางที่ท่านต้องการ',5000),(4,'ล้างรถยนต์','รถยนต์        ทำความสะอาดรถยนต์ทั้งภายนอกและภายในด้วยเทคโนโลยีแรงฉีดน้ำแรงดันสูง (คิดราคาตามจำนวนครั้งที่ทำ)',3000),(5,'เติมลมยาง','เติมลมยางของรถยนต์ให้เต็ม เพื่อรกษาคุณภาพของเนื้อยาง (ตามจำนวนครั้งที่ทำ)',0),(6,'เช็คแบตเตอรี่','เช็คแบตเตอรี่',0);
/*!40000 ALTER TABLE `service_details` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-24 12:53:28

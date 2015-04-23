-- MySQL dump 10.13  Distrib 5.5.23, for Win32 (x86)
--
-- Host: localhost    Database: timeline
-- ------------------------------------------------------
-- Server version	5.5.23

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
-- Table structure for table `city`
--

DROP TABLE IF EXISTS `city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `city` (
  `idcity` int(11) NOT NULL AUTO_INCREMENT,
  `city` varchar(255) NOT NULL,
  PRIMARY KEY (`idcity`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=ucs2;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `city`
--

LOCK TABLES `city` WRITE;
/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` VALUES (1,'Santiago de Compostela'),(2,'Vigo'),(3,'A Coruña');
/*!40000 ALTER TABLE `city` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gender`
--

DROP TABLE IF EXISTS `gender`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gender` (
  `idgender` int(11) NOT NULL AUTO_INCREMENT,
  `gender` varchar(45) NOT NULL,
  PRIMARY KEY (`idgender`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=ucs2;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gender`
--

LOCK TABLES `gender` WRITE;
/*!40000 ALTER TABLE `gender` DISABLE KEYS */;
INSERT INTO `gender` VALUES (1,'m'),(2,'h'),(3,'o');
/*!40000 ALTER TABLE `gender` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language`
--

DROP TABLE IF EXISTS `language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `language` (
  `idlanguage` int(11) NOT NULL AUTO_INCREMENT,
  `language` varchar(255) NOT NULL,
  PRIMARY KEY (`idlanguage`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=ucs2;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language`
--

LOCK TABLES `language` WRITE;
/*!40000 ALTER TABLE `language` DISABLE KEYS */;
INSERT INTO `language` VALUES (1,'español'),(2,'gallego'),(3,'vasco');
/*!40000 ALTER TABLE `language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transport`
--

DROP TABLE IF EXISTS `transport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transport` (
  `idtransport` int(11) NOT NULL AUTO_INCREMENT,
  `transport` varchar(255) NOT NULL,
  PRIMARY KEY (`idtransport`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=ucs2;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transport`
--

LOCK TABLES `transport` WRITE;
/*!40000 ALTER TABLE `transport` DISABLE KEYS */;
INSERT INTO `transport` VALUES (1,'bici'),(2,'moto'),(3,'coche');
/*!40000 ALTER TABLE `transport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transport_has_user`
--

DROP TABLE IF EXISTS `transport_has_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transport_has_user` (
  `transport_idtransport` int(11) NOT NULL,
  `user_iduser` varchar(255) NOT NULL,
  PRIMARY KEY (`transport_idtransport`,`user_iduser`),
  KEY `fk_transport_has_user_user1_idx` (`user_iduser`),
  KEY `fk_transport_has_user_transport_idx` (`transport_idtransport`),
  CONSTRAINT `fk_transport_has_user_transport` FOREIGN KEY (`transport_idtransport`) REFERENCES `transport` (`idtransport`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_transport_has_user_user1` FOREIGN KEY (`user_iduser`) REFERENCES `user` (`iduser`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=ucs2;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transport_has_user`
--

LOCK TABLES `transport_has_user` WRITE;
/*!40000 ALTER TABLE `transport_has_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `transport_has_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `iduser` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `description` text,
  `birthdate` datetime DEFAULT NULL,
  `city_idcity` int(11) NOT NULL,
  `gender_idgender` int(11) NOT NULL,
  PRIMARY KEY (`iduser`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `fk_user_city1_idx` (`city_idcity`),
  KEY `fk_user_gender1_idx` (`gender_idgender`),
  CONSTRAINT `fk_user_city1` FOREIGN KEY (`city_idcity`) REFERENCES `city` (`idcity`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_gender1` FOREIGN KEY (`gender_idgender`) REFERENCES `gender` (`idgender`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=ucs2;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('1','Pablo','nomejodas@gmail.com','lñiujhsdfg','no','no','2000-10-10 00:00:00',1,1),('2','Manolo','ijbndf@lkjbnsdfg.sd','lñkjhbk','no','no','1980-01-02 00:00:00',2,2),('3','Pechotes','sdfgsd@fgjgh.es','snhfgh','no','no','1980-01-01 00:00:00',3,3),('4','sadfa','asdfasdf','asdfasdfa','asdf','adsf','1990-01-01 00:00:00',2,1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_has_language`
--

DROP TABLE IF EXISTS `user_has_language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_has_language` (
  `user_iduser` varchar(255) NOT NULL,
  `language_idlanguage` int(11) NOT NULL,
  PRIMARY KEY (`user_iduser`,`language_idlanguage`),
  KEY `fk_user_has_language_language1_idx` (`language_idlanguage`),
  KEY `fk_user_has_language_user1_idx` (`user_iduser`),
  CONSTRAINT `fk_user_has_language_user1` FOREIGN KEY (`user_iduser`) REFERENCES `user` (`iduser`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_language_language1` FOREIGN KEY (`language_idlanguage`) REFERENCES `language` (`idlanguage`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=ucs2;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_has_language`
--

LOCK TABLES `user_has_language` WRITE;
/*!40000 ALTER TABLE `user_has_language` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_has_language` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-04-23 13:13:54

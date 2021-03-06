CREATE DATABASE  IF NOT EXISTS `SpotifyClone` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `SpotifyClone`;
-- MySQL dump 10.13  Distrib 8.0.22, for Linux (x86_64)
--
-- Host: localhost    Database: SpotifyClone
-- ------------------------------------------------------
-- Server version	8.0.22-0ubuntu0.20.04.3

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
-- Table structure for table `album`
--

DROP TABLE IF EXISTS `album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `album` (
  `idalbum` int NOT NULL AUTO_INCREMENT,
  `name_album` varchar(45) NOT NULL,
  `artistas_idartistas` int NOT NULL,
  PRIMARY KEY (`idalbum`),
  KEY `fk_album_artistas_idx` (`artistas_idartistas`),
  CONSTRAINT `fk_album_artistas` FOREIGN KEY (`artistas_idartistas`) REFERENCES `artistas` (`idartistas`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album`
--

LOCK TABLES `album` WRITE;
/*!40000 ALTER TABLE `album` DISABLE KEYS */;
INSERT INTO `album` VALUES (1,'Envious',1),(2,'Exuberant',1),(3,'Hallowed Steam',2),(4,'Incandescent',3),(5,'Temporary Culture',4);
/*!40000 ALTER TABLE `album` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artistas`
--

DROP TABLE IF EXISTS `artistas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artistas` (
  `idartistas` int NOT NULL AUTO_INCREMENT,
  `name_singer` varchar(45) NOT NULL,
  PRIMARY KEY (`idartistas`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artistas`
--

LOCK TABLES `artistas` WRITE;
/*!40000 ALTER TABLE `artistas` DISABLE KEYS */;
INSERT INTO `artistas` VALUES (1,'Walter Phoenix'),(2,'Peter Strong'),(3,'Lance Day'),(4,'Freedie Shannon');
/*!40000 ALTER TABLE `artistas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `musicas`
--

DROP TABLE IF EXISTS `musicas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `musicas` (
  `idmusicas` int NOT NULL AUTO_INCREMENT,
  `album_idalbum` int NOT NULL,
  `name_song` varchar(45) NOT NULL,
  PRIMARY KEY (`idmusicas`),
  KEY `fk_musicas_album1_idx` (`album_idalbum`),
  CONSTRAINT `fk_musicas_album1` FOREIGN KEY (`album_idalbum`) REFERENCES `album` (`idalbum`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `musicas`
--

LOCK TABLES `musicas` WRITE;
/*!40000 ALTER TABLE `musicas` DISABLE KEYS */;
INSERT INTO `musicas` VALUES (1,1,'Soul For Us'),(2,1,'Reflections Of Magic'),(3,1,'Dance With Her Own'),(4,2,'Troubles Of My Inner Fire'),(5,2,'Time Fireworks'),(6,3,'Magic Circus'),(7,3,'Honey, So Do I'),(8,3,'Sweetie, Let\'s Go Wild'),(9,3,'She Knows'),(10,4,'Fantasy For Me'),(11,4,'Celebration Of More'),(12,4,'Rock His Everything'),(13,4,'Home Forever'),(14,4,'Diamond Power'),(15,4,'Honey, Let\'s Be Silly'),(16,5,'Thang Of Thunder'),(17,5,'Words Of Her Life'),(18,5,'Without My Streets');
/*!40000 ALTER TABLE `musicas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `planos`
--

DROP TABLE IF EXISTS `planos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `planos` (
  `idplanos` int NOT NULL AUTO_INCREMENT,
  `name_plano` varchar(45) NOT NULL,
  `price_plano` decimal(5,2) NOT NULL,
  PRIMARY KEY (`idplanos`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planos`
--

LOCK TABLES `planos` WRITE;
/*!40000 ALTER TABLE `planos` DISABLE KEYS */;
INSERT INTO `planos` VALUES (1,'gratuito',0.00),(2,'familiar',7.99),(3,'universitário',5.99);
/*!40000 ALTER TABLE `planos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usario_artistas`
--

DROP TABLE IF EXISTS `usario_artistas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usario_artistas` (
  `usuario_idusuario` int NOT NULL,
  `artistas_idartistas` int NOT NULL,
  PRIMARY KEY (`usuario_idusuario`,`artistas_idartistas`),
  KEY `fk_usario_artistas_usuario1_idx` (`usuario_idusuario`),
  KEY `fk_usario_artistas_artistas1_idx` (`artistas_idartistas`),
  CONSTRAINT `fk_usario_artistas_artistas1` FOREIGN KEY (`artistas_idartistas`) REFERENCES `artistas` (`idartistas`),
  CONSTRAINT `fk_usario_artistas_usuario1` FOREIGN KEY (`usuario_idusuario`) REFERENCES `usuario` (`idusuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usario_artistas`
--

LOCK TABLES `usario_artistas` WRITE;
/*!40000 ALTER TABLE `usario_artistas` DISABLE KEYS */;
INSERT INTO `usario_artistas` VALUES (1,1),(1,3),(1,4),(2,1),(2,3),(3,1),(3,2),(4,4);
/*!40000 ALTER TABLE `usario_artistas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `idusuario` int NOT NULL AUTO_INCREMENT,
  `name_user` varchar(45) NOT NULL,
  `age_user` int DEFAULT NULL,
  `planos_idplanos` int NOT NULL,
  PRIMARY KEY (`idusuario`),
  KEY `fk_usuario_planos1_idx` (`planos_idplanos`),
  CONSTRAINT `fk_usuario_planos1` FOREIGN KEY (`planos_idplanos`) REFERENCES `planos` (`idplanos`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Thati',23,1),(2,'Cintia',35,2),(3,'Bill',20,3),(4,'Roger',45,1);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_musicas`
--

DROP TABLE IF EXISTS `usuario_musicas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_musicas` (
  `usuario_idusuario` int NOT NULL,
  `musicas_idmusicas` int NOT NULL,
  PRIMARY KEY (`usuario_idusuario`,`musicas_idmusicas`),
  KEY `fk_usuario_musicas_usuario1_idx` (`usuario_idusuario`),
  KEY `fk_usuario_musicas_musicas1_idx` (`musicas_idmusicas`),
  CONSTRAINT `fk_usuario_musicas_musicas1` FOREIGN KEY (`musicas_idmusicas`) REFERENCES `musicas` (`idmusicas`),
  CONSTRAINT `fk_usuario_musicas_usuario1` FOREIGN KEY (`usuario_idusuario`) REFERENCES `usuario` (`idusuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_musicas`
--

LOCK TABLES `usuario_musicas` WRITE;
/*!40000 ALTER TABLE `usuario_musicas` DISABLE KEYS */;
INSERT INTO `usuario_musicas` VALUES (1,1),(1,6),(1,14),(1,16),(2,2),(2,13),(2,15),(2,17),(3,4),(3,6),(3,16),(4,3),(4,11),(4,18);
/*!40000 ALTER TABLE `usuario_musicas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'SpotifyClone'
--

--
-- Dumping routines for database 'SpotifyClone'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-17 17:53:21

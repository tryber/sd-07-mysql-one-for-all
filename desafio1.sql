CREATE DATABASE  IF NOT EXISTS `SpotifyClone` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `SpotifyClone`;
-- MySQL dump 10.13  Distrib 8.0.23, for Linux (x86_64)
--
-- Host: localhost    Database: SpotifyClone
-- ------------------------------------------------------
-- Server version	8.0.23-0ubuntu0.20.04.1

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
-- Table structure for table `albuns`
--

DROP TABLE IF EXISTS `albuns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `albuns` (
  `album_id` int NOT NULL AUTO_INCREMENT,
  `album` varchar(45) NOT NULL,
  PRIMARY KEY (`album_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `albuns`
--

LOCK TABLES `albuns` WRITE;
/*!40000 ALTER TABLE `albuns` DISABLE KEYS */;
INSERT INTO `albuns` VALUES (1,'Envious'),(2,'Exuberant'),(3,'Hallowed Steam'),(4,'Incandescent'),(5,'Temporary Culture');
/*!40000 ALTER TABLE `albuns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artistas`
--

DROP TABLE IF EXISTS `artistas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artistas` (
  `artista_id` int NOT NULL AUTO_INCREMENT,
  `artista` varchar(45) NOT NULL,
  PRIMARY KEY (`artista_id`)
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
-- Table structure for table `historico`
--

DROP TABLE IF EXISTS `historico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `historico` (
  `users_usuario_id` int NOT NULL,
  `songs_cancoes_id` int NOT NULL,
  `cancoes` varchar(45) NOT NULL,
  PRIMARY KEY (`users_usuario_id`,`songs_cancoes_id`),
  KEY `fk_users_has_songs_songs1_idx` (`songs_cancoes_id`),
  KEY `fk_users_has_songs_users1_idx` (`users_usuario_id`),
  CONSTRAINT `fk_users_has_songs_songs1` FOREIGN KEY (`songs_cancoes_id`) REFERENCES `songs` (`cancoes_id`),
  CONSTRAINT `fk_users_has_songs_users1` FOREIGN KEY (`users_usuario_id`) REFERENCES `users` (`usuario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historico`
--

LOCK TABLES `historico` WRITE;
/*!40000 ALTER TABLE `historico` DISABLE KEYS */;
INSERT INTO `historico` VALUES (1,1,'Soul For Us'),(1,6,'Magic Circus'),(1,14,'Diamond Power'),(1,16,'Thang Of Thunder'),(2,2,'Reflections Of Magic'),(2,13,'Home Forever'),(2,15,'Honey, Let\'s Be Silly'),(2,17,'Words Of Her Life'),(3,4,'Troubles Of My Inner Fire'),(3,6,'Magic Circus'),(3,16,'Thang Of Thunder'),(4,3,'Dance With Her Own'),(4,11,'Celebration Of More'),(4,18,'Without My Streets');
/*!40000 ALTER TABLE `historico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `planos`
--

DROP TABLE IF EXISTS `planos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `planos` (
  `plano_id` int NOT NULL,
  `plano` varchar(45) NOT NULL,
  `valor_plano` decimal(5,2) NOT NULL,
  PRIMARY KEY (`plano_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
-- Table structure for table `seguindo`
--

DROP TABLE IF EXISTS `seguindo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seguindo` (
  `artistas_artista_id` int NOT NULL,
  `users_usuario_id` int NOT NULL,
  `artista` varchar(45) NOT NULL,
  PRIMARY KEY (`artistas_artista_id`,`users_usuario_id`),
  KEY `fk_artistas_has_users_users1_idx` (`users_usuario_id`),
  KEY `fk_artistas_has_users_artistas1_idx` (`artistas_artista_id`),
  CONSTRAINT `fk_artistas_has_users_artistas1` FOREIGN KEY (`artistas_artista_id`) REFERENCES `artistas` (`artista_id`),
  CONSTRAINT `fk_artistas_has_users_users1` FOREIGN KEY (`users_usuario_id`) REFERENCES `users` (`usuario_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seguindo`
--

LOCK TABLES `seguindo` WRITE;
/*!40000 ALTER TABLE `seguindo` DISABLE KEYS */;
INSERT INTO `seguindo` VALUES (1,1,'Walter Phoenix'),(1,2,'Walter Phoenix'),(2,3,'Peter Strong'),(4,4,'Freedie Shannon');
/*!40000 ALTER TABLE `seguindo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `songs`
--

DROP TABLE IF EXISTS `songs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `songs` (
  `cancoes_id` int NOT NULL AUTO_INCREMENT,
  `cancoes` varchar(45) NOT NULL,
  `artistas_artista_id` int NOT NULL,
  `albuns_album_id` int NOT NULL,
  PRIMARY KEY (`cancoes_id`),
  KEY `fk_songs_artistas1_idx` (`artistas_artista_id`),
  KEY `fk_songs_albuns1_idx` (`albuns_album_id`),
  CONSTRAINT `fk_songs_albuns1` FOREIGN KEY (`albuns_album_id`) REFERENCES `albuns` (`album_id`),
  CONSTRAINT `fk_songs_artistas1` FOREIGN KEY (`artistas_artista_id`) REFERENCES `artistas` (`artista_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `songs`
--

LOCK TABLES `songs` WRITE;
/*!40000 ALTER TABLE `songs` DISABLE KEYS */;
INSERT INTO `songs` VALUES (1,'Soul For Us',1,1),(2,'Reflections Of Magic',1,1),(3,'Dance With Her Own',1,1),(4,'Troubles Of My Inner Fire',1,2),(5,'Time Fireworks',1,2),(6,'Magic Circus',2,3),(7,'Honey, So Do I',2,3),(8,'Sweetie, Let\'s Go Wild',2,3),(9,'She Knows',2,3),(10,'Fantasy For Me',3,4),(11,'Celebration Of More',3,4),(12,'Rock His Everything',3,4),(13,'Home Forever',3,4),(14,'Diamond Power',3,4),(15,'Honey, Let\'s Be Silly',3,4),(16,'Thang Of Thunder',4,5),(17,'Words Of Her Life',4,5),(18,'Without My Streets',4,5);
/*!40000 ALTER TABLE `songs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `usuario_id` int NOT NULL,
  `usuario` varchar(45) NOT NULL,
  `idade` int NOT NULL,
  `planos_plano_id` int NOT NULL,
  PRIMARY KEY (`usuario_id`),
  KEY `fk_users_planos1_idx` (`planos_plano_id`),
  CONSTRAINT `fk_users_planos1` FOREIGN KEY (`planos_plano_id`) REFERENCES `planos` (`plano_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Thati',23,1),(2,'Cintia',35,2),(3,'Bill',20,3),(4,'Roger',45,1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-03-20  6:10:30

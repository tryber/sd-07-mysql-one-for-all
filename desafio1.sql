CREATE DATABASE IF NOT EXISTS `SpotifyClone`;
USE `SpotifyClone`;

DROP TABLE IF EXISTS `album`;

CREATE TABLE `album` (
  `idalbum` int NOT NULL AUTO_INCREMENT,
  `name_album` varchar(45) NOT NULL,
  `artistas_idartistas` int NOT NULL,
  PRIMARY KEY (`idalbum`),
  KEY `fk_album_artistas_idx` (`artistas_idartistas`),
  CONSTRAINT `fk_album_artistas` FOREIGN KEY (`artistas_idartistas`) REFERENCES `artistas` (`idartistas`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `album` VALUES (1,'Envious',1),(2,'Exuberant',1),(3,'Hallowed Steam',2),(4,'Incandescent',3),(5,'Temporary Culture',4);

DROP TABLE IF EXISTS `artistas`;

CREATE TABLE `artistas` (
  `idartistas` int NOT NULL AUTO_INCREMENT,
  `name_singer` varchar(45) NOT NULL,
  PRIMARY KEY (`idartistas`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `artistas` VALUES (1,'Walter Phoenix'),(2,'Peter Strong'),(3,'Lance Day'),(4,'Freedie Shannon');

DROP TABLE IF EXISTS `musicas`;

CREATE TABLE `musicas` (
  `idmusicas` int NOT NULL AUTO_INCREMENT,
  `album_idalbum` int NOT NULL,
  `name_song` varchar(45) NOT NULL,
  PRIMARY KEY (`idmusicas`),
  KEY `fk_musicas_album1_idx` (`album_idalbum`),
  CONSTRAINT `fk_musicas_album1` FOREIGN KEY (`album_idalbum`) REFERENCES `album` (`idalbum`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


INSERT INTO `musicas` VALUES (1,1,'Soul For Us'),(2,1,'Reflections Of Magic'),(3,1,'Dance With Her Own'),(4,2,'Troubles Of My Inner Fire'),(5,2,'Time Fireworks'),(6,3,'Magic Circus'),(7,3,'Honey, So Do I'),(8,3,'Sweetie, Let\'s Go Wild'),(9,3,'She Knows'),(10,4,'Fantasy For Me'),(11,4,'Celebration Of More'),(12,4,'Rock His Everything'),(13,4,'Home Forever'),(14,4,'Diamond Power'),(15,4,'Honey, Let\'s Be Silly'),(16,5,'Thang Of Thunder'),(17,5,'Words Of Her Life'),(18,5,'Without My Streets');

DROP TABLE IF EXISTS `planos`;

CREATE TABLE `planos` (
  `idplanos` int NOT NULL AUTO_INCREMENT,
  `name_plano` varchar(45) NOT NULL,
  `price_plano` decimal(5,2) NOT NULL,
  PRIMARY KEY (`idplanos`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `planos` VALUES (1,'gratuito',0.00),(2,'familiar',7.99),(3,'universitário',5.99);

DROP TABLE IF EXISTS `usario_artistas`;

CREATE TABLE `usario_artistas` (
  `usuario_idusuario` int NOT NULL,
  `artistas_idartistas` int NOT NULL,
  PRIMARY KEY (`usuario_idusuario`,`artistas_idartistas`),
  KEY `fk_usario_artistas_usuario1_idx` (`usuario_idusuario`),
  KEY `fk_usario_artistas_artistas1_idx` (`artistas_idartistas`),
  CONSTRAINT `fk_usario_artistas_artistas1` FOREIGN KEY (`artistas_idartistas`) REFERENCES `artistas` (`idartistas`),
  CONSTRAINT `fk_usario_artistas_usuario1` FOREIGN KEY (`usuario_idusuario`) REFERENCES `usuario` (`idusuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `usario_artistas` VALUES (1,1),(1,3),(1,4),(2,1),(2,3),(3,1),(3,2),(4,4);

DROP TABLE IF EXISTS `usuario`;

CREATE TABLE `usuario` (
  `idusuario` int NOT NULL AUTO_INCREMENT,
  `name_user` varchar(45) NOT NULL,
  `age_user` int DEFAULT NULL,
  `planos_idplanos` int NOT NULL,
  PRIMARY KEY (`idusuario`),
  KEY `fk_usuario_planos1_idx` (`planos_idplanos`),
  CONSTRAINT `fk_usuario_planos1` FOREIGN KEY (`planos_idplanos`) REFERENCES `planos` (`idplanos`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `usuario` VALUES (1,'Thati',23,1),(2,'Cintia',35,2),(3,'Bill',20,3),(4,'Roger',45,1);

DROP TABLE IF EXISTS `usuario_musicas`;

CREATE TABLE `usuario_musicas` (
  `usuario_idusuario` int NOT NULL,
  `musicas_idmusicas` int NOT NULL,
  PRIMARY KEY (`usuario_idusuario`,`musicas_idmusicas`),
  KEY `fk_usuario_musicas_usuario1_idx` (`usuario_idusuario`),
  KEY `fk_usuario_musicas_musicas1_idx` (`musicas_idmusicas`),
  CONSTRAINT `fk_usuario_musicas_musicas1` FOREIGN KEY (`musicas_idmusicas`) REFERENCES `musicas` (`idmusicas`),
  CONSTRAINT `fk_usuario_musicas_usuario1` FOREIGN KEY (`usuario_idusuario`) REFERENCES `usuario` (`idusuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO `usuario_musicas` VALUES (1,1),(1,6),(1,14),(1,16),(2,2),(2,13),(2,15),(2,17),(3,4),(3,6),(3,16),(4,3),(4,11),(4,18);

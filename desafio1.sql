SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE IF NOT EXISTS SpotifyClone;

USE SpotifyClone;

CREATE TABLE `artistas` (
  `artista_id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  PRIMARY KEY (`artista_id`)
) ENGINE=InnoDB;

CREATE TABLE `planos` (
  `plano_id` int NOT NULL AUTO_INCREMENT,
  `plano` varchar(100) NOT NULL,
  `valor` decimal(6,2) NOT NULL,
  PRIMARY KEY (`plano_id`)
) ENGINE=InnoDB;

CREATE TABLE `usuarios` (
  `usuario_id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `idade` int NOT NULL,
  `plano_id` int NOT NULL,
  PRIMARY KEY (`usuario_id`),
  KEY `fk_usuarios_1_idx` (`plano_id`),
  CONSTRAINT `fk_usuarios_1`
  FOREIGN KEY (`plano_id`)
  REFERENCES `planos` (`plano_id`)
) ENGINE=InnoDB;

CREATE TABLE `album` (
  `album_id` int NOT NULL AUTO_INCREMENT,
  `album` varchar(100) NOT NULL,
  `artista_id` int NOT NULL,
  PRIMARY KEY (`album_id`),
  KEY `fk_album_1_idx` (`artista_id`),
  CONSTRAINT `fk_album_1`
  FOREIGN KEY (`artista_id`)
  REFERENCES `artistas` (`artista_id`)
) ENGINE=InnoDB;

CREATE TABLE `cancoes` (
  `cancao_id` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `album_id` int NOT NULL,
  PRIMARY KEY (`cancao_id`),
  KEY `fk_cancoes_1_idx` (`album_id`),
  CONSTRAINT `fk_cancoes_1`
  FOREIGN KEY (`album_id`)
  REFERENCES `album` (`album_id`)
) ENGINE=InnoDB;

CREATE TABLE `historico_de_reproducoes` (
  `usuario_id` int NOT NULL,
  `cancao_id` int NOT NULL,
  KEY `fk_historico_de_reproducoes_1_idx` (`usuario_id`),
  KEY `fk_historico_de_reproducoes_2_idx` (`cancao_id`),
  CONSTRAINT `fk_historico_de_reproducoes_1`
  FOREIGN KEY (`usuario_id`)
  REFERENCES `usuarios` (`usuario_id`),
  CONSTRAINT `fk_historico_de_reproducoes_2`
  FOREIGN KEY (`cancao_id`)
  REFERENCES `cancoes` (`cancao_id`)
) ENGINE=InnoDB;

CREATE TABLE `seguindo_artistas` (
  `usuario_id` int NOT NULL,
  `artista_id` int NOT NULL,
  KEY `fk_seguindo_artistas_1_idx` (`usuario_id`),
  KEY `fk_seguindo_artistas_2_idx` (`artista_id`),
  CONSTRAINT `fk_seguindo_artistas_1`
  FOREIGN KEY (`usuario_id`)
  REFERENCES `usuarios` (`usuario_id`),
  CONSTRAINT `fk_seguindo_artistas_2`
  FOREIGN KEY (`artista_id`)
  REFERENCES `artistas` (`artista_id`)
) ENGINE=InnoDB;

INSERT INTO `artistas`
VALUES
(1,'Walter Phoenix'),
(2,'Freedie Shannon'),
(3,'Lance Day'),
(4,'Peter Strong');

INSERT INTO `planos`
VALUES
(1,'gratuito',0.00),
(2,'universitário',5.99),
(3,'familiar',7.99);

INSERT INTO `usuarios`
VALUES
(1,'Thati',23,1),
(2,'Cintia',35,3),
(3,'Bill',20,2),
(4,'Roger',45,1);

INSERT INTO `album`
VALUES
(1,'Envious',1),
(2,'Exuberant',1),
(3,'Hallowed Steam',4),
(4,'Incandescent',3),
(5,'Temporary Culture',2);

INSERT INTO `cancoes`
VALUES
(1,'Soul For Us',1),
(2,'Reflections Of Magic',1),
(3,'Dance With Her Own',1),
(4,'Troubles Of My Inner Fire',2),
(5,'Time Fireworks',2),
(6,'Magic Circus',3),
(7,'Honey, So Do I',3),
(8,'Sweetie, Let\'s Go Wild',3),
(9,'She Knows',3),
(10,'Fantasy For Me',4),
(11,'Celebration Of More',4),
(12,'Rock His Everything',4),
(13,'Home Forever',4),
(14,'Diamond Power',4),
(15,'Honey, Let\'s Be Silly',4),
(16,'Thang Of Thunder',5),
(17,'Words Of Her Life',5),
(18,'Without My Streets',5);

INSERT INTO `historico_de_reproducoes`
VALUES
(1,1),
(1,6),
(1,14),
(1,16),
(2,13),
(2,17),
(2,2),
(2,15),
(3,4),
(3,16),
(3,6),
(4,3),
(4,18),
(4,11);

INSERT INTO `seguindo_artistas`
VALUES
(1,2),
(1,1),
(1,3),
(2,1),
(2,3),
(3,4),
(3,1),
(4,2);

-- MySQL Workbench Synchronization
-- Generated: 2021-03-05 18:05
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: Ander

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

DROP DATABASE IF EXISTS `SpotifyClone`;
CREATE DATABASE IF NOT EXISTS `SpotifyClone` DEFAULT CHARACTER SET utf8 ;
USE `SpotifyClone`;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`albuns` (
  `album_id` INT(11) NOT NULL AUTO_INCREMENT,
  `album` VARCHAR(45) NULL DEFAULT NULL,
  `artista_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`album_id`),
  INDEX `artista_id_idx` (`artista_id` ASC) VISIBLE,
  CONSTRAINT `fk_albuns_artistas`
    FOREIGN KEY (`artista_id`)
    REFERENCES `SpotifyClone`.`artistas` (`artista_id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`artistas` (
  `artista_id` INT(11) NOT NULL AUTO_INCREMENT,
  `artista` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`artista_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`cancoes` (
  `cancao_id` INT(11) NOT NULL AUTO_INCREMENT,
  `cancao` VARCHAR(45) NULL DEFAULT NULL,
  `album_id` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`cancao_id`),
  INDEX `fk_albuns_album_id_idx` (`album_id` ASC) VISIBLE,
  CONSTRAINT `fk_cancoes_albuns`
    FOREIGN KEY (`album_id`)
    REFERENCES `SpotifyClone`.`albuns` (`album_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`planos` (
  `id_plano` INT(11) NOT NULL AUTO_INCREMENT,
  `plano` VARCHAR(45) NULL DEFAULT NULL,
  `preco` DECIMAL(10,2) NULL DEFAULT NULL,
  PRIMARY KEY (`id_plano`),
  UNIQUE INDEX `id_plano_UNIQUE` (`id_plano` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`seguidores` (
  `usuario_id` INT(11) NOT NULL,
  `artista_id` INT(11) NOT NULL,
  PRIMARY KEY (`usuario_id`, `artista_id`),
  INDEX `usuario_id_idx` (`usuario_id` ASC) VISIBLE,
  INDEX `artista_id_idx` (`artista_id` ASC) VISIBLE,
  CONSTRAINT `fk_seguidores_artistas`
    FOREIGN KEY (`artista_id`)
    REFERENCES `SpotifyClone`.`artistas` (`artista_id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `fk_seguidores_usuarios`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `SpotifyClone`.`usuarios` (`usuario_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`usuarios` (
  `usuario_id` INT(11) NOT NULL AUTO_INCREMENT,
  `usuario` VARCHAR(45) NOT NULL,
  `idade` INT(11) NULL DEFAULT NULL,
  `id_plano` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`usuario_id`),
  UNIQUE INDEX `usuario_UNIQUE` (`usuario` ASC) VISIBLE,
  UNIQUE INDEX `usuario_id_UNIQUE` (`usuario_id` ASC) VISIBLE,
  INDEX `id_plano_idx` (`id_plano` ASC) VISIBLE,
  CONSTRAINT `fk_usuarios_planos`
    FOREIGN KEY (`id_plano`)
    REFERENCES `SpotifyClone`.`planos` (`id_plano`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`historico` (
  `usuario_id` INT(11) NOT NULL,
  `cancao_id` INT(11) NOT NULL,
  INDEX `fk_historico_cancoes_idx` (`cancao_id` ASC) VISIBLE,
  PRIMARY KEY (`usuario_id`, `cancao_id`),
  CONSTRAINT `fk_historico_usuarios`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `SpotifyClone`.`usuarios` (`usuario_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_historico_cancoes`
    FOREIGN KEY (`cancao_id`)
    REFERENCES `SpotifyClone`.`cancoes` (`cancao_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

INSERT INTO `SpotifyClone`.`albuns` (`album_id`, `album`, `artista_id`) VALUES (DEFAULT, 'Envious', 1);
INSERT INTO `SpotifyClone`.`albuns` (`album_id`, `album`, `artista_id`) VALUES (DEFAULT, 'Exuberant', 1);
INSERT INTO `SpotifyClone`.`albuns` (`album_id`, `album`, `artista_id`) VALUES (DEFAULT, 'Hallowed Steam', 4);
INSERT INTO `SpotifyClone`.`albuns` (`album_id`, `album`, `artista_id`) VALUES (DEFAULT, 'Incandescent', 3);
INSERT INTO `SpotifyClone`.`albuns` (`album_id`, `album`, `artista_id`) VALUES (DEFAULT, 'Temporary Culture', 2);

INSERT INTO `SpotifyClone`.`artistas` (`artista_id`, `artista`) VALUES (DEFAULT, 'Walter Phoenix');
INSERT INTO `SpotifyClone`.`artistas` (`artista_id`, `artista`) VALUES (DEFAULT, 'Freedie Shannon');
INSERT INTO `SpotifyClone`.`artistas` (`artista_id`, `artista`) VALUES (DEFAULT, 'Lance Day');
INSERT INTO `SpotifyClone`.`artistas` (`artista_id`, `artista`) VALUES (DEFAULT, 'Peter Strong');

INSERT INTO `SpotifyClone`.`cancoes` (`cancao_id`, `cancao`, `album_id`) VALUES (DEFAULT, 'Soul For Us', 1);
INSERT INTO `SpotifyClone`.`cancoes` (`cancao_id`, `cancao`, `album_id`) VALUES (DEFAULT, 'Reflections Of Magic', 1);
INSERT INTO `SpotifyClone`.`cancoes` (`cancao_id`, `cancao`, `album_id`) VALUES (DEFAULT, 'Dance With Her Own', 1);
INSERT INTO `SpotifyClone`.`cancoes` (`cancao_id`, `cancao`, `album_id`) VALUES (DEFAULT, 'Troubles Of My Inner Fire', 2);
INSERT INTO `SpotifyClone`.`cancoes` (`cancao_id`, `cancao`, `album_id`) VALUES (DEFAULT, 'Time', 2);
INSERT INTO `SpotifyClone`.`cancoes` (`cancao_id`, `cancao`, `album_id`) VALUES (DEFAULT, 'Magic Circus', 3);
INSERT INTO `SpotifyClone`.`cancoes` (`cancao_id`, `cancao`, `album_id`) VALUES (DEFAULT, 'Honey, So Do I', 3);
INSERT INTO `SpotifyClone`.`cancoes` (`cancao_id`, `cancao`, `album_id`) VALUES (DEFAULT, 'Sweetie, Let\'s Go Wild', 3);
INSERT INTO `SpotifyClone`.`cancoes` (`cancao_id`, `cancao`, `album_id`) VALUES (DEFAULT, 'She Knows', 3);
INSERT INTO `SpotifyClone`.`cancoes` (`cancao_id`, `cancao`, `album_id`) VALUES (DEFAULT, 'Fantasy For Me', 4);
INSERT INTO `SpotifyClone`.`cancoes` (`cancao_id`, `cancao`, `album_id`) VALUES (DEFAULT, 'Celebration Of More', 4);
INSERT INTO `SpotifyClone`.`cancoes` (`cancao_id`, `cancao`, `album_id`) VALUES (DEFAULT, 'Rock His Everything', 4);
INSERT INTO `SpotifyClone`.`cancoes` (`cancao_id`, `cancao`, `album_id`) VALUES (DEFAULT, 'Home Forever', 4);
INSERT INTO `SpotifyClone`.`cancoes` (`cancao_id`, `cancao`, `album_id`) VALUES (DEFAULT, 'Diamond Power', 4);
INSERT INTO `SpotifyClone`.`cancoes` (`cancao_id`, `cancao`, `album_id`) VALUES (DEFAULT, 'Honey, Let\'s Be Silly', 4);
INSERT INTO `SpotifyClone`.`cancoes` (`cancao_id`, `cancao`, `album_id`) VALUES (DEFAULT, 'Thang Of Thunder', 5);
INSERT INTO `SpotifyClone`.`cancoes` (`cancao_id`, `cancao`, `album_id`) VALUES (DEFAULT, 'Words Of Her Life', 5);
INSERT INTO `SpotifyClone`.`cancoes` (`cancao_id`, `cancao`, `album_id`) VALUES (DEFAULT, 'Without My Streets', 5);

INSERT INTO `SpotifyClone`.`historico` (`usuario_id`, `cancao_id`) VALUES (1, 1);
INSERT INTO `SpotifyClone`.`historico` (`usuario_id`, `cancao_id`) VALUES (1, 6);
INSERT INTO `SpotifyClone`.`historico` (`usuario_id`, `cancao_id`) VALUES (1, 14);
INSERT INTO `SpotifyClone`.`historico` (`usuario_id`, `cancao_id`) VALUES (1, 16);
INSERT INTO `SpotifyClone`.`historico` (`usuario_id`, `cancao_id`) VALUES (2, 13);
INSERT INTO `SpotifyClone`.`historico` (`usuario_id`, `cancao_id`) VALUES (2, 17);
INSERT INTO `SpotifyClone`.`historico` (`usuario_id`, `cancao_id`) VALUES (2, 2);
INSERT INTO `SpotifyClone`.`historico` (`usuario_id`, `cancao_id`) VALUES (2, 15);
INSERT INTO `SpotifyClone`.`historico` (`usuario_id`, `cancao_id`) VALUES (3, 4);
INSERT INTO `SpotifyClone`.`historico` (`usuario_id`, `cancao_id`) VALUES (3, 16);
INSERT INTO `SpotifyClone`.`historico` (`usuario_id`, `cancao_id`) VALUES (3, 6);
INSERT INTO `SpotifyClone`.`historico` (`usuario_id`, `cancao_id`) VALUES (4, 3);
INSERT INTO `SpotifyClone`.`historico` (`usuario_id`, `cancao_id`) VALUES (4, 18);
INSERT INTO `SpotifyClone`.`historico` (`usuario_id`, `cancao_id`) VALUES (4, 11);

INSERT INTO `SpotifyClone`.`planos` (`id_plano`, `plano`, `preco`) VALUES (DEFAULT, 'gratuito', 0);
INSERT INTO `SpotifyClone`.`planos` (`id_plano`, `plano`, `preco`) VALUES (DEFAULT, 'universitário', 5.99);
INSERT INTO `SpotifyClone`.`planos` (`id_plano`, `plano`, `preco`) VALUES (DEFAULT, 'familiar', 7.99);

INSERT INTO `SpotifyClone`.`seguidores` (`usuario_id`, `artista_id`) VALUES (1, 1);
INSERT INTO `SpotifyClone`.`seguidores` (`usuario_id`, `artista_id`) VALUES (1, 2);
INSERT INTO `SpotifyClone`.`seguidores` (`usuario_id`, `artista_id`) VALUES (1, 3);
INSERT INTO `SpotifyClone`.`seguidores` (`usuario_id`, `artista_id`) VALUES (2, 1);
INSERT INTO `SpotifyClone`.`seguidores` (`usuario_id`, `artista_id`) VALUES (2, 3);
INSERT INTO `SpotifyClone`.`seguidores` (`usuario_id`, `artista_id`) VALUES (3, 4);
INSERT INTO `SpotifyClone`.`seguidores` (`usuario_id`, `artista_id`) VALUES (3, 1);
INSERT INTO `SpotifyClone`.`seguidores` (`usuario_id`, `artista_id`) VALUES (4, 2);

INSERT INTO `SpotifyClone`.`usuarios` (`usuario_id`, `usuario`, `idade`, `id_plano`) VALUES (DEFAULT, 'Thati', 23, 1);
INSERT INTO `SpotifyClone`.`usuarios` (`usuario_id`, `usuario`, `idade`, `id_plano`) VALUES (DEFAULT, 'Cintia', 35, 3);
INSERT INTO `SpotifyClone`.`usuarios` (`usuario_id`, `usuario`, `idade`, `id_plano`) VALUES (DEFAULT, 'Bill', 20, 2);
INSERT INTO `SpotifyClone`.`usuarios` (`usuario_id`, `usuario`, `idade`, `id_plano`) VALUES (DEFAULT, 'Roger', 45, 1);

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

DROP DATABASE IF EXISTS `SpotifyClone`;
CREATE DATABASE IF NOT EXISTS `SpotifyClone`;
USE `SpotifyClone`;

CREATE TABLE IF NOT EXISTS `albuns` (
  `album_id` INT NOT NULL AUTO_INCREMENT,
  `album` VARCHAR(45) NULL DEFAULT NULL,
  `artista_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`album_id`),
  CONSTRAINT `fk_albuns_artistas`
    FOREIGN KEY (`artista_id`) REFERENCES `artistas` (`artista_id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `artistas` (
  `artista_id` INT NOT NULL AUTO_INCREMENT,
  `artista` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`artista_id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `cancoes` (
  `cancao_id` INT NOT NULL AUTO_INCREMENT,
  `cancao` VARCHAR(45) NULL DEFAULT NULL,
  `album_id` INT NULL DEFAULT NULL,
  PRIMARY KEY (`cancao_id`),
  CONSTRAINT `fk_cancoes_albuns`
    FOREIGN KEY (`album_id`) REFERENCES `albuns` (`album_id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `planos` (
  `id_plano` INT NOT NULL AUTO_INCREMENT,
  `plano` VARCHAR(45) NULL DEFAULT NULL,
  `preco` DECIMAL(10,2) NULL DEFAULT NULL,
  PRIMARY KEY (`id_plano`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `seguidores` (
  `usuario_id` INT NOT NULL,
  `artista_id` INT NOT NULL,
  PRIMARY KEY (`usuario_id`, `artista_id`),
  CONSTRAINT `fk_seguidores_artistas`
    FOREIGN KEY (`artista_id`) REFERENCES `artistas` (`artista_id`),
  CONSTRAINT `fk_seguidores_usuarios`
    FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`usuario_id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `usuarios` (
  `usuario_id` INT NOT NULL AUTO_INCREMENT,
  `usuario` VARCHAR(45) NOT NULL,
  `idade` INT NULL DEFAULT NULL,
  `id_plano` INT NULL DEFAULT NULL,
  PRIMARY KEY (`usuario_id`),
  CONSTRAINT `fk_usuarios_planos`
    FOREIGN KEY (`id_plano`) REFERENCES `planos` (`id_plano`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `historico` (
  `usuario_id` INT NOT NULL,
  `cancao_id` INT NOT NULL,
  PRIMARY KEY (`usuario_id`, `cancao_id`),
  CONSTRAINT `fk_historico_usuarios`
    FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`usuario_id`),
  CONSTRAINT `fk_historico_cancoes`
    FOREIGN KEY (`cancao_id`) REFERENCES `cancoes` (`cancao_id`))
ENGINE = InnoDB;

INSERT INTO `albuns` (`album_id`, `album`, `artista_id`) VALUES (DEFAULT, 'Envious', 1);
INSERT INTO `albuns` (`album_id`, `album`, `artista_id`) VALUES (DEFAULT, 'Exuberant', 1);
INSERT INTO `albuns` (`album_id`, `album`, `artista_id`) VALUES (DEFAULT, 'Hallowed Steam', 4);
INSERT INTO `albuns` (`album_id`, `album`, `artista_id`) VALUES (DEFAULT, 'Incandescent', 3);
INSERT INTO `albuns` (`album_id`, `album`, `artista_id`) VALUES (DEFAULT, 'Temporary Culture', 2);

INSERT INTO `artistas` (`artista_id`, `artista`) VALUES (DEFAULT, 'Walter Phoenix');
INSERT INTO `artistas` (`artista_id`, `artista`) VALUES (DEFAULT, 'Freedie Shannon');
INSERT INTO `artistas` (`artista_id`, `artista`) VALUES (DEFAULT, 'Lance Day');
INSERT INTO `artistas` (`artista_id`, `artista`) VALUES (DEFAULT, 'Peter Strong');

INSERT INTO `cancoes` (`cancao_id`, `cancao`, `album_id`) VALUES (DEFAULT, 'Soul For Us', 1);
INSERT INTO `cancoes` (`cancao_id`, `cancao`, `album_id`) VALUES (DEFAULT, 'Reflections Of Magic', 1);
INSERT INTO `cancoes` (`cancao_id`, `cancao`, `album_id`) VALUES (DEFAULT, 'Dance With Her Own', 1);
INSERT INTO `cancoes` (`cancao_id`, `cancao`, `album_id`) VALUES (DEFAULT, 'Troubles Of My Inner Fire', 2);
INSERT INTO `cancoes` (`cancao_id`, `cancao`, `album_id`) VALUES (DEFAULT, 'Time', 2);
INSERT INTO `cancoes` (`cancao_id`, `cancao`, `album_id`) VALUES (DEFAULT, 'Magic Circus', 3);
INSERT INTO `cancoes` (`cancao_id`, `cancao`, `album_id`) VALUES (DEFAULT, 'Honey, So Do I', 3);
INSERT INTO `cancoes` (`cancao_id`, `cancao`, `album_id`) VALUES (DEFAULT, 'Sweetie, Let\'s Go Wild', 3);
INSERT INTO `cancoes` (`cancao_id`, `cancao`, `album_id`) VALUES (DEFAULT, 'She Knows', 3);
INSERT INTO `cancoes` (`cancao_id`, `cancao`, `album_id`) VALUES (DEFAULT, 'Fantasy For Me', 4);
INSERT INTO `cancoes` (`cancao_id`, `cancao`, `album_id`) VALUES (DEFAULT, 'Celebration Of More', 4);
INSERT INTO `cancoes` (`cancao_id`, `cancao`, `album_id`) VALUES (DEFAULT, 'Rock His Everything', 4);
INSERT INTO `cancoes` (`cancao_id`, `cancao`, `album_id`) VALUES (DEFAULT, 'Home Forever', 4);
INSERT INTO `cancoes` (`cancao_id`, `cancao`, `album_id`) VALUES (DEFAULT, 'Diamond Power', 4);
INSERT INTO `cancoes` (`cancao_id`, `cancao`, `album_id`) VALUES (DEFAULT, 'Honey, Let\'s Be Silly', 4);
INSERT INTO `cancoes` (`cancao_id`, `cancao`, `album_id`) VALUES (DEFAULT, 'Thang Of Thunder', 5);
INSERT INTO `cancoes` (`cancao_id`, `cancao`, `album_id`) VALUES (DEFAULT, 'Words Of Her Life', 5);
INSERT INTO `cancoes` (`cancao_id`, `cancao`, `album_id`) VALUES (DEFAULT, 'Without My Streets', 5);

INSERT INTO `historico` (`usuario_id`, `cancao_id`) VALUES (1, 1);
INSERT INTO `historico` (`usuario_id`, `cancao_id`) VALUES (1, 6);
INSERT INTO `historico` (`usuario_id`, `cancao_id`) VALUES (1, 14);
INSERT INTO `historico` (`usuario_id`, `cancao_id`) VALUES (1, 16);
INSERT INTO `historico` (`usuario_id`, `cancao_id`) VALUES (2, 13);
INSERT INTO `historico` (`usuario_id`, `cancao_id`) VALUES (2, 17);
INSERT INTO `historico` (`usuario_id`, `cancao_id`) VALUES (2, 2);
INSERT INTO `historico` (`usuario_id`, `cancao_id`) VALUES (2, 15);
INSERT INTO `historico` (`usuario_id`, `cancao_id`) VALUES (3, 4);
INSERT INTO `historico` (`usuario_id`, `cancao_id`) VALUES (3, 16);
INSERT INTO `historico` (`usuario_id`, `cancao_id`) VALUES (3, 6);
INSERT INTO `historico` (`usuario_id`, `cancao_id`) VALUES (4, 3);
INSERT INTO `historico` (`usuario_id`, `cancao_id`) VALUES (4, 18);
INSERT INTO `historico` (`usuario_id`, `cancao_id`) VALUES (4, 11);

INSERT INTO `planos` (`id_plano`, `plano`, `preco`) VALUES (DEFAULT, 'gratuito', 0);
INSERT INTO `planos` (`id_plano`, `plano`, `preco`) VALUES (DEFAULT, 'universitário', 5.99);
INSERT INTO `planos` (`id_plano`, `plano`, `preco`) VALUES (DEFAULT, 'familiar', 7.99);

INSERT INTO `seguidores` (`usuario_id`, `artista_id`) VALUES (1, 1);
INSERT INTO `seguidores` (`usuario_id`, `artista_id`) VALUES (1, 2);
INSERT INTO `seguidores` (`usuario_id`, `artista_id`) VALUES (1, 3);
INSERT INTO `seguidores` (`usuario_id`, `artista_id`) VALUES (2, 1);
INSERT INTO `seguidores` (`usuario_id`, `artista_id`) VALUES (2, 3);
INSERT INTO `seguidores` (`usuario_id`, `artista_id`) VALUES (3, 4);
INSERT INTO `seguidores` (`usuario_id`, `artista_id`) VALUES (3, 1);
INSERT INTO `seguidores` (`usuario_id`, `artista_id`) VALUES (4, 2);

INSERT INTO `usuarios` (`usuario_id`, `usuario`, `idade`, `id_plano`) VALUES (DEFAULT, 'Thati', 23, 1);
INSERT INTO `usuarios` (`usuario_id`, `usuario`, `idade`, `id_plano`) VALUES (DEFAULT, 'Cintia', 35, 3);
INSERT INTO `usuarios` (`usuario_id`, `usuario`, `idade`, `id_plano`) VALUES (DEFAULT, 'Bill', 20, 2);
INSERT INTO `usuarios` (`usuario_id`, `usuario`, `idade`, `id_plano`) VALUES (DEFAULT, 'Roger', 45, 1);

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

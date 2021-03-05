DROP DATABASE IF EXISTS `SpotifyClone`;
CREATE SCHEMA `SpotifyClone` ;
USE `SpotifyClone` ;

-- -----------------------------
-- Table `SpotifyClone`.`album`
-- -----------------------------

CREATE TABLE `album` (
  `album_id` INT NOT NULL AUTO_INCREMENT,
  `album_nome` VARCHAR(200) NOT NULL,
  `artista_id` INT NOT NULL,
  PRIMARY KEY (`album_id`, `artista_id`),
  FOREIGN KEY (`artista_id`)
  REFERENCES `artista` (`artista_id`))
ENGINE = InnoDB;

INSERT INTO `album`
VALUES
  (1, 'Envious', 1),
  (2, 'Exuberant', 1),
  (3, 'Hallowed Steam', 2),
  (4, 'Incandescent', 3),
  (5, 'Temporary Culture', 4)
;

-- -------------------------------
-- Table `SpotifyClone`.`artista`
-- -------------------------------

CREATE TABLE `artista` (
  `artista_id` INT NOT NULL AUTO_INCREMENT,
  `artista_nome` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`artista_id`))
ENGINE = InnoDB;

INSERT INTO `artista`
VALUES
  (1, 'Walter Phoenix'),
  (2, 'Peter Strong'),
  (3, 'Lance Day'),
  (4, 'Freedie Shannon')
;

-- -----------------------------------------
-- Table `SpotifyClone`.`artistas_seguidos`
-- -----------------------------------------

CREATE TABLE `artistas_seguidos` (
  `artista_id` INT NOT NULL,
  `usuario_id` INT NOT NULL,
  PRIMARY KEY (`artista_id`, `usuario_id`),
  FOREIGN KEY (`usuario_id`)
  REFERENCES `usuario` (`usuario_id`),
  FOREIGN KEY (`artista_id`)
  REFERENCES `artista` (`artista_id`))
ENGINE = InnoDB;

INSERT INTO `artistas_seguidos`
VALUES
  (1, 1),
  (1, 4),
  (1, 5),
  (2, 1),
  (2, 4),
  (3, 1),
  (3, 4),
  (4, 5)
;

-- -------------------------------
-- Table `SpotifyClone`.`cancoes`
-- -------------------------------

CREATE TABLE `cancoes` (
  `cancoes_id` INT NOT NULL AUTO_INCREMENT,
  `cancoes_nome` VARCHAR(200) NOT NULL,
  `album_id` INT NOT NULL,
  PRIMARY KEY (`cancoes_id`),
  FOREIGN KEY (`album_id`)
  REFERENCES `album` (`album_id`))
ENGINE = InnoDB;

INSERT INTO `cancoes`
VALUES
  (1, 'Soul For Us', 1),
  (2, 'Reflections Of Magic', 1),
  (3, 'Dance With Her Own', 1),
  (4, 'Troubles Of My Inner Fire', 2),
  (5, 'Time Fireworks', 2),
  (6, 'Magic Circus', 3),
  (7, 'Honey, So Do I', 3),
  (8, "Sweetie, Let's Go Wild", 3),
  (9, 'She Knows', 3),
  (10, 'Fantasy For Me', 4),
  (11, 'Celebration Of More', 4),
  (12, 'Rock His Everything', 4),
  (13, 'Home Forever', 4),
  (14, 'Diamond Power', 4),
  (15, "Honey, Let's Be Silly", 4),
  (16, 'Thang Of Thunder', 5),
  (17, 'Words Of Her Life', 5),
  (18, 'Without My Streets', 5)
;

-- ---------------------------------------------
-- Table `SpotifyClone`.`historico_reproducoes`
-- ---------------------------------------------

CREATE TABLE `historico_reproducoes` (
  `usuario_id` INT NOT NULL,
  `cancoes_id` INT NOT NULL,
  PRIMARY KEY (`usuario_id`, `cancoes_id`),
  FOREIGN KEY (`usuario_id`)
  REFERENCES `usuario` (`usuario_id`),
  FOREIGN KEY (`cancoes_id`)
  REFERENCES `cancoes` (`cancoes_id`))
ENGINE = InnoDB;

INSERT INTO `historico_reproducoes`
VALUES
  (1, 1),
  (1, 6),
  (1, 14),
  (1, 16),
  (2, 2),
  (2, 13),
  (2, 15),
  (2, 17),
  (3, 4),
  (3, 6),
  (3, 16),
  (4, 3),
  (4, 11),
  (4, 18)
;

-- -----------------------------
-- Table `SpotifyClone`.`plano`
-- -----------------------------

CREATE TABLE IF NOT EXISTS `plano` (
  `plano_id` INT NOT NULL AUTO_INCREMENT,
  `tipo_plano` VARCHAR(45) NOT NULL,
  `valor_plano` FLOAT NOT NULL,
  PRIMARY KEY (`plano_id`))
ENGINE = InnoDB;

INSERT INTO `plano`
VALUES
  (1, 'gratuito', 0.00),
  (2, 'universitário', 5.99),
  (3, 'familiar', 7.99)
;

-- -------------------------------
-- Table `SpotifyClone`.`usuario`
-- -------------------------------

CREATE TABLE `usuario` (
  `usuario_id` INT NOT NULL AUTO_INCREMENT,
  `usuario_nome` VARCHAR(100) NOT NULL,
  `idade` INT,
  `plano_id` INT NOT NULL,
  PRIMARY KEY (`usuario_id`),
  FOREIGN KEY (`plano_id`)
  REFERENCES `plano` (`plano_id`)) 
ENGINE = InnoDB;

INSERT INTO `usuario`
VALUES
  (1, 'Thati', 23, 1),
  (2, 'Cintia', 35, 3),
  (3, 'Bill', 20, 2),
  (4, 'Roger', 45, 1)
;

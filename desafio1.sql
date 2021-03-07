-- -----------------------------------------------------
-- Schema SpotifyClone
-- -----------------------------------------------------
DROP DATABASE IF EXISTS SpotifyClone;
CREATE SCHEMA IF NOT EXISTS `SpotifyClone` ;
USE `SpotifyClone` ;
-- -----------------------------------------------------
-- Table `SpotifyClone`.`planos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`planos` (
  `plano_id` INT NOT NULL AUTO_INCREMENT ,
  `plano` VARCHAR(45) NOT NULL,
  `valor_plano` DECIMAL(5, 2) NOT NULL,
  PRIMARY KEY (`plano_id`))
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `SpotifyClone`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`usuarios` (
  `usuario_id` INT NOT NULL AUTO_INCREMENT,
  `usuario` VARCHAR(45) NOT NULL,
  `idade` INT NOT NULL,
  `plano_id` INT NOT NULL,
  PRIMARY KEY (`usuario_id`),
  CONSTRAINT `plano_id`
    FOREIGN KEY (`plano_id`)
    REFERENCES `SpotifyClone`.`planos` (`plano_id`)) 
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `SpotifyClone`.`artistas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`artistas` (
  `artista_id` INT NOT NULL AUTO_INCREMENT,
  `artista` VARCHAR(45) NULL,
  PRIMARY KEY (`artista_id`))
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `SpotifyClone`.`albuns`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`albuns` (
  `album_id` INT NOT NULL AUTO_INCREMENT,
  `album` VARCHAR(45) NULL,
  `artista_id` INT NULL,
  PRIMARY KEY (`album_id`),
  CONSTRAINT `artista_id`
    FOREIGN KEY (`artista_id`)
    REFERENCES `SpotifyClone`.`artistas` (`artista_id`))
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `SpotifyClone`.`cancoes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`cancoes` (
  `cancao_id` INT NOT NULL AUTO_INCREMENT,
  `cancao` VARCHAR(45) NOT NULL,
  `album_id` INT NULL,
  PRIMARY KEY (`cancao_id`),
  CONSTRAINT `album_id`
    FOREIGN KEY (`album_id`)
    REFERENCES `SpotifyClone`.`albuns` (`album_id`))
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `SpotifyClone`.`historico_de_reproducoes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`historico_de_reproducoes` (
  `usuario_id` INT NOT NULL,
  `cancao_id` INT NOT NULL,
  PRIMARY KEY (`usuario_id`, `cancao_id`),
  CONSTRAINT `usuario_id`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `SpotifyClone`.`usuarios` (`usuario_id`),  
  CONSTRAINT `cancao_id`
    FOREIGN KEY (`cancao_id`)
    REFERENCES `SpotifyClone`.`cancoes` (`cancao_id`))
ENGINE = InnoDB;
-- -----------------------------------------------------
-- Table `SpotifyClone`.`seguindo_artista`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`seguindo_artista` (
  `usuario` INT NOT NULL,
  `artista` INT NOT NULL,
  PRIMARY KEY (`usuario`, `artista`),  
  CONSTRAINT `usuario`
    FOREIGN KEY (`usuario`)
    REFERENCES `SpotifyClone`.`usuarios` (`usuario_id`),    
  CONSTRAINT `artista`
    FOREIGN KEY (`artista`)
    REFERENCES `SpotifyClone`.`artistas` (`artista_id`))   
ENGINE = InnoDB;

INSERT INTO planos(plano, valor_plano)
VALUES
  ('gratuito', 0.00),
  ('universitario', 5.99),
  ('familiar', 7.99);

INSERT INTO usuarios(usuario, idade, plano_id)
VALUES
('Thati', 23, 1),
('Cintia', 35, 3),
('Bill', 20, 2),
('Roger', 45, 1);

INSERT INTO artistas(artista)
VALUES
('Walter Phoenix'),
('Peter Strong'),
('Lance Day'),
('Freedie Shannon');

INSERT INTO albuns(album, artista_id)
VALUES
('Envious', 1),
('Exuberant', 1),
('Hallowed Steam', 2),
('Incandescent', 3),
('Temporary Culture', 4);

INSERT INTO cancoes(cancao, album_id)
VALUES
('Soul For Us', 1),
('Reflections Of Magic', 1),
('Dance With Her Own', 1),
('Troubles Of My Inner Fire', 2),
('Time Fireworks', 2),
('Magic Circus', 3),
('Honey, So Do I', 3),
("Sweetie, Let's Go Wild", 3),
('She Knows', 3),
('Fantasy For Me', 4),
('Celebration Of More', 4),
('Rock His Everything', 4),
('Home Forever', 4),
('Diamond Power', 4),
("Honey, Let's Be Silly", 4),
('Thang Of Thunder', 5),
('Words Of Her Life', 5),
('Without My Streets', 5);

INSERT INTO historico_de_reproducoes(usuario_id, cancao_id)
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
(4, 18);

INSERT INTO seguindo_artista(usuario, artista)
VALUES 
(1, 1),
(1, 3),
(1, 4),
(2, 1),
(2, 3),
(3, 1),
(3, 2),
(4, 4);

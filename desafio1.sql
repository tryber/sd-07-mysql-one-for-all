DROP DATABASE IF EXISTS SpotifyClone;

CREATE SCHEMA `SpotifyClone`;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`planos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `valor` DECIMAL(6,2) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`artistas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`albuns` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `id_artista` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_artista_idx` (`id_artista` ASC),
  CONSTRAINT `fk_artista`
    FOREIGN KEY (`id_artista`)
    REFERENCES `SpotifyClone`.`artistas` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`cancoes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `id_album` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_album_idx` (`id_album` ASC),
  CONSTRAINT `fk_album`
    FOREIGN KEY (`id_album`)
    REFERENCES `SpotifyClone`.`albuns` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`usuarios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `idade` INT NOT NULL,
  `id_plano` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_plano_idx` (`id_plano` ASC),
  CONSTRAINT `fk_plano`
    FOREIGN KEY (`id_plano`)
    REFERENCES `SpotifyClone`.`planos` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`seguidores` (
  `id_usuario` INT NOT NULL,
  `id_artista` INT NOT NULL,
  PRIMARY KEY (`id_usuario`, `id_artista`),
  INDEX `fk_artista_seguido_idx` (`id_artista` ASC),
  CONSTRAINT `fk_artista_seguido`
    FOREIGN KEY (`id_artista`)
    REFERENCES `SpotifyClone`.`artistas` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_usuario_seguidor`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `SpotifyClone`.`usuarios` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`reproducoes` (
  `id_usuario` INT NOT NULL,
  `id_cancao` INT NOT NULL,
  PRIMARY KEY (`id_usuario`, `id_cancao`),
  INDEX `fk_cancao_reproduzida_idx` (`id_cancao` ASC),
  CONSTRAINT `fk_usuario_reproducao`
    FOREIGN KEY (`id_usuario`)
    REFERENCES `SpotifyClone`.`usuarios` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_cancao_reproduzida`
    FOREIGN KEY (`id_cancao`)
    REFERENCES `SpotifyClone`.`cancoes` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;

USE SpotifyClone;

INSERT INTO planos (nome, valor)
VALUES
  ('gratuito', 0),
  ('familiar', 7.99),
  ('universitario', 5.99);
  
INSERT INTO artistas (nome)
VALUES  
('Walter Phoenix'),
('Peter Strong'),
('Lance Day'),
('Freedie Shannon');

INSERT INTO albuns (id_artista, nome)
VALUES
(1, 'Envious'),
(1, 'Exuberant'),
(2, 'Hallowed Steam'),
(3, 'Incandescent'),
(4, 'Temporary Culture');

INSERT INTO cancoes (id_album, nome)
VALUES
(1, 'Soul For Us'),
(1, 'Reflections Of Magic'),
(1, 'Dance With Her Own'),
(2, 'Troubles Of My Inner Fire'),
(2, 'Time Fireworks'),
(3, 'Magic Circus'),
(3, 'Honey, So Do I'),
(3, "Sweetie, Let's Go Wild"),
(3, 'She Knows'),
(4, 'Fantasy For Me'),
(4, 'Celebration Of More'),
(4, 'Rock His Everything'),
(4, 'Home Forever'),
(4, 'Diamond Power'),
(4, "Honey, Let's Be Silly"),
(5, 'Thang Of Thunder'),
(5, 'Words Of Her Life'),
(5, 'Without My Streets');

INSERT INTO usuarios (nome, idade, id_plano)
VALUES
('Thati',	23, 1),
('Cintia',	35, 2),
('Bill',	20, 3),
('Roger',	45, 1);

INSERT INTO reproducoes (id_usuario, id_cancao)
VALUES
(1, 1) , (1, 6), (1, 14), (1, 16),
(2, 13), (2, 17), (2, 2), (2, 15),
(3, 4), (3, 16), (3, 6),
(4, 3), (4, 18), (4, 11);

INSERT INTO seguidores (id_usuario, id_artista)
VALUES 
(1, 1), (1, 4), (1, 3),
(2, 1), (2, 3),
(3, 2), (3, 1),
(4, 4);

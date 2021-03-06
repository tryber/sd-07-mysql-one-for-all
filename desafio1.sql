DROP database if exists SpotifyClone;

CREATE database SpotifyClone;

CREATE SCHEMA IF NOT EXISTS SpotifyClone;

USE SpotifyClone;

DROP TABLE IF EXISTS plano;

CREATE TABLE IF NOT EXISTS SpotifyClone.plano (
  `plano_id` INT NOT NULL AUTO_INCREMENT,
  `plano_nome` VARCHAR(45) NOT NULL,
  `valor_plano` FLOAT NOT NULL,
  PRIMARY KEY (`plano_id`)
) ENGINE = InnoDB;


DROP TABLE IF EXISTS usuario;

CREATE TABLE IF NOT EXISTS SpotifyClone.usuario (
  `usuario_id` INT NOT NULL AUTO_INCREMENT,
  `usuario_nome` VARCHAR(45) NOT NULL,
  `idade` INT NOT NULL,
  `plano_id` INT NOT NULL,
  PRIMARY KEY (`usuario_id`),
  INDEX `plano_id_idx` (`plano_id` ASC) VISIBLE,
  CONSTRAINT `plano_id_usuario_fk` FOREIGN KEY (`plano_id`) REFERENCES SpotifyClone.plano (`plano_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB;

DROP TABLE IF EXISTS artista;

CREATE TABLE IF NOT EXISTS SpotifyClone.artista (
  `artista_id` INT NOT NULL AUTO_INCREMENT,
  `artista_nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`artista_id`)
) ENGINE = InnoDB;

DROP TABLE IF EXISTS album;

CREATE TABLE IF NOT EXISTS SpotifyClone.album (
  `album_id` INT NOT NULL AUTO_INCREMENT,
  `album_nome` VARCHAR(45) NOT NULL,
  `artista_id` INT NOT NULL,
  PRIMARY KEY (`album_id`),
  INDEX `artista_id_idx` (`artista_id` ASC) VISIBLE,
  CONSTRAINT `artista_id_album_fk` FOREIGN KEY (`artista_id`) REFERENCES SpotifyClone.artista (`artista_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB;

DROP TABLE IF EXISTS musica;

CREATE TABLE IF NOT EXISTS SpotifyClone.musica (
  `musica_id` INT NOT NULL AUTO_INCREMENT,
  `musica_nome` VARCHAR(45) NOT NULL,
  `artista_id` INT NOT NULL,
  `album_id` INT NOT NULL,
  PRIMARY KEY (`musica_id`),
  INDEX `artista_id_idx` (`artista_id` ASC) VISIBLE,
  INDEX `album_id_idx` (`album_id` ASC) VISIBLE,
  CONSTRAINT `artista_id_musica_fk` FOREIGN KEY (`artista_id`) REFERENCES SpotifyClone.artista (`artista_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `album_id_musica_fk` FOREIGN KEY (`album_id`) REFERENCES SpotifyClone.album (`album_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB;

DROP TABLE IF EXISTS historico;

CREATE TABLE IF NOT EXISTS SpotifyClone.historico (
  `historico_id` INT NOT NULL AUTO_INCREMENT,
  `usuario_id` INT NOT NULL,
  `musica_id` INT NOT NULL,
  PRIMARY KEY (`historico_id`),
  INDEX `usuario_id_idx` (`usuario_id` ASC) VISIBLE,
  INDEX `musica_id_idx` (`musica_id` ASC) VISIBLE,
  CONSTRAINT `usuario_id_historico_fk` FOREIGN KEY (`usuario_id`) REFERENCES SpotifyClone.usuario (`usuario_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `musica_id_historico_fk` FOREIGN KEY (`musica_id`) REFERENCES SpotifyClone.musica (`musica_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB;

DROP TABLE IF EXISTS seguindo;

CREATE TABLE IF NOT EXISTS SpotifyClone.seguindo (
  `seguindo_id` INT NOT NULL AUTO_INCREMENT,
  `usuario_id` INT NOT NULL,
  `artista_id` INT NOT NULL,
  PRIMARY KEY (`seguindo_id`),
  INDEX `usuario_id_idx` (`usuario_id` ASC) VISIBLE,
  INDEX `artista_id_idx` (`artista_id` ASC) VISIBLE,
  CONSTRAINT `usuario_id_seguindo_fk` FOREIGN KEY (`usuario_id`) REFERENCES SpotifyClone.usuario (`usuario_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `artista_id_seguindo_fk` FOREIGN KEY (`artista_id`) REFERENCES SpotifyClone.artista (`artista_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB;

LOCK TABLES plano WRITE;

INSERT INTO plano (`plano_id`, `plano_nome`, `valor_plano`)
VALUES (DEFAULT, 'gratuito', 0),
  (DEFAULT, 'familiar', 7.99),
  (DEFAULT, 'universitário', 5.99);

UNLOCK TABLES;

LOCK TABLES usuario WRITE;

INSERT INTO usuario (`usuario_id`, `usuario_nome`, `idade`, `plano_id`)
VALUES (DEFAULT, 'Thati', 23, 1),
  (DEFAULT, 'Cintia', 35, 2),
  (DEFAULT, 'Bill', 20, 3),
  (DEFAULT, 'Roger', 45, 1);

UNLOCK TABLES;

LOCK TABLES artista WRITE;

INSERT INTO artista (`artista_id`, `artista_nome`)
VALUES (DEFAULT, 'Walter Phoenix'),
  (DEFAULT, 'Peter Strong'),
  (DEFAULT, 'Lance Day'),
  (DEFAULT, 'Freedie Shannon');

UNLOCK TABLES;

LOCK TABLES album WRITE;

INSERT INTO album (`album_id`, `album_nome`, `artista_id`)
VALUES (DEFAULT, 'Envious', 1),
  (DEFAULT, 'Exuberant', 1),
  (DEFAULT, 'Hallowed Steam', 2),
  (DEFAULT, 'Incandescent', 3),
  (DEFAULT, 'Temporary Culture', 4);

UNLOCK TABLES;

LOCK TABLES musica WRITE;

INSERT INTO musica (`musica_id`, `musica_nome`, `artista_id`, `album_id`)
VALUES (DEFAULT, "Soul For Us", 1, 1),
  (DEFAULT, "Reflections Of Magic", 1, 1),
  (DEFAULT, "Dance With Her Own", 1, 1),
  (DEFAULT, "Troubles Of My Inner Fire", 1, 2),
  (DEFAULT, "Time Fireworks", 1, 2),
  (DEFAULT, "Magic Circus", 2, 3),
  (DEFAULT, "Honey, So Do I", 2, 3),
  (DEFAULT, "Sweetie, Let's Go Wild", 2, 3),
  (DEFAULT, "She Knows", 2, 3),
  (DEFAULT, "Fantasy For Me", 3, 4),
  (DEFAULT, "Celebration Of More", 3, 4),
  (DEFAULT, "Rock His Everything", 3, 4),
  (DEFAULT, "Home Forever", 3, 4),
  (DEFAULT, "Diamond Power", 3, 4),
  (DEFAULT, "Honey, Let's Be Silly", 3, 4),
  (DEFAULT, "Thang Of Thunder", 4, 5),
  (DEFAULT, "Words Of Her Life", 4, 5),
  (DEFAULT, "Without My Streets", 4, 5);

UNLOCK TABLES;

LOCK TABLES historico WRITE;

INSERT INTO historico (`historico_id`, `usuario_id`, `musica_id`)
VALUES (DEFAULT, 1, 1),
  (DEFAULT, 1, 6),
  (DEFAULT, 1, 14),
  (DEFAULT, 1, 16),
  (DEFAULT, 2, 13),
  (DEFAULT, 2, 17),
  (DEFAULT, 2, 2),
  (DEFAULT, 2, 15),
  (DEFAULT, 3, 4),
  (DEFAULT, 3, 16),
  (DEFAULT, 3, 6),
  (DEFAULT, 4, 3),
  (DEFAULT, 4, 18),
  (DEFAULT, 4, 11);

UNLOCK TABLES;

LOCK TABLES seguindo WRITE;

INSERT INTO seguindo (`seguindo_id`, `usuario_id`, `artista_id`)
VALUES (DEFAULT, 1, 1),
  (DEFAULT, 1, 4),
  (DEFAULT, 1, 3),
  (DEFAULT, 2, 1),
  (DEFAULT, 2, 3),
  (DEFAULT, 3, 2),
  (DEFAULT, 3, 1),
  (DEFAULT, 4, 4);

UNLOCK TABLES;

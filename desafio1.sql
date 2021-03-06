DROP DATABASE IF EXISTS SpotifyClone ;
CREATE DATABASE IF NOT EXISTS SpotifyClone ;
USE SpotifyClone ;

CREATE TABLE planos (
  plano_id INT PRIMARY KEY AUTO_INCREMENT,
  plano_nome VARCHAR(45) NOT NULL,
  plano_valor DOUBLE NOT NULL)
ENGINE = InnoDB;

CREATE TABLE usuarios (
  usuario_id INT PRIMARY KEY  AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  idade INT NULL,
  plano_id INT NULL,
  FOREIGN KEY (plano_id) REFERENCES planos (plano_id))
ENGINE = InnoDB;

CREATE TABLE artistas (
  artista_id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(45) NOT NULL,
  sobrenome VARCHAR(45) NULL)
ENGINE = InnoDB;

CREATE TABLE albuns (
  album_id INT PRIMARY KEY AUTO_INCREMENT,
  album VARCHAR(45) NOT NULL,
  artista_id INT NOT NULL,
  FOREIGN KEY (artista_id) REFERENCES artistas (artista_id))
ENGINE = InnoDB;

CREATE TABLE cancoes (
  cancao_id INT PRIMARY KEY AUTO_INCREMENT,
  cancao_title VARCHAR(100) NOT NULL,
  album_id INT NOT NULL,
  artista_id INT NOT NULL,
  FOREIGN KEY (artista_id) REFERENCES artistas (artista_id),
  FOREIGN KEY (artista_id) REFERENCES albuns (album_id))
ENGINE = InnoDB;

CREATE TABLE seguindo_artistas (
  artista_id INT NOT NULL,
  usuario_id INT NOT NULL,
  PRIMARY KEY (artista_id, usuario_id),
  FOREIGN KEY (artista_id) REFERENCES artistas (artista_id),
  FOREIGN KEY (usuario_id) REFERENCES usuarios (usuario_id))
ENGINE = InnoDB;

CREATE TABLE historico_de_reproducoes (
  usuario_id INT NOT NULL,
  cancao_id INT NOT NULL,
  PRIMARY KEY (usuario_id, cancao_id),
  FOREIGN KEY (usuario_id) REFERENCES usuarios (usuario_id),
  FOREIGN KEY (cancao_id) REFERENCES cancoes (cancao_id))
ENGINE = InnoDB;

INSERT INTO SpotifyClone.planos VALUES (1,'gratuito', 0), (2,'familiar', 7.99), (3,'universitário', 5.99);
INSERT INTO SpotifyClone.usuarios VALUES
(1,'Thati', 23, 1),
(2,'Cintia', 35, 2),
(3,'Bill', 20, 3),
(4,'Roger', 45, 1);
INSERT INTO SpotifyClone.artistas VALUES
(1,'Walter', 'Phoenix'),
(2,'Peter', 'Strong'),
(3,'Lance', 'Day'),
(4,'Freedie', 'Shannon');
INSERT INTO SpotifyClone.albuns VALUES
(1,'Envious', 1),
(2,'Exuberant', 1),
(3,'Hallowed Steam', 2),
(4,'Incandescent', 3),
(5,'Temporary Culture', 4);
INSERT INTO SpotifyClone.cancoes VALUES
(1,'Soul For Us', 1, 1), (2,'Reflections Of Magic', 1, 1), (3,'Dance With Her Own', 1, 1),
(4,'Troubles Of My Inner Fire', 2, 1), (5,'Time Fireworks', 2, 1),
(6,'Magic Circus', 3, 2), (7,'Honey, So Do I', 3, 2), (8,"Sweetie, Let's Go Wild", 3, 2), (9,'She Knows', 3, 2),
(10,'Fantasy For Me', 4, 3), (11,'Celebration Of More', 4, 3), (12,'Rock His Everything', 4, 3), (13,'Home Forever', 4, 3),
(14,'Diamond Power', 4, 3), (15,"Honey, Let's Be Silly", 4, 3),
(16,"Thang Of Thunder", 5, 4), (17,'Words Of Her Life', 5, 4), (18,'Without My Streets', 5, 4);
INSERT INTO SpotifyClone.seguindo_artistas VALUES (1, 1), (1, 4), (1, 3), (2, 1), (2, 3), 
(3, 2), (3, 1), (4, 4);
INSERT INTO SpotifyClone.historico_de_reproducoes VALUES 
(1, 1), (1, 6), (1, 14), (1, 16),
(2, 13), (2, 17), (2, 2), (2, 15),
(3, 4), (3, 16), (3, 6),
(4, 3), (4, 18), (4, 11);

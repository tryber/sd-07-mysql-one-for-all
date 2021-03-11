DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE artistas(
  idartistas INT PRIMARY KEY AUTO_INCREMENT,
  name_singer VARCHAR(100) NOT NULL
) engine = InnoDB;

CREATE TABLE album(
  idalbum INT PRIMARY KEY AUTO_INCREMENT,
  name_album VARCHAR(100) NOT NULL,
  idartistas INT NOT NULL,
  FOREIGN KEY (idartistas) REFERENCES artistas(idartistas)
) engine = InnoDB;

CREATE TABLE musicas(
  idmusicas INT PRIMARY KEY AUTO_INCREMENT,
  name_song VARCHAR(100) NOT NULL,
  idalbum INT NOT NULL,
FOREIGN KEY (idalbum) REFERENCES album(idalbum)
) engine = InnoDB;

CREATE TABLE planos(
  idplanos TINYINT PRIMARY KEY AUTO_INCREMENT,
  name_plano VARCHAR(100) NOT NULL UNIQUE,
  price_plano DECIMAL(6,2) NOT NULL UNIQUE
) engine = InnoDB;

CREATE TABLE usuario(
  idusuario INT PRIMARY KEY AUTO_INCREMENT,
  name_user VARCHAR(100) NOT NULL,
  age_user TINYINT NOT NULL,
  idplanos TINYINT NOT NULL,
  FOREIGN KEY (idplanos) REFERENCES planos (idplanos)
) engine = InnoDB;

CREATE TABLE usuario_artistas(
  usuario_idusuario INT NOT NULL,
  artistas_idartistas INT NOT NULL,
  PRIMARY KEY (usuario_idusuario, artistas_idartistas),
  FOREIGN KEY (artistas_idartistas) REFERENCES usuario(idusuario),
  FOREIGN KEY (artistas_idartistas) REFERENCES artistas(idartistas)
) engine = InnoDB;

CREATE TABLE usuario_musicas(
  usuario_idusuario INT NOT NULL,
  musicas_idmusicas INT NOT NULL,
  PRIMARY KEY (usuario_idusuario, musicas_idmusicas),
  FOREIGN KEY (musicas_idmusicas) REFERENCES musicas(idmusicas),
  FOREIGN KEY (usuario_idusuario) REFERENCES usuario(idusuario)
) engine = InnoDB;

INSERT INTO SpotifyClone.artistas (name_singer)
VALUES
  ('Walter Phoenix'),
  ('Peter Strong'),
  ('Lance Day'),
  ('Freedie Shannon');

INSERT INTO SpotifyClone.album (name_album, idartistas)
VALUES
  ('Envious', 1),
  ('Exuberant', 1),
  ('Hallowed Steam', 2),
  ('Incandescent', 3),
  ('Temporary Culture', 4);

INSERT INTO SpotifyClone.musicas (name_song, idalbum)
VALUES
  ("Soul For Us", 1),
  ("Reflections Of Magic", 1),
  ("Dance With Her Own", 1),
  ("Troubles Of My Inner Fire", 2),
  ("Time Fireworks", 2),
  ("Magic Circus", 3),
  ("Honey, So Do I", 3),
  ("Sweetie, Let's Go Wild", 3),
  ("She Knows", 3),
  ("Fantasy For Me", 4),
  ("Celebration Of More", 4),
  ("Rock His Everything", 4),
  ("Home Forever", 4),
  ("Diamond Power", 4),
  ("Honey, Let's Be Silly", 4),
  ("Thang Of Thunder", 5),
  ("Words Of Her Life", 5),
  ("Without My Streets", 5);

INSERT INTO SpotifyClone.planos (name_plano, price_plano)
VALUES
  ('gratuito', 0.00),
  ('familiar', 7.99),
  ('universitário', 5.99);

INSERT INTO SpotifyClone.usuario (name_user, age_user, idplanos)
VALUES
  ('Thati', 23, 1),
  ('Cintia', 35, 2),
  ('Bill', 20, 3),
  ('Roger', 45, 1);

INSERT INTO SpotifyClone.usuario_artistas (usuario_idusuario, artistas_idartistas)
VALUES
  (1, 1),
  (1, 4),
  (1, 3),
  (2, 1),
  (2, 3),
  (3, 2),
  (3, 1),
  (4, 4);


INSERT INTO SpotifyClone.usuario_musicas (usuario_idusuario, musicas_idmusicas)
VALUES
  (1, 1),
  (1, 6),
  (1, 14),
  (1, 16),
  (2, 13),
  (2, 17),
  (2, 2),
  (2, 15),
  (3, 4),
  (3, 16),
  (3, 6),
  (4, 3),
  (4, 18),
  (4, 11);
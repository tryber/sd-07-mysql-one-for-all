DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE SpotifyClone;
USE SpotifyClone;
CREATE TABLE SpotifyClone.planos(
  plano_id INT NOT NULL AUTO_INCREMENT,
  plano_tipo VARCHAR(50) NOT NULL,
  plano_valor INT NOT NULL,
  PRIMARY KEY (plano_id)
) ENGINE = InnoDB;
INSERT INTO SpotifyClone.planos (plano_tipo, plano_valor)
VALUES ('gratuito', 0),
  ('familiar', 7.99),
  ('universitário', 5.99);
CREATE TABLE SpotifyClone.usuarios(
  usuario_id INT NOT NULL AUTO_INCREMENT,
  usuario_nome VARCHAR(255) NOT NULL,
  idade INT NOT NULL,
  plano_id INT,
  FOREIGN KEY (plano_id) REFERENCES SpotifyClone.planos(plano_id),
  PRIMARY KEY (usuario_id)
) ENGINE = InnoDB;
INSERT INTO SpotifyClone.usuarios (usuario_nome, idade)
VALUES ('Thati', 23),
  ('Cintia', 35),
  ('Bill', 20),
  ('Roger', 45);
CREATE TABLE SpotifyClone.artistas(
  artista_id INT NOT NULL AUTO_INCREMENT,
  artista_nome VARCHAR(255) NOT NULL,
  PRIMARY KEY (artista_id)
) ENGINE = InnoDB;
INSERT INTO SpotifyClone.artistas (artista_nome)
VALUES ('Walter Phoenix'),
  ('Peter Strong'),
  ('Lance Day'),
  ('Freedie Shannon');
CREATE TABLE SpotifyClone.albuns(
  album_id INT NOT NULL AUTO_INCREMENT,
  album_nome VARCHAR(255) NOT NULL,
  artista_id INT,
  FOREIGN KEY (artista_id) REFERENCES SpotifyClone.artistas(artista_id),
  PRIMARY KEY (album_id)
) ENGINE = InnoDB;
INSERT INTO SpotifyClone.albuns (album_nome, artista_id)
VALUES ('Envious', 1),
  ('Exuberant', 1),
  ('Hallowed Steam', 2),
  ('Incandescent', 3),
  ('Temporary Culture', 4);
CREATE TABLE SpotifyClone.cancoes(
  cancao_id INT NOT NULL AUTO_INCREMENT,
  cancoes_nome VARCHAR(255) NOT NULL,
  album_id INT,
  FOREIGN KEY (album_id) REFERENCES SpotifyClone.albuns(album_id),
  PRIMARY KEY (cancao_id)
) ENGINE = InnoDB;
INSERT INTO SpotifyClone.cancoes(cancoes_nome, album_id)
VALUES ('Soul For Us', 1),
  ('Reflections Of Magic', 1),
  ('Dance With Her Own', 1),
  ('Troubles Of My Inner Fire', 2),
  ('Time Fireworks', 2),
  ('Magic Circus', 3),
  ("Honey, So Do I", 3),
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
CREATE TABLE SpotifyClone.historico(
  usuario_id INT,
  cancao_id INT,
  FOREIGN KEY (usuario_id) REFERENCES SpotifyClone.usuarios(usuario_id),
  FOREIGN KEY (cancao_id) REFERENCES SpotifyClone.cancoes(cancao_id),
  CONSTRAINT combinacao_usuario_cancao PRIMARY KEY (usuario_id, cancao_id)
) ENGINE = InnoDB;
INSERT INTO SpotifyClone.historico (usuario_id, cancao_id)
VALUES (1, 1),
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
CREATE TABLE SpotifyClone.seguidores(
  usuario_id INT,
  artista_id INT,
  FOREIGN KEY (usuario_id) REFERENCES SpotifyClone.usuarios(usuario_id),
  FOREIGN KEY (artista_id) REFERENCES SpotifyClone.artistas(artista_id),
  CONSTRAINT combinacao_usuario_artista PRIMARY KEY (usuario_id, artista_id)
) ENGINE = InnoDB;
INSERT INTO SpotifyClone.seguidores (usuario_id, artista_id)
VALUES (1, 1),
  (1, 4),
  (1, 3),
  (2, 1),
  (2, 3),
  (3, 2),
  (3, 1),
  (4, 4);

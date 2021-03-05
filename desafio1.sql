DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE SpotifyClone;
USE SpotifyClone;

CREATE TABLE album (
  album_id INT AUTO_INCREMENT,
  album_nome VARCHAR(200) NOT NULL,
  artista_id INT NOT NULL,
  PRIMARY KEY (album_id, artista_id),
  FOREIGN KEY (artista_id)
  REFERENCES artista(artista_id)
) ENGINE = InnoDB;

INSERT INTO album (album_nome, artista_id)
VALUES
  ('Envious', 1),
  ('Exuberant', 1),
  ('Hallowed Steam', 2),
  ('Incandescent', 3),
  ('Temporary Culture', 4)
;

CREATE TABLE artista (
  artista_id INT AUTO_INCREMENT,
  artista_nome VARCHAR(100) NOT NULL,
  PRIMARY KEY (artista_id)
) ENGINE = InnoDB;

INSERT INTO artista (artista_nome)
VALUES
  ('Walter Phoenix'),
  ('Peter Strong'),
  ('Lance Day'),
  ('Freedie Shannon')
;

CREATE TABLE artistas_seguidos (
  artista_id INT NOT NULL,
  usuario_id INT NOT NULL,
  PRIMARY KEY (artista_id, usuario_id),
  FOREIGN KEY (usuario_id)
  REFERENCES usuario(usuario_id),
  FOREIGN KEY (artista_id)
  REFERENCES artista(artista_id)
) ENGINE = InnoDB;

INSERT INTO artistas_seguidos
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

CREATE TABLE cancoes (
  cancoes_id INT AUTO_INCREMENT,
  cancoes_nome VARCHAR(200) NOT NULL,
  album_id INT NOT NULL,
  PRIMARY KEY (cancoes_id),
  FOREIGN KEY (album_id)
  REFERENCES album(album_id)
) ENGINE = InnoDB;

INSERT INTO cancoes (cancoes_nome, album_id)
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
  ('Without My Streets', 5)
;

CREATE TABLE historico_reproducoes (
  usuario_id INT NOT NULL,
  cancoes_id INT NOT NULL,
  PRIMARY KEY (usuario_id, cancoes_id),
  FOREIGN KEY (usuario_id)
  REFERENCES usuario(usuario_id),
  FOREIGN KEY (cancoes_id)
  REFERENCES cancoes(cancoes_id)
) ENGINE = InnoDB;

INSERT INTO historico_reproducoes
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

CREATE TABLE IF NOT EXISTS plano (
  plano_id INT AUTO_INCREMENT,
  tipo_plano VARCHAR(45) NOT NULL,
  valor_plano FLOAT NOT NULL,
  PRIMARY KEY (plano_id)
) ENGINE = InnoDB;

INSERT INTO plano (tipo_plano, valor_plano)
VALUES
  ('gratuito', 0.00),
  ('universitário', 5.99),
  ('familiar', 7.99)
;

CREATE TABLE usuario (
  usuario_id INT AUTO_INCREMENT,
  usuario_nome VARCHAR(100) NOT NULL,
  idade INT,
  plano_id INT NOT NULL,
  PRIMARY KEY (usuario_id),
  FOREIGN KEY (plano_id)
  REFERENCES plano(plano_id)
) ENGINE = InnoDB;

INSERT INTO usuario (usuario_nome, idade, plano_id)
VALUES
  ('Thati', 23, 1),
  ('Cintia', 35, 3),
  ('Bill', 20, 2),
  ('Roger', 45, 1)
;

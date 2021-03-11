DROP SCHEMA IF EXISTS SpotifyClone;
CREATE SCHEMA SpotifyClone;

DROP TABLE IF EXISTS SpotifyClone.usuarios;
CREATE TABLE SpotifyClone.usuarios (
  id INT NOT NULL AUTO_INCREMENT,
  usuario CHAR(30) NOT NULL,
  idade INT NOT NULL,
  PRIMARY KEY (id)
);

DROP TABLE IF EXISTS SpotifyClone.artistas;
CREATE TABLE IF NOT EXISTS SpotifyClone.artistas (
  id INT NOT NULL AUTO_INCREMENT,
  artista CHAR(50) NOT NULL,
  PRIMARY KEY (id)
);

DROP TABLE IF EXISTS SpotifyClone.albuns;
CREATE TABLE SpotifyClone.albuns (
  id INT NOT NULL AUTO_INCREMENT,
  album CHAR(50) NOT NULL,
  artista_id INT NOT NULL,
  PRIMARY KEY (id)
);

DROP TABLE IF EXISTS SpotifyClone.cancoes;
CREATE TABLE IF NOT EXISTS SpotifyClone.cancoes (
  id INT NOT NULL AUTO_INCREMENT,
  cancao CHAR(100) NOT NULL,
  album_id INT NOT NULL,
  PRIMARY KEY (id, album_id),
  FOREIGN KEY (album_id) REFERENCES SpotifyClone.albuns (id)
);

DROP TABLE IF EXISTS SpotifyClone.historico;
CREATE TABLE SpotifyClone.historico (
  usuario_id INT NOT NULL,
  cancao_id INT NOT NULL,
  historico_reproducoes CHAR(300) NOT NULL,
  PRIMARY KEY (usuario_id, cancao_id),
  FOREIGN KEY (usuario_id) REFERENCES SpotifyClone.usuarios (id),
  FOREIGN KEY (cancao_id) REFERENCES SpotifyClone.cancoes (id)
);

DROP TABLE IF EXISTS SpotifyClone.seguidores;
CREATE TABLE SpotifyClone.seguidores (
  usuario_id INT NOT NULL,
  artista_id INT NOT NULL,
  PRIMARY KEY (usuario_id, artista_id),
  FOREIGN KEY (usuario_id) REFERENCES SpotifyClone.usuarios (id),
  FOREIGN KEY (artista_id) REFERENCES SpotifyClone.artistas (id)
);

DROP TABLE IF EXISTS SpotifyClone.planos;
CREATE TABLE IF NOT EXISTS SpotifyClone.planos (
  valor_plano INT,
  plano CHAR(50) NOT NULL,
  usuario_id INT NOT NULL,
  PRIMARY KEY (usuario_id),
  FOREIGN KEY (usuario_id) REFERENCES SpotifyClone.usuarios (id)
);

INSERT INTO usuarios (usuario, idade) 
  VALUES('Thati', 23),
    ('Cintia', 35),
    ('Bill', 20),
    ('Roger', 45);
    
INSERT INTO artistas (artista)
  VALUES ('Walter Phoenix'),
    ('Peter Strong'),
    ('Lance Day'),
    ('Freedie Shannon');

INSERT INTO albuns (album, artista_id)
  VALUES ('Envious', 1),
    ('Exuberant', 1),
    ('Hallowed Steam', 2),
    ('Honey, So Do I', 3),
    ('Incandescent', 4);

INSERT INTO cancoes (cancao, album_id)
  VALUES ('Soul For Us', 1),
    ('Reflections Of Magic', 1),
    ('Dance With Her Own', 1),
    ('Troubles Of My Inner Fire', 2),
    ('Time Fireworks', 2),
    ('Magic Circus', 3),
    ('Honey, So Do I', 3),
    ('Sweetie, Let''s Go Wild', 3),
    ('She Knows', 3),
    ('Fantasy For Me', 4),
    ('Celebration Of More', 4),
    ('Rock His Everything', 4),
    ('Home Forever', 4),
    ('Diamond Power', 4),
    ('Honey, Let''s Be Silly', 4),
    ('Thang Of Thunder', 5),
    ('Words Of Her Life', 5),
    ('Without My Streets', 5);
    
INSERT INTO historico (usuario_id, cancao_id, historico_reproducoes)
  VALUES (1, 1, 'Soul For Us'),
    (1, 6, 'Magic Circus'),
    (1, 14, 'Diamond Power'),
    (1, 16, 'Thang Of Thunder'),
    (2, 13, 'Home Forever'),
    (2, 17, 'Words Of Her Life'),
    (2, 2, 'Reflections Of Magic'),
    (2, 15, 'Honey, Let''s Be Silly'),
    (3, 4, 'Troubles Of My Inner Fire'),
    (3, 16, 'Thang Of Thunder'),
    (3, 6, 'Magic Circus'),
    (4, 3, 'Dance With Her Own'),
    (4,18, 'Without My Streets'),
    (4, 11, 'Celebration Of More');

INSERT INTO seguidores (usuario_id, artista_id)
  VALUES (1, 1),
    (1, 3),
    (1, 4),
    (2, 1),
    (2, 3),
    (3, 2),
    (3, 1),
    (4, 4);

INSERT INTO planos (valor_plano, plano, usuario_id)
  VALUES (0, 'gratuito', 1),
    (7.99, 'familiar', 2),
    (5.99, 'universitário', 3),
    (0, 'gratuito', 4);

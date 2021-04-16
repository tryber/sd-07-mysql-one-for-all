DROP SCHEMA IF EXISTS SpotifyClone;
CREATE SCHEMA SpotifyClone;
USE SpotifyClone;

DROP TABLE IF EXISTS planos;
CREATE TABLE planos (
  id INT NOT NULL AUTO_INCREMENT,
  valor_plano DECIMAL(5, 2) NOT NULL,
  plano CHAR(50) NOT NULL,
  PRIMARY KEY (id)
) ENGINE = InnoDB;

DROP TABLE IF EXISTS usuarios;
CREATE TABLE usuarios (
  id INT NOT NULL AUTO_INCREMENT,
  usuario CHAR(30) NOT NULL,
  idade INT NOT NULL,
  plano_id INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (plano_id) REFERENCES planos (id)
) ENGINE = InnoDB;

DROP TABLE IF EXISTS artistas;
CREATE TABLE artistas (
  id INT NOT NULL AUTO_INCREMENT,
  artista CHAR(50) NOT NULL,
  PRIMARY KEY (id)
) ENGINE = InnoDB;

DROP TABLE IF EXISTS albuns;
CREATE TABLE albuns (
  id INT NOT NULL AUTO_INCREMENT,
  album CHAR(50) NOT NULL,
  artista_id INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (artista_id) REFERENCES artistas (id)
) ENGINE = InnoDB;

DROP TABLE IF EXISTS cancoes;
CREATE TABLE cancoes (
  id INT NOT NULL AUTO_INCREMENT,
  cancao CHAR(50) NOT NULL,
  album_id INT NOT NULL,
  PRIMARY KEY (id),
  FOREIGN KEY (album_id) REFERENCES albuns (id)
) ENGINE = InnoDB;

DROP TABLE IF EXISTS historico;
CREATE TABLE historico (
  usuario_id INT NOT NULL,
  cancao_id INT NOT NULL,
  PRIMARY KEY (usuario_id, cancao_id),
  FOREIGN KEY (usuario_id) REFERENCES usuarios (id),
  FOREIGN KEY (cancao_id) REFERENCES cancoes (id)
) ENGINE = InnoDB;

DROP TABLE IF EXISTS seguidores;
CREATE TABLE seguidores (
  usuario_id INT NOT NULL,
  artista_id INT NOT NULL,
  PRIMARY KEY (usuario_id, artista_id),
  FOREIGN KEY (usuario_id) REFERENCES usuarios (id),
  FOREIGN KEY (artista_id) REFERENCES artistas (id)
) ENGINE = InnoDB;

INSERT INTO planos (valor_plano, plano)
  VALUES (0, 'gratuito'),
    (7.99, 'familiar'),
    (5.99, 'universitário');

INSERT INTO usuarios (usuario, idade, plano_id) 
  VALUES('Thati', 23, 1),
    ('Cintia', 35, 3),
    ('Bill', 20, 2),
    ('Roger', 45, 1);
    
INSERT INTO artistas (artista)
  VALUES ('Walter Phoenix'),
    ('Peter Strong'),
    ('Lance Day'),
    ('Freedie Shannon');

INSERT INTO albuns (album, artista_id)
  VALUES ('Envious', 1),
    ('Exuberant', 1),
    ('Hallowed Steam', 2),
    ('Incandescent', 3),
    ('Temporary Culture', 4);

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
    
INSERT INTO historico (usuario_id, cancao_id)
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

INSERT INTO seguidores (usuario_id, artista_id)
  VALUES (1, 1),
    (1, 3),
    (1, 4),
    (2, 1),
    (2, 3),
    (3, 2),
    (3, 1),
    (4, 4);

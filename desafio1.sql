DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE subscriptions(
    plano_id INT NOT NULL AUTO_INCREMENT,
    plano VARCHAR(30),
    valor_plano DOUBLE NOT NULL,
    PRIMARY KEY (plano_id)
) engine = InnoDB;

CREATE TABLE users(
    usuario_id INT NOT NULL AUTO_INCREMENT,
    usuario VARCHAR(50),
    idade INT NOT NULL,
    plano_id INT,
    PRIMARY KEY (usuario_id),
    FOREIGN KEY (plano_id) REFERENCES subscriptions(plano_id)
) engine = InnoDB;

CREATE TABLE artists(
    artista_id INT NOT NULL AUTO_INCREMENT,
    artista VARCHAR(50),
    PRIMARY KEY (artista_id)
) engine = InnoDB;

CREATE TABLE albums(
    album_id INT NOT NULL AUTO_INCREMENT,
    album VARCHAR(50),
    artista_id INT NOT NULL,
    PRIMARY KEY (album_id),
    FOREIGN KEY (artista_id) REFERENCES artists(artista_id)
) engine = InnoDB;

CREATE TABLE songs(
    cancoes_id INT NOT NULL AUTO_INCREMENT,
    cancao VARCHAR(100),
    -- artista_id INT NOT NULL,
    album_id INT NOT NULL,
    PRIMARY KEY (cancoes_id),
    -- FOREIGN KEY (artista_id) REFERENCES artists(artista_id)
    FOREIGN KEY (album_id) REFERENCES albums(album_id)
) engine = InnoDB;

CREATE TABLE historico_de_reproducoes(
    cancoes_id INT,
    usuario_id INT,
    PRIMARY KEY (cancoes_id, usuario_id),
    FOREIGN KEY (cancoes_id) REFERENCES songs(cancoes_id),
    FOREIGN KEY (usuario_id) REFERENCES users(usuario_id)
) engine = InnoDB;

CREATE TABLE seguindo_artistas(
    artista_id INT,
    usuario_id INT,
    PRIMARY KEY (artista_id, usuario_id),
    FOREIGN KEY (artista_id) REFERENCES artists(artista_id),
    FOREIGN KEY (usuario_id) REFERENCES users(usuario_id)
) engine = InnoDB;

INSERT INTO subscriptions(plano, valor_plano)
VALUES
('gratuito', 0),
('familiar', 7.99),
('universitário', 5.99);

INSERT INTO users(usuario, idade, plano_id)
VALUES
  ('Thati', 23, 1),
  ('Cintia', 35, 2),
  ('Bill', 20, 3),
  ('Roger', 45, 1);

INSERT INTO artists(artista)
VALUES
  ('Walter Phoenix'),
  ('Peter Strong'),
  ('Lance Day'),
  ('Freedie Shannon');

INSERT INTO albums(album, artista_id)
VALUES
  ('Envious', 1),
  ('Exuberant', 1),
  ('Hallowed Steam', 2),
  ('Incandescent', 3),
  ('Temporary Culture', 4);

INSERT INTO songs(cancao, album_id)
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

INSERT INTO historico_de_reproducoes(usuario_id, cancoes_id)
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

INSERT INTO seguindo_artistas(usuario_id, artista_id)
VALUES
(1, 1),
(1, 3),
(1, 4),
(2, 1),
(2, 3),
(3, 1),
(3, 2),
(4, 4);

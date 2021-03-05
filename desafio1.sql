DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE planos (
plano_id INT PRIMARY KEY auto_increment,
plano VARCHAR(100) NOT NULL,
valor_plano FLOAT NOT NULL
) ENGINE = InnoDB;

INSERT INTO planos (plano, valor_plano)
VALUES
('gratuito', 0),
('familiar', 7.99),
('universitarop', 5.99);

CREATE TABLE usuarios (
usuario_id INT PRIMARY KEY auto_increment,
usuario VARCHAR(100) NOT NULL,
idade INT NOT NULL,
plano_id INT NOT NULL,
FOREIGN KEY (plano_id) REFERENCES planos(plano_id)
) ENGINE = InnoDB;

INSERT INTO usuarios (usuario, idade, plano_id)
VALUES
('Thati', 23, 1),
('Cintia', 35, 2),
('Bill', 20, 3),
('Roger', 45, 1);

CREATE TABLE artistas (
artista_id INT PRIMARY KEY auto_increment,
artista VARCHAR(100) NOT NULL
) ENGINE = InnoDB;

INSERT INTO artistas (artista)
VALUES
('Walter Phoenix'),
('Peter Strong'),
('Lance Day'),
('Freedie Shannon');

CREATE TABLE albums (
albums_id INT PRIMARY KEY auto_increment,
album VARCHAR(100),
artista_id INT NOT NULL,
FOREIGN KEY (artista_id) REFERENCES artistas(artista_id)
) ENGINE = InnoDB;

INSERT INTO albums (album, artista_id)
VALUES
('Envious', 1),
('Exuberant', 1),
('Hallowed Steam', 2),
('Incandescent', 3),
('Temporary Culture', 4);

CREATE TABLE cancoes (
cancoe_id INT PRIMARY KEY auto_increment,
cancoe VARCHAR(100),
album_id INT NOT NULL,
artista_id INT NOT NULL,
FOREIGN KEY (album_id) REFERENCES albums(album_id),
FOREIGN KEY (artista_id) REFERENCES artistas(artista_id)
) ENGINE = InnoDB;

INSERT INTO cancoes (cancoe, album_id, artista_id)
VALUES
('Soul For Us', 1, 1),
('Reflections Of Magic', 1, 1),
('Dance With Her Own', 1, 1),
('Troubles Of My Inner Fire', 2, 1),
('Time Fireworks', 2, 1),
('Magic Circus', 3, 2),
('Honey, So Do I', 3, 2),
("Sweetie, Let's Go Wild", 3, 2),
('She Knows', 3, 2),
('Fantasy For Me', 4, 3),
('Celebration Of More', 4, 3),
('Rock His Everything', 4, 3),
('Home Forever', 4, 3),
('Diamond Power', 4, 3),
("Honey, Let's Be Silly", 4, 3),
('Thang Of Thunder', 5, 4),
('Words Of Her Life', 5, 4),
('Without My Streets', 5, 4);

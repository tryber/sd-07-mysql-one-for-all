DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE plans(
plano_id INT AUTO_INCREMENT PRIMARY KEY,
tipo_plano VARCHAR(15) NOT NULL,
valor_plano DECIMAL(4, 2) NOT NULL
) engine = InnoDB;

CREATE TABLE artists(
artista_id INT AUTO_INCREMENT PRIMARY KEY,
nome_artista VARCHAR(30) NOT NULL
) engine = InnoDB;

CREATE TABLE users(
usuario_id INT AUTO_INCREMENT PRIMARY KEY,
nome_usuario VARCHAR(30) NOT NULL,
idade_usuario INT NOT NULL,
plano_id INT NOT NULL,
FOREIGN KEY (plano_id) REFERENCES plans(plano_id)
) engine = InnoDB;

CREATE TABLE albums(
album_id INT(4) AUTO_INCREMENT PRIMARY KEY,
nome_album VARCHAR(50) NOT NULL,
artista_id INT(4) NOT NULL,
FOREIGN KEY (artista_id) REFERENCES artists(artista_id)
) engine = InnoDB;

CREATE TABLE songs(
musica_id INT AUTO_INCREMENT PRIMARY KEY,
nome_musica VARCHAR(30) NOT NULL,
album_id INT NOT NULL,
FOREIGN KEY (album_id) REFERENCES albums(album_id)
) engine = InnoDB;

CREATE TABLE follow(
usuario_id INT NOT NULL,
artista_id INT NOT NULL,
PRIMARY KEY (usuario_id, artista_id),
FOREIGN KEY (usuario_id) REFERENCES users(usuario_id),
FOREIGN KEY (artista_id) REFERENCES artists(artista_id)
) engine = InnoDB;

CREATE TABLE reproductions(
usuario_id INT NOT NULL,
musica_id INT NOT NULL,
PRIMARY KEY (usuario_id, musica_id),
FOREIGN KEY (usuario_id) REFERENCES users(usuario_id),
FOREIGN KEY (musica_id) REFERENCES songs(musica_id)
) engine = InnoDB;

INSERT INTO plans(tipo_plano, valor_plano)
VALUES
('gratuito', 0.00),
('familiar', 7.99),
('universitário', 5.99);

INSERT INTO artists(nome_artista)
VALUES
('Walter Phoenix'),
('Peter Strong'),
('Lance Day'),
('Freedie Shannon');

INSERT INTO users(nome_usuario, idade_usuario, plano_id)
VALUES
('Thati', 23, 1),
('Cintia', 35, 2),
('Bill', 20, 3),
('Roger', 45, 1);

INSERT INTO albums(nome_album, artista_id)
VALUES
('Envious', 1),
('Exuberant', 1),
('Hallowed Steam', 2),
('Incandescent', 3),
('Temporary Culture', 4);

INSERT INTO songs(nome_musica, album_id)
VALUES
('Soul For Us', 1),
('Reflections Of Magic', 1),
('Dance With Her Own', 1),
('Troubles Of My Inner Fire', 2),
('Times Fireworks', 2),
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

INSERT INTO follow(usuario_id, artista_id)
VALUES
(1, 1),
(1, 4),
(1, 3),
(2, 1),
(2, 3),
(3, 2),
(3, 1),
(4, 4);

INSERT INTO reproductions(usuario_id, musica_id)
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

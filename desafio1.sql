CREATE DATABASE IF NOT EXISTS SpotifyClone;

CREATE TABLE IF NOT EXISTS SpotifyClone.artistas (
artista_id INT PRIMARY KEY AUTO_INCREMENT,
artista_nome VARCHAR(50) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS SpotifyClone.planos (
plano_id INT PRIMARY KEY AUTO_INCREMENT,
plano VARCHAR(15) NOT NULL,
valor_do_plano DECIMAL(3, 2) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE IF NOt EXISTS SpotifyClone.usuarios (
usuario_id INT PRIMARY KEY AUTO_INCREMENT,
usuario VARCHAR(25) NOT NULL,
idade INT NOT NULL,
plano_id INT NOT NULL,
FOREIGN KEY (plano_id) REFERENCES SpotifyClone.planos(plano_id)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS SpotifyClone.albuns (
album_id INT PRIMARY KEY AUTO_INCREMENT,
album VARCHAR(25) NOT NULL,
artista_id INT NOT NULL,
FOREIGN KEY (artista_id) REFERENCES SpotifyClone.artistas(artista_id)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS SpotifyClone.cancoes (
cancao_id INT PRIMARY KEY AUTO_INCREMENT,
cancao VARCHAR(50) NOT NULL,
album_id INT NOT NULL,
FOREIGN KEY (album_id) REFERENCES SpotifyClone.albuns(album_id)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS SpotifyClone.historico_de_reproducoes (
historico_de_reproducoes_id INT AUTO_INCREMENT,
usuario_id INT NOT NULL,
cancao_id INT NOT NULL,
PRIMARY KEY(historico_de_reproducoes_id, usuario_id, cancao_id),
FOREIGN KEY (usuario_id) REFERENCES SpotifyClone.usuarios(usuario_id),
FOREIGN KEY (cancao_id) REFERENCES SpotifyClone.cancoes(cancao_id)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS SpotifyClone.seguindo (
seguindo_id INT AUTO_INCREMENT,
usuario_id INT NOT NULL,
artista_id INT NOT NULL,
PRIMARY KEY(seguindo_id, usuario_id, artista_id),
FOREIGN KEY (usuario_id) REFERENCES SpotifyClone.usuarios(usuario_id),
FOREIGN KEY (artista_id) REFERENCES SpotifyClone.artistas(artista_id)
) ENGINE=InnoDB;

INSERT INTO SpotifyClone.artistas(artista_nome)
VALUES ('Walter Phoenix'),
('Peter Strong'),
('Lance Day'),
('Freedie Shannon');

INSERT INTO SpotifyClone.planos(plano, valor_do_plano)
VALUES ('gratuito', 0),
('familiar', 7.99),
('universitário', 5.99);

INSERT INTO SpotifyClone.usuarios(usuario, idade, plano_id)
VALUES ('Thati', 23, 1),
('Cintia', 35, 2),
('Bill', 20, 3),
('Roger', 45, 1);

INSERT INTO SpotifyClone.albuns(album, artista_id)
VALUES ('Envious', 1),
('Exuberant', 1),
('Hallowed Steam', 2),
('Incandescent', 3),
('Temporary Culture', 4);

INSERT INTO SpotifyClone.cancoes(cancao, album_id)
VALUES ('Soul For Us', 1),
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
("Thang Of Thunder", 5),
("Words Of Her Life", 5),
("Without My Streets", 5);

INSERT INTO SpotifyClone.historico_de_reproducoes (usuario_id, cancao_id)
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

INSERT INTO SpotifyClone.seguindo(usuario_id, artista_id)
VAlUES (1, 1),
(1, 4),
(1, 3),
(2, 1),
(2, 3),
(3, 2),
(3, 1),
(4, 4);
DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE SpotifyClone;
USE SpotifyClone;

CREATE TABLE IF NOT EXISTS artistas(
artista_id INT PRIMARY KEY AUTO_INCREMENT,
artista VARCHAR(50) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS planos(
plano_id INT PRIMARY KEY AUTO_INCREMENT,
plano VARCHAR(30) NOT NULL,
valor DECIMAL(4, 2) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS usuarios(
usuario_id INT PRIMARY KEY AUTO_INCREMENT,
usuario VARCHAR(50) NOT NULL,
idade INT NOT NULL,
plano_id INT NOT NULL,
FOREIGN KEY (plano_id) REFERENCES planos(plano_id)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS albuns(
album_id INT PRIMARY KEY AUTO_INCREMENT,
album VARCHAR(50) NOT NULL,
artista_id INT NOT NULL,
FOREIGN KEY (artista_id) REFERENCES artistas(artista_id)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS cancoes(
cancao_id INT PRIMARY KEY AUTO_INCREMENT,
cancao VARCHAR(50) NOT NULL,
album_id INT NOT NULL,
FOREIGN KEY (album_id) REFERENCES albuns(album_id)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS historico(
usuario_id INT NOT NULL,
cancao_id INT NOT NULL,
PRIMARY KEY (usuario_id, cancao_id),
FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id),
FOREIGN KEY (cancao_id) REFERENCES cancoes(cancao_id)
) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS seguindo(
artista_id INT NOT NULL,
usuario_id INT NOT NULL,
PRIMARY KEY (artista_id, usuario_id),
FOREIGN KEY (artista_id) REFERENCES artistas(artista_id),
FOREIGN KEY (artista_id) REFERENCES artistas(artista_id)
) ENGINE= InnoDB;

INSERT INTO SpotifyClone.artistas(artista)
VALUES 
('Walter Phoenix'),
('Peter Strong'),
('Lance Day'),
('Freedie Shannon');

INSERT INTO SpotifyClone.planos(plano, valor)
VALUES 
('gratuito', 0.0),
('universitário', 5.99),
('familiar', 7.99);

INSERT INTO SpotifyClone.usuarios(usuario, idade, plano_id)
VALUES 
('Thati', 23, 1),
('Cintia', 35, 2),
('Bill', 20, 3),
('Roger', 45, 1);

INSERT INTO SpotifyClone.albuns(album, artista_id)
VALUES
('Envious', 1),
('Exuberant', 1),
('Hallowed Steam', 2),
('Incandescent', 3),
('Temporary Culture', 4);

INSERT INTO SpotifyClone.cancoes(cancao, album_id)
VALUES
("Soul For Us", 1),
("Reflections Of Magic", 1),
("Dance With Her Own", 1),
("Troubles Of My Inner Fire", 2),
("Time Fireworks", 2),
("Magic Circus", 3),
("Honey, So Do I", 3),
("Sweetie, Let's Go Wild",3),
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

INSERT INTO SpotifyClone.historico(usuario_id, cancao_id)
VALUES
(1, 1),
(1, 6),
(1, 14),
(1, 16),
(2, 2),
(2, 15),
(2, 17),
(3, 3),
(3, 4),
(3, 16),
(4, 3),
(4, 11),
(4, 18);

INSERT INTO SpotifyClone.seguindo(artista_id, usuario_id)
VALUES
(1,1),
(1,2),
(2,3),
(3,1),
(3,2),
(4,4);

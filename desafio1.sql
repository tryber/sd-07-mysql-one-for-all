CREATE DATABASE IF NOT EXISTS SpotifyClone;

CREATE TABLE spotifyclone.plano(
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100) NOT NULL,
valor DECIMAL(5,2) NOT NULL
);

CREATE TABLE spotifyclone.artista(
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100) NOT NULL
);

CREATE TABLE spotifyclone.album(
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100) NOT NULL,
artista_id INT NOT NULL,
FOREIGN KEY (artista_id) REFERENCES spotifyclone.artista(id)
);

CREATE TABLE spotifyclone.cancao(
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100) NOT NULL,
album_id INT NOT NULL,
FOREIGN KEY (album_id) REFERENCES spotifyclone.album(id)
);

CREATE TABLE spotifyclone.usuario(
id INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100) NOT NULL,
idade INT NOT NULL,
plano_id INT NOT NULL,
FOREIGN KEY (plano_id) REFERENCES spotifyclone.plano(id)
);

CREATE TABLE spotifyclone.seguindo_artista(
id INT PRIMARY KEY AUTO_INCREMENT,
usuario_id INT NOT NULL,
artista_id INT NOT NULL,
FOREIGN KEY (usuario_id) REFERENCES spotifyclone.usuario(id),
FOREIGN KEY (artista_id) REFERENCES spotifyclone.artista(id)
);

CREATE TABLE spotifyclone.historico_reproducao(
id INT PRIMARY KEY AUTO_INCREMENT,
usuario_id INT NOT NULL,
cancao_id INT NOT NULL,
FOREIGN KEY (usuario_id) REFERENCES spotifyclone.usuario(id),
FOREIGN KEY (cancao_id) REFERENCES spotifyclone.cancao(id)
);

INSERT INTO spotifyclone.plano(nome, valor)
VALUES
('gratuito', 0),
('univestário', 5.99),
('familiar', 7.99);

INSERT INTO spotifyclone.artista(nome)
VALUES
('Walter Phoenix'),
('Peter Strong'),
('Lance Day'),
('Freedie Shannon');

INSERT INTO spotifyclone.album(nome, artista_id)
VALUES
('Envious', 1),
('Exuberant', 1),
('Hallowed Steam', 2),
('Incandescent', 3),
('Temporary Culture', 4);

INSERT INTO spotifyclone.cancao(nome, album_id)
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

INSERT INTO spotifyclone.usuario(nome, idade, plano_id)
VALUES
('Thati', 23, 1),
('Cintia', 35, 3),
('Bill Steam', 20, 2),
('Roger', 45, 1);

INSERT INTO spotifyclone.seguindo_artista(usuario_id, artista_id)
VALUES
(1, 1),
(1, 4),
(1, 3),
(2, 1),
(2, 3),
(3, 2),
(3, 1),
(4, 4);

INSERT INTO spotifyclone.historico_reproducao(usuario_id, cancao_id)
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

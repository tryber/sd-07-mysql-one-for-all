-- DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;
USE SpotifyClone;

CREATE TABLE artistas(
artista_id INT AUTO_INCREMENT ,
nome VARCHAR(100) NOT NULL,
PRIMARY KEY (artista_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.artistas(nome)
VALUES 
('Walter Phoenix'),
('Peter Strong'),
('Lance Day'),
('Freedie Shannon');

CREATE TABLE planos(
plano_id INT AUTO_INCREMENT ,
nome VARCHAR(100) NOT NULL,
preco DECIMAL(6,2) NOT NULL,
PRIMARY KEY (plano_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.planos(nome, preco)
VALUES 
('gratuito', 0),
('familiar', 7.99),
('universitário', 5.99);

CREATE TABLE usuarios(
usuario_id INT AUTO_INCREMENT,
nome VARCHAR(100) NOT NULL,
idade INT NOT NULL,
plano_id INT NOT NULL,
PRIMARY KEY (usuario_id),
FOREIGN KEY (plano_id) REFERENCES planos(plano_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.usuarios(nome, idade, plano_id)
VALUES 
('Thati', 23, 1),
('Cintia', 35, 2),
('Bill', 20, 3),
('Roger', 45, 1);

CREATE TABLE albuns(
album_id INT AUTO_INCREMENT,
nome VARCHAR(100) NOT NULL,
artista_id INT NOT NULL,
PRIMARY KEY (album_id),
FOREIGN KEY (artista_id) REFERENCES artistas(artista_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.albuns(nome, artista_id)
VALUES 
('Envious', 1),
('Exuberant', 1),
('Hallowed Steam', 2),
('Incandescent', 3),
('Temporary Culture', 4);

CREATE TABLE cancoes(
cancao_id INT AUTO_INCREMENT,
nome VARCHAR(100) NOT NULL,
album_id INT NOT NULL,
PRIMARY KEY (cancao_id),
FOREIGN KEY (album_id) REFERENCES albuns(album_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.cancoes(nome, album_id)
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

CREATE TABLE seguidores(
seguidor_id INT AUTO_INCREMENT,
usuario_id INT NOT NULL,
artista_id INT NOT NULL,
PRIMARY KEY (seguidor_id, usuario_id, artista_id),
FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id),
FOREIGN KEY (artista_id) REFERENCES artistas(artista_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.seguidores(usuario_id, artista_id)
VALUES 
(1, 1),
(1, 4),
(1, 3),
(2, 1),
(2, 3),
(3, 2),
(3, 1),
(4, 4);

CREATE TABLE historico_de_reproducoes(
historico_id INT AUTO_INCREMENT,
usuario_id INT NOT NULL,
cancao_id INT NOT NULL,
PRIMARY KEY (historico_id, usuario_id, cancao_id),
FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id),
FOREIGN KEY (cancao_id) REFERENCES cancoes(cancao_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.historico_de_reproducoes(usuario_id, cancao_id)
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

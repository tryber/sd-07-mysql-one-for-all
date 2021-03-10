DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE SpotifyClone;
USE SpotifyClone;

CREATE TABLE plano(
plano_id INT AUTO_INCREMENT,
plano VARCHAR(50) NOT NULL,
valor_plano DOUBLE,
PRIMARY KEY(plano_id)
);

INSERT INTO plano(plano_id, plano, valor_plano) 
VALUES (1, 'gratuito', 0), (2, 'universitário', 5.99), (3, 'familiar', 7.99);

CREATE TABLE artistas(
artista_id INT AUTO_INCREMENT,
artista VARCHAR(100) NOT NULL,
PRIMARY KEY(artista_id)
);

INSERT INTO artistas(artista_id, artista)
VALUES (1,'Freedie Shannon'), (2, 'Lance Day'), (3, 'Peter Strong'), (4, 'Walter Phoenix');

CREATE TABLE albuns(
album_id INT PRIMARY KEY AUTO_INCREMENT,
titulo_album VARCHAR(200) NOT NULL,
artista_id INT NOT NULL,
FOREIGN KEY (artista_id) REFERENCES artistas(artista_id)
);

INSERT INTO albuns(album_id, titulo_album, artista_id)
VALUES (1,'Envious', 4), (2, 'Exuberant', 4), (3, 'Hallowed Steam', 3), (4, 'Incandescent', 2), (5, 'Temporary Culture', 1);

CREATE TABLE cancoes(
cancao_id INT PRIMARY KEY AUTO_INCREMENT,
titulo_cancao VARCHAR(200) NOT NULL,
album_id INT NOT NULL,
FOREIGN KEY (album_id) REFERENCES albuns(album_id)
);

INSERT INTO cancoes(cancao_id, titulo_cancao, album_id)
VALUES (1, 'Soul For Us', 1),
(2,'Reflections Of Magic', 1),
(3,'Dance With Her Own', 1),
(4,'Troubles Of My Inner Fire', 2),
(5,'Time Fireworks', 2),
(6,'Magic Circus', 3),
(7,'Honey, So Do I', 3),
(8,"Sweetie, Let's Go Wild", 3),
(9,'She Knows', 3),
(10, 'Fantasy For Me', 4),
(11, 'Celebration Of More', 4),
(12, 'Rock His Everything', 4),
(13, 'Home Forever', 4),
(14, 'Diamond Power', 4),
(15, "Honey, Let's Be Silly", 4),
(16, 'Thang Of Thunder', 5),
(17, 'Words Of Her Life', 5),
(18, 'Without My Streets', 5);

CREATE TABLE usuarios(
usuario_id INT AUTO_INCREMENT,
nome VARCHAR(50) NOT NULL,
idade INT NOT NULL,
plano INT NOT NULL,
PRIMARY KEY(usuario_id),
FOREIGN KEY (plano) REFERENCES plano(plano_id)
);

INSERT INTO usuarios(usuario_id, nome, idade, plano)
VALUES (1, 'Thati', 23, 1), (2, 'Cintia', 35, 3), (3, 'Bill', 20, 2), (4, 'Roger', 45, 1);

CREATE TABLE historico_de_reproducoes(
historico_id INT PRIMARY KEY AUTO_INCREMENT,
usuario_id INT NOT NULL,
cancao_id INT NOT NULL,
FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id),
FOREIGN KEY (cancao_id) REFERENCES cancoes(cancao_id)
);

INSERT INTO historico_de_reproducoes(historico_id, usuario_id, cancao_id)
VALUES (1, 1, 1), (2, 1, 6), (3, 1, 14), (4, 1, 16), (5, 2, 13), (6, 2, 17), (7, 2, 2), (8, 2, 15), (9, 3, 4), (10, 3, 16), (11, 3, 6), (12, 4, 3), (13, 4, 18), (14, 4, 11);

CREATE TABLE seguindo_artistas(
usuario_id INT NOT NULL,
artista_id INT NOT NULL,
PRIMARY KEY(usuario_id, artista_id),
FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id),
FOREIGN KEY (artista_id) REFERENCES artistas(artista_id)
);

INSERT INTO seguindo_artistas(usuario_id, artista_id)
VALUES (1, 4), (1, 1), (1, 2), (2, 4), (2, 2), (3, 3), (3, 4), (4, 1);

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

DROP SCHEMA IF EXISTS SpotifyClone;

CREATE SCHEMA IF NOT EXISTS SpotifyClone;

USE SpotifyClone;

DROP TABLE IF EXISTS planos;

CREATE TABLE IF NOT EXISTS planos (
id INT NOT NULL AUTO_INCREMENT,
descricao VARCHAR(45) NOT NULL,
preco DECIMAL(4,2) NOT NULL,
PRIMARY KEY (id)
);

DROP TABLE IF EXISTS usuarios;

CREATE TABLE IF NOT EXISTS usuarios (
id INT NOT NULL AUTO_INCREMENT,
nome VARCHAR(45) NOT NULL,
idade VARCHAR(45) NOT NULL,
plano_id INT NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (plano_id)
REFERENCES planos (id)
);

DROP TABLE IF EXISTS artistas;

CREATE TABLE IF NOT EXISTS artistas (
id INT NOT NULL AUTO_INCREMENT,
nome VARCHAR(45) NOT NULL,
PRIMARY KEY (id)
);

DROP TABLE IF EXISTS albums;

CREATE TABLE IF NOT EXISTS albums (
id INT NOT NULL AUTO_INCREMENT,
nome VARCHAR(45) NOT NULL,
artista_id INT NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (artista_id)
REFERENCES artistas (id)
);

DROP TABLE IF EXISTS cancoes;

CREATE TABLE IF NOT EXISTS cancoes (
id INT NOT NULL AUTO_INCREMENT,
nome VARCHAR(45) NOT NULL,
album_id INT NOT NULL,
artista_id INT NOT NULL,
PRIMARY KEY (id),
FOREIGN KEY (album_id)
REFERENCES albums (id),
FOREIGN KEY (artista_id)
REFERENCES artistas (id)
);

DROP TABLE IF EXISTS seguindo_artistas;

CREATE TABLE IF NOT EXISTS seguindo_artistas (
usuario_id INT NOT NULL,
artista_id INT NOT NULL,
PRIMARY KEY (usuario_id, artista_id),
FOREIGN KEY (usuario_id)
REFERENCES usuarios (id),
FOREIGN KEY (artista_id)
REFERENCES artistas (id)
);

DROP TABLE IF EXISTS historico_reproducoes;

CREATE TABLE IF NOT EXISTS historico_reproducoes (
usuario_id INT NOT NULL,
cancao_id INT NOT NULL,
PRIMARY KEY (usuario_id, cancao_id),
FOREIGN KEY (usuario_id)
REFERENCES usuarios (id),
FOREIGN KEY (cancao_id)
REFERENCES cancoes (id)
);

INSERT INTO SpotifyClone.planos(descricao, preco)
VALUES ('gratuito', 0), ('familiar', 7.99),('universitário', 5.99);
INSERT INTO SpotifyClone.usuarios(nome, idade, plano_id)
VALUES ('Thati', '23', 1),('Cintia', 35, 2),('Bill', 20, 3), ('Roger', '45', 1);
INSERT INTO SpotifyClone.artistas(nome)
VALUES ('Walter Phoenix'), ('Peter Strong'), ('Lance Day'), ('Freedie Shannon');
INSERT INTO SpotifyClone.albums(nome, artista_id)
VALUES('Envious', 1),('Exuberant',1),('Hallowed Steam',2), ('Incandescent',3), ('Temporary Culture',4);
INSERT INTO SpotifyClone.cancoes(album_id, artista_id, nome)
VALUES (1,1,'Soul For Us'),(1,1,'Reflections Of Magic'), (1,1,'Dance With Her Own'),(2,1,'Troubles Of My Inner Fire'),(2,1,'Time Fireworks'),
(3,2, 'Magic Circus'), (3,2,'Honey, So Do I'),(3,2,'Sweetie, Let\'s Go Wild'), (3,2,'She Knows'), (4,3,'Fantasy For Me'), (4,3,'Celebration Of More'),
(4,3,'Rock His Everything'), (4,3,'Home Forever'),(4,3,'Diamond Power'), (4,3,'Honey, Let\'s Be Silly'), (5,4,'Thang Of Thunder'),(5,4,'Words Of Her Life'),
(5,4,'Without My Streets');
INSERT INTO SpotifyClone.seguindo_artistas(usuario_id, artista_id)
VALUES(1, 1), (1, 4), (1,3),(2,1),(2,3),(3,2),(3,1),(4,4);
INSERT INTO SpotifyClone.historico_reproducoes(usuario_id, cancao_id)
VALUES(1,1),(1,6),(1,14),(1,16),(2,13),(2,17),(2,2),(2,15),(3,4),(3,16),(3,6),(4,3),(4,18),(4,11);

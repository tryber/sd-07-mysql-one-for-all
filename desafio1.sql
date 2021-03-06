SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

DROP SCHEMA IF EXISTS SpotifyClone;
CREATE DATABASE SpotifyClone;
USE SpotifyClone;

CREATE TABLE planos (
  plano_id INT NOT NULL AUTO_INCREMENT,
  plano_tipo VARCHAR(45) NOT NULL,
  plano_preço DECIMAL(4,2) NOT NULL,
  PRIMARY KEY (plano_id)
);

CREATE TABLE usuarios (
usuario_id INT NOT NULL AUTO_INCREMENT,
usuario_nome VARCHAR(45) NOT NULL,
idade INT NOT NULL,
plano_id INT NOT NULL,
PRIMARY KEY (usuario_id),
FOREIGN KEY (plano_id) REFERENCES planos (plano_id)
);

CREATE TABLE artistas (
artista_id INT NOT NULL AUTO_INCREMENT,
artista_nome VARCHAR(60) NOT NULL,
PRIMARY KEY (artista_id)
);

CREATE TABLE albuns (
album_id INT NOT NULL AUTO_INCREMENT,
album_titulo VARCHAR(45) NOT NULL,
artista_id INT NOT NULL,
PRIMARY KEY (album_id),
foreign key (artista_id) REFERENCES artistas(artista_id)
);

CREATE TABLE musicas (
musica_id INT NOT NULL AUTO_INCREMENT,
musica_titulo VARCHAR(100) NOT NULL,
album_id INT NOT NULL,
artista_id INT NOT NULL,
PRIMARY KEY(musica_id),
FOREIGN KEY (artista_id) REFERENCES artistas (artista_id),
FOREIGN KEY (album_id) REFERENCES albuns(album_id)
);

CREATE TABLE historico_de_reproducao (
usuario_id INT NOT NULL,
musica_id INT NOT NULL,
PRIMARY KEY (usuario_id, musica_id),
FOREIGN KEY (usuario_id)
REFERENCES usuarios (usuario_id),
FOREIGN KEY (musica_id)
REFERENCES musicas (musica_id)
);

CREATE TABLE historico_de_seguidores (
usuario_id INT NOT NULL,
artista_id INT NOT NULL,
PRIMARY KEY (usuario_id, artista_id),
FOREIGN KEY (usuario_id)
REFERENCES usuarios (usuario_id),
FOREIGN KEY (artista_id)
REFERENCES artistas (artista_id)
);

INSERT INTO SpotifyClone.usuarios(usuario_nome, idade, plano_id)
VALUES ('Thati', '23', 1),('Cintia', 35, 2),('Bill', 20, 3), ('Roger', '45', 1);

INSERT INTO SpotifyClone.planos (plano_tipo, plano_preço)
VALUES ('gratuito', 0), ('familiar', 7.99),('universitário', 5.99);

INSERT INTO SpotifyClone.artistas(artista_nome)
VALUES ('Walter Phoenix'), ('Peter Strong'), ('Lance Day'), ('Freedie Shannon');

INSERT INTO SpotifyClone.historico_de_seguidores(usuario_id, artista_id)
VALUES(1, 1), (1, 4), (1,3),(2,1),(2,3),(3,2),(3,1),(4,4);

INSERT INTO SpotifyClone.albuns(album_titulo, artista_id)
VALUES('Envious', 1),('Exuberant',1),('Hallowed Steam',2), ('Incandescent',3), ('Temporary Culture',4);

INSERT INTO SpotifyClone.musicas(album_id, artista_id, musica_titulo)
VALUES (1,1,'Soul For Us'),(1,1,'Reflections Of Magic'), (1,1,'Dance With Her Own'),(2,1,'Troubles Of My Inner Fire'),(2,1,'Time Fireworks'),
(3,2, 'Magic Circus'), (3,2,'Honey, So Do I'),(3,2,'Sweetie, Let\'s Go Wild'), (3,2,'She Knows'), (4,3,'Fantasy for Me'), (4,3,'Celebration Of More'),
(4,3,'Rock His Everything'), (4,3,'Home Forever'),(4,3,'Diamond Power'), (4,3,'Honey, Let\'s Be Silly'), (5,4,'Thang Of Thunder'),(5,4,'Words Of Her Life'),
(5,4,'Without My Streets');

INSERT INTO SpotifyClone.historico_de_reproducao(usuario_id, musica_id)
VALUES(1,1),(1,6),(1,14),(1,16),(2,13),(2,17),(2,2),(2,15),(3,4),(3,16),(3,6),(4,3),(4,18),(4,11);

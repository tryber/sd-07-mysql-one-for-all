DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

CREATE TABLE SpotifyClone.artistas (
  id_artista INT NOT NULL AUTO_INCREMENT,
  artista VARCHAR(100) NOT NULL,
  PRIMARY KEY (id_artista))engine = InnoDB;

CREATE TABLE SpotifyClone.albuns (
  id_album INT NOT NULL AUTO_INCREMENT,
  album VARCHAR(100) NOT NULL,
  id_artista INT NOT NULL,
  PRIMARY KEY (id_album),
    FOREIGN KEY (id_artista)
    REFERENCES SpotifyClone.artistas (id_artista)) engine = InnoDB;


CREATE TABLE SpotifyClone.cancoes (
  id_cancao INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  id_album INT NOT NULL,
  PRIMARY KEY (id_cancao),
    FOREIGN KEY (id_album)
    REFERENCES SpotifyClone.albuns (id_album))engine = InnoDB;


CREATE TABLE SpotifyClone.planos (
  id_plano INT NOT NULL AUTO_INCREMENT,
  plano VARCHAR(100) NOT NULL,
  valor_plano decimal(4,2) NOT NULL,
  PRIMARY KEY (id_plano))engine = InnoDB;

CREATE TABLE SpotifyClone.usuarios (
  id_usuario INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  idade INT NOT NULL,
  id_plano INT NOT NULL,
  PRIMARY KEY (id_usuario),
    FOREIGN KEY (id_plano)
    REFERENCES SpotifyClone.planos (id_plano))engine = InnoDB;

CREATE TABLE SpotifyClone.historico_reproducoes (
  id_usuario INT NOT NULL,
  id_cancao INT NOT NULL,
  PRIMARY KEY (id_usuario, id_cancao),
    FOREIGN KEY (id_usuario)
    REFERENCES SpotifyClone.usuarios (id_usuario),
    FOREIGN KEY (id_cancao)
    REFERENCES SpotifyClone.cancoes (id_cancao))engine = InnoDB;

CREATE TABLE SpotifyClone.seguindo_artistas (
  id_usuario INT NOT NULL,
  id_artista INT NOT NULL,
  PRIMARY KEY (id_usuario, id_artista),
    FOREIGN KEY (id_usuario)
    REFERENCES SpotifyClone.usuarios (id_usuario),
    FOREIGN KEY (id_artista)
    REFERENCES SpotifyClone.artistas (id_artista))engine = InnoDB;

INSERT INTO SpotifyClone.planos (valor_plano, plano)
VALUES 
(0, 'gratuito'),
(5.99, 'universitário'),
(7.99, 'familia');

INSERT INTO SpotifyClone.usuarios (nome, idade, id_plano)
VALUES 
('Thati', 23, 1),
('Cintia', 35, 3),
('Bill', 20, 2),
('Roger', 45, 1);

INSERT INTO SpotifyClone.artistas (artista)
VALUES 
('Walter Phoenix'),
('Peter Strong'),
('Lance Day'),
('Freedie Shannon');

INSERT INTO SpotifyClone.albuns (album, id_artista)
VALUES 
('Envious',1),
('Exuberant',1),
('Hallowed Steam',2),
('Incandescent',3),
('Temporary Culture',4);

INSERT INTO SpotifyClone.seguindo_artistas (id_usuario, id_artista)
VALUES 
(1,1),
(1,4),
(1,3),
(2,1),
(2,3),
(3,2),
(3,1),
(4,4);

INSERT INTO SpotifyClone.cancoes (nome, id_album)
VALUES 
('Soul For Us',1),
('Reflections Of Magic',1),
('Dance With Her Own',1),
('Troubles Of My Inner Fire',2),
('Time FireWorks',2),
('Magic Circus',3),
('Honey, So Do I',3),
("Sweetie, Let's Go Wild",3),
("She Knows",3),
("Fantasy For Me",4),
("Celebration Of More",4),
("Rock His Everything",4),
("Home Forever",4),
("Diamond Power",4),
("Honey, Let's Be Silly",4),
("Thang Of Thunder",5),
("Words Of Her Life",5),
("Without My Streets",5);

INSERT INTO SpotifyClone.historico_reproducoes (id_usuario, id_cancao)
VALUES 
(1,1),
(1,6),
(1,14),
(1,16),
(2,13),
(2,17),
(2,2),
(2,15),
(3,4),
(3,16),
(3,6),
(4,3),
(4,18),
(4,11);

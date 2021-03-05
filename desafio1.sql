DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE SpotifyClone;
USE SpotifyClone;

CREATE TABLE usuarios(
id_usuario INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100),
idade INT,
fk_id_plano INT,
FOREIGN KEY (fk_id_plano) REFERENCES planos(id_plano)
)ENGINE='InnoDB';

CREATE TABLE planos(
id_plano INT PRIMARY KEY AUTO_INCREMENT,
tipo VARCHAR(50) NOT NULL,
preco DOUBLE NOT NULL    
)ENGINE='InnoDB';

CREATE TABLE artista(
id_artista INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100)
)ENGINE='InnoDB';

CREATE TABLE musicas (
id_musica INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR (50),
fk_id_album INT NOT NULL,
FOREIGN KEY (fk_id_album) REFERENCES album(id_album)
)ENGINE ='InnoDB';

CREATE TABLE album (
id_album INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(100),
fk_id_artista INT NOT NULL,
FOREIGN KEY (fk_id_artista) REFERENCES artistas(id_artista)
)ENGINE = 'InnoDB';

CREATE TABLE historico (
id_historico INT PRIMARY KEY AUTO_INCREMENT,
fk_id_musica INT NOT NULL,
fk_id_usuario INT NOT NULL,
FOREIGN KEY (fk_id_musica) REFERENCES musicas(id_musica),
FOREIGN KEY (fk_id_usuario) REFERENCES usuarios(id_usuario)  
)ENGINE = 'InnoDB';

CREATE TABLE seguidores (
id_seguidores INT PRIMARY KEY AUTO_INCREMENT,
fk_id_usuario INT NOT NULL,
fk_id_artista INT NOT NULL,
FOREIGN KEY(fk_id_usuario) REFERENCES usuarios(id_usuario),
FOREIGN KEY(fk_id_artista) REFERENCES artista(id_artista)
)ENGINE = 'InnoDB';

INSERT INTO planos (tipo, preco)
VALUES 
  ('gratuito', 0),
  ('familiar', 7.99),
  ('universitário', 5.99);
       
INSERT INTO usuarios(nome, idade, fk_id_plano) 
VALUES 
  ('Thati', 23, 1),
  ('Cintia', 35, 2),
  ('Bill', 20, 3),
  ('Roger', 45, 1);
       
INSERT INTO artista(nome) 
VALUES
  ('Walter Phoenix'),
  ('Freedie Shannon'),
  ('Lance Day'),
  ('Peter Strong');
       
INSERT INTO album(nome, fk_id_artista) 
VALUES 
  ('Envious', 1),
  ('Exuberant', 1),
  ('Hallowed Steam', 4),
  ('Incandescent', 3),
  ('Temporary Culture', 2);

INSERT INTO musicas(nome, fk_id_album)
VALUES
  ('Soul For Us', 1),
  ('Reflections Of Magic', 1),
  ('Dance With Her Own', 1),
  ('Troubles Of My Inner Fire', 2),
  ('Time Fireworks', 2),
  ('Magic Circus', 3),
  ('Honey, So Do I', 3),
  ('Sweetie, Let''s Go Wild', 3),
  ('She Knows', 3),
  ('Fantasy For Me', 4),
  ('Celebration Of More', 4),
  ('Rock His Everything', 4),
  ('Home Forever', 4),
  ('Diamond Power', 4),
  ('Honey, Let''s Be Silly', 4),
  ('Thang Of Thunder', 5),
  ('Words Of Her Life', 5),
  ('Without My Streets', 5);

INSERT INTO historico(fk_id_musica, fk_id_usuario)
VALUES
  (1, 1),
  (6, 1),
  (14, 1),
  (16, 1),
  (13, 2),
  (17, 2),
  (2, 2),
  (15, 2),
  (4, 3),
  (16, 3),
  (6, 3),
  (3, 4),
  (18, 4),
  (11, 4);
       
INSERT INTO seguidores (fk_id_usuario, fk_id_artista)
VALUES
  (1, 1),
  (1, 2),
  (1, 3),
  (2, 1),
  (2, 3),
  (3, 4),
  (3, 1),
  (4, 2);

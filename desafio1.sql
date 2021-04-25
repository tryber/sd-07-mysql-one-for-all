DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE plano(
    plano_id INT AUTO_INCREMENT,
    categoria VARCHAR(100) NOT NULL,
    valor_plano DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (plano_id)
) ENGINE=INNODB;

CREATE TABLE usuario(
    usuario_id INT AUTO_INCREMENT, 
    nome VARCHAR(100) NOT NULL,
    idade INT NOT NULL,
    plano_id INT NOT NULL,
    PRIMARY KEY (usuario_id),
    FOREIGN KEY (plano_id) REFERENCES plano(plano_id)
) ENGINE=INNODB;

CREATE TABLE artista(
    artista_id INT AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    PRIMARY KEY (artista_id)    
) ENGINE=INNODB;

CREATE TABLE album(
    album_id INT AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    artista_id INT NOT NULL,
    PRIMARY KEY (album_id),
    FOREIGN KEY (artista_id) REFERENCES artista(artista_id)    
) ENGINE=INNODB;

CREATE TABLE musica(
    musica_id INT AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    album_id INT NOT NULL,
    PRIMARY KEY (musica_id),
    FOREIGN KEY (album_id) REFERENCES album(album_id)    
) ENGINE=INNODB;

CREATE TABLE seguindo(
    seguindo_id INT AUTO_INCREMENT,
    usuario_id INT NOT NULL,
    artista_id INT NOT NULL,
    PRIMARY KEY (seguindo_id),
    FOREIGN KEY (usuario_id) REFERENCES usuario(usuario_id),
    FOREIGN KEY (artista_id) REFERENCES artista(artista_id)
) ENGINE=INNODB;

CREATE TABLE historico(
    historico_id INT AUTO_INCREMENT,
    usuario_id INT NOT NULL,
    musica_id INT NOT NULL,
    PRIMARY KEY (historico_id),
    FOREIGN KEY (usuario_id) REFERENCES usuario(usuario_id),
    FOREIGN KEY (musica_id) REFERENCES musica(musica_id)
) ENGINE=INNODB;


INSERT INTO SpotifyClone.plano (categoria, valor_plano)
VALUES
  ('gratuito', 0.00),
  ('familiar', 7.99),
  ('universitário', 5.99);

INSERT INTO SpotifyClone.usuario (nome, idade,plano_id)
VALUES
  ('Thati', 23,1),
  ('Cintia', 35,2),
  ('Bill', 20,3),
  ('Roger', 45,1);

INSERT INTO SpotifyClone.artista (nome)
VALUES
  ('Walter Phoenix'),
  ('Peter Strong'),
  ('Lance Day'),
  ('Freedie Shannon');

INSERT INTO SpotifyClone.album (nome, artista_id)
VALUES
  ('Envious', 1),
  ('Exuberant', 1),
  ('Hallowed Steam', 2),  
  ('Incandescent', 3),
  ('Temporary Culture', 4);

INSERT INTO SpotifyClone.musica (nome, album_id)
VALUES
  ('Soul For Us', 1),
  ('Reflections Of Magic',1),
  ('Dance With Her Own',1),
  ('Troubles Of My Inner Fire',2),
  ('Time Fireworks',2),
  ('Magic Circus', 3),
  ('Honey, So Do I', 3),
  ("Sweetie, Let's Go Wild",3),
  ('She Knows',3), 
  ('Fantasy For Me', 4),
  ('Celebration Of More', 4), 
  ('Rock His Everything', 4), 
  ('Home Forever', 4), 
  ('Diamond Power', 4), 
  ("Honey, Let's Be Silly",4), 
  ('Thang Of Thunder', 5), 
  ('Words Of Her Life', 5),      
  ('Without My Streets', 5);

INSERT INTO SpotifyClone.historico (usuario_id, musica_id)
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

INSERT INTO SpotifyClone.seguindo (usuario_id, artista_id)
VALUES
  (1,1),
  (1,4),
  (1,3),
  (2,1),
  (2,3),
  (3,2),
  (3,1),
  (4,4);

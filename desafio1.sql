DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE planos(
    plano_id INT PRIMARY KEY AUTO_INCREMENT,
    plano_name VARCHAR(20) NOT NULL,
    valor_plano DECIMAL(3,2) NOT NULL 
) engine = InnoDB;

INSERT INTO planos (plano_name, valor_plano)
VALUES
  ('gratuito', 0),
  ('familiar', 7.99),
  ('universitário', 5.99);

CREATE TABLE users(
    usuario_id INT PRIMARY KEY AUTO_INCREMENT,
    usuario VARCHAR(60) NOT NULL,
    idade INT NOT NULL,
    plano_id INT NOT NULL,
    FOREIGN KEY (plano_id) REFERENCES planos(plano_id)
) engine = InnoDB;

INSERT INTO users (usuario, idade, plano_id)
VALUES
  ('Thati', 23, 1),
  ('Cintia', 35, 2),
  ('Bill', 20, 3),
  ('Roger', 45, 1);

CREATE TABLE artistas(
    artista_id INT PRIMARY KEY AUTO_INCREMENT,
    artista_name VARCHAR(60) NOT NULL    
) engine = InnoDB;

INSERT INTO artistas (artista_name)
VALUES
  ('Walter Phoenix'),
  ('Peter Strong'),
  ('Lance Day'),
  ('Freedie Shannon');

CREATE TABLE albuns(
    album_id INT PRIMARY KEY AUTO_INCREMENT,
    album VARCHAR(40) NOT NULL,
    artista_id INT NOT NULL,
    FOREIGN KEY (artista_id) REFERENCES artistas(artista_id)
) engine = InnoDB;

INSERT INTO albuns (album, artista_id)
VALUES
  ('Envious', 1),
  ('Exuberant', 1),
  ('Hallowed Steam', 2),
  ('Incandescent', 3),
  ('Temporary Culture', 4);

CREATE TABLE cancoes(
    cancao_id INT PRIMARY KEY AUTO_INCREMENT,
    album_id INT NOT NULL,    
    cancao VARCHAR(60) NOT NULL,    
    FOREIGN KEY (album_id) REFERENCES albuns (album_id)
) engine = InnoDB;

INSERT INTO cancoes (album_id, cancao)
VALUES
  (1, 'Soul For Us'),
  (1, 'Reflections Of Magic'),
  (1, 'Dance With Her Own'),
  (2, 'Troubles Of My Inner Fire'),
  (2, 'Time Fireworks'),
  (3, 'Magic Circus'),
  (3, 'Honey, So Do I'),
  (3, "Sweetie, Let's Go Wild"),
  (3, 'She Knows'),
  (4, 'Fantasy For Me'),
  (4, 'Celebration Of More'),
  (4, 'Rock His Everything'),
  (4, 'Home Forever'),
  (4, 'Diamond Power'),
  (4, "Honey, Let's Be Silly"),
  (5, 'Thang Of Thunder'),
  (5, 'Words Of Her Life'),
  (5, 'Without My Streets');

CREATE TABLE seguindo_artistas(
    usuario_id INT,
    artista_id INT,    
    PRIMARY KEY(usuario_id, artista_id),
    FOREIGN KEY (usuario_id) REFERENCES users (usuario_id),
    FOREIGN KEY (artista_id) REFERENCES artistas (artista_id)
) engine = InnoDB;

INSERT INTO seguindo_artistas (usuario_id, artista_id)
VALUES
  (1,1),
  (1,4),
  (1,3),
  (2,1),
  (2,3),
  (3,2),
  (3,1),
  (4,4);

CREATE TABLE historicos(
    usuario_id INT,
    cancao_id INT,
    PRIMARY KEY(usuario_id, cancao_id),
    FOREIGN KEY (usuario_id) REFERENCES users (usuario_id),
    FOREIGN KEY (cancao_id) REFERENCES cancoes (cancao_id)
) engine = InnoDB;

INSERT INTO historicos (usuario_id, cancao_id)
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

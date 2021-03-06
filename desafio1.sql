DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE SpotifyClone;
USE SpotifyClone;

CREATE TABLE planos(
id_plano INT PRIMARY KEY AUTO_INCREMENT,
tipo_plano VARCHAR(25) NOT NULL,
preco DOUBLE NOT NULL
) engine = InnoDB;

CREATE TABLE usuarios(
usuario_id INT PRIMARY KEY AUTO_INCREMENT,
nome_usuario VARCHAR(25) NOT NULL,
idade INT NOT NULL,
id_plano INT NOT NULL,
FOREIGN KEY (id_plano) REFERENCES planos(id_plano)
) engine = InnoDB;

CREATE TABLE artista(
id_artista INT PRIMARY KEY AUTO_INCREMENT,
nome_artista VARCHAR(100) NOT NULL
)ENGINE=InnoDB;

CREATE TABLE album (
id_album INT PRIMARY KEY AUTO_INCREMENT,
nome_album VARCHAR(100),
id_artista INT NOT NULL,
FOREIGN KEY (id_artista) REFERENCES artista(id_artista)
)ENGINE = InnoDB;

CREATE TABLE musicas (
id_musica INT PRIMARY KEY AUTO_INCREMENT,
nome_musica VARCHAR (50),
id_album INT NOT NULL,
FOREIGN KEY (id_album ) REFERENCES album(id_album)
)ENGINE =InnoDB;

CREATE TABLE historico (
usuario_id INT NOT NULL,
id_musica INT NOT NULL,
PRIMARY KEY (usuario_id , id_musica),
FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id),
FOREIGN KEY (id_musica) REFERENCES musicas(id_musica)
)ENGINE = InnoDB;

CREATE TABLE seguidores (
usuario_id INT NOT NULL,
id_artista INT NOT NULL,
PRIMARY KEY (usuario_id, id_artista),
FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id),
FOREIGN KEY (id_artista) REFERENCES artista(id_artista)
)ENGINE = InnoDB;

INSERT INTO planos (tipo_plano, preco)
VALUES
  ('Gratuito', 0),
  ('Universitário', 5.99),
  ('Família', 7.99);

INSERT INTO usuarios (nome_usuario, idade, id_plano)
VALUES
  ('Thati', 23, 1),
  ('Cintia', 35, 2),
  ('Bill', 20, 3),
  ('Roger', 45, 1);

INSERT INTO artista(id_artista, nome_artista)
VALUES
  (1, 'Walter Phoenix'),
  (2, 'Peter Strong'),
  (3, 'Lance Day'),
  (4, 'Freedie Shannon');

INSERT INTO album(id_album, nome_album, id_artista) 
VALUES
  (1,'Envious', 1),
  (2, 'Exuberant', 1),
  (3, 'Hallowed Steam', 2),
  (4, 'Incandescent', 3),
  (5, 'Temporary Culture', 4);

INSERT INTO musicas(nome_musica, id_album)
VALUES
  ('Soul For Us', 1),
  ('Reflections Of Magic', 1),
  ('Dance With Her Own', 1),
  ('Troubles Of My Inner Fire', 2),
  ('Time Fireworks', 2),
  ('Magic Circus', 3),
  ('Honey, So Do I', 3),
  ("Sweetie, Let's Go Wild", 3),
  ('She Knows', 3),
  ('Fantasy For Me', 4),
  ('Celebration Of More', 4),
  ('Rock His Everything', 4),
  ('Home Forever', 4),
  ('Diamond Power', 4),
  ("Honey, Let's Be Silly", 4),
  ('Thang Of Thunder', 5),
  ('Words Of Her Life', 5),
  ('Without My Streets', 5);

INSERT INTO historico(usuario_id, id_musica)
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
 
INSERT INTO seguidores(usuario_id, id_artista)
VALUES
  (1, 1),
  (1, 4),
  (1, 3),
  (2, 1),
  (2, 3),
  (3, 2),
  (3, 1),
  (4, 4);

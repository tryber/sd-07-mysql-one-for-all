DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE SpotifyClone;
USE SpotifyClone;

CREATE TABLE planos(
  plano_id INT PRIMARY KEY,
  nome VARCHAR(20) NOT NULL,
  valor DECIMAL(3,2) NOT NULL
)ENGINE=InnoDB;

CREATE TABLE artistas(
  artista_id INT PRIMARY KEY,
  nome VARCHAR(30) NOT NULL
)ENGINE=InnoDB;

CREATE TABLE usuarios(
  usuario_id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(30) NOT NULL,
  idade INT NOT NULL,
  plano_id INT NOT NULL,
  FOREIGN KEY (plano_id) REFERENCES planos (plano_id)
)ENGINE=InnoDB;

CREATE TABLE albuns(
  album_id INT PRIMARY KEY AUTO_INCREMENT,
  titulo VARCHAR(30) NOT NULL,
  artista_id INT NOT NULL,
  FOREIGN KEY (artista_id) REFERENCES artistas (artista_id)
)ENGINE=InnoDB;

CREATE TABLE cancoes(
  cancao_id INT PRIMARY KEY AUTO_INCREMENT,
  nome VARCHAR(30) NOT NULL,
  album_id INT NOT NULL,
  FOREIGN KEY (album_id) REFERENCES albuns (album_id)
)ENGINE=InnoDB;

CREATE TABLE usuarios_cancoes(
  usuario_id INT NOT NULL,
  cancao_id INT NOT NULL,
  PRIMARY KEY (usuario_id, cancao_id),
  FOREIGN KEY (usuario_id) REFERENCES usuarios (usuario_id),
  FOREIGN KEY (cancao_id) REFERENCES cancoes (cancao_id)
)ENGINE=InnoDB;

CREATE TABLE usuarios_artistas(
  usuario_id INT NOT NULL,
  artista_id INT NOT NULL,
  PRIMARY KEY (usuario_id, artista_id),
  FOREIGN KEY (usuario_id) REFERENCES usuarios (usuario_id),
  FOREIGN KEY (artista_id) REFERENCES artistas (artista_id)
)ENGINE=InnoDB;

INSERT INTO artistas(artista_id, nome)
VALUES (1, 'Freedie Shannon'),
(2, 'Lance Day'),
(3, 'Peter Strong'),
(4, 'Walter Phoenix');

INSERT INTO planos(plano_id, nome, valor)
VALUES (1, 'gratuito', 0),
(2, 'familiar', 7.99),
(3, 'universitário', 5.99);

INSERT INTO usuarios(usuario_id, nome, idade, plano_id)
VALUES (1, 'Thati', 23, 1),
(2, 'Cintia', 35, 2),
(3, 'Bill', 20, 3),
(4, 'Roger', 45, 1);

INSERT INTO albuns(album_id, titulo, artista_id)
VALUES (1, 'Envious', 4),
(2, 'Exuberant', 4),
(3, 'Hallowed Steam', 3),
(4, 'Incandescent', 2),
(5, 'Temporary Culture', 1);

INSERT INTO cancoes(cancao_id, nome, album_id)
VALUES (1, 'Celebration Of More', 4),
(2, 'Dance With Her Own', 1),
(3, 'Diamond Power', 4),
(4, 'Fantasy For Me', 4),
(5, 'Home Forever', 4),
(6, "Honey, Let's Be Silly", 4),
(7, 'Honey, So Do I', 3),
(8, 'Magic Circus', 3),
(9, 'Reflections Of Magic', 1),
(10, 'Rock His Everything', 4),
(11, 'She Knows', 3),
(12, 'Soul For Us', 1),
(13, "Sweetie, Let's Go Wild", 3),
(14, 'Thang Of Thunder', 5),
(15, 'Time Fireworks', 2),
(16, 'Troubles Of My Inner Fire', 2),
(17, 'Without My Streets', 5),
(18, 'Words Of Her Life', 5);

INSERT INTO usuarios_cancoes(usuario_id, cancao_id)
VALUES (1, 3),
(1, 8),
(1, 12),
(1, 14),
(2, 5),
(2, 6),
(2, 9),
(2, 18),
(3, 8),
(3, 14),
(3, 16),
(4, 2),
(4, 1 ),
(4, 17);

INSERT INTO usuarios_artistas(usuario_id, artista_id)
VALUES (1, 1),
(1, 2),
(1, 4),
(2, 2),
(2, 4),
(3, 3),
(3, 4),
(4, 1);

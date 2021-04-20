DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE plano(
  plano_id INT PRIMARY KEY AUTO_INCREMENT,
  tipo_de_plano VARCHAR(30) NOT NULL,
  valor_do_plano DECIMAL(5,2) NOT NULL
) ENGINE = InnoDB;

CREATE TABLE artista(
  artista_id INT PRIMARY KEY AUTO_INCREMENT,
  nome_do_artista VARCHAR(100) NOT NULL
) ENGINE = InnoDB;

CREATE TABLE album(
  album_id INT PRIMARY KEY AUTO_INCREMENT,
  nome_do_album VARCHAR(100) NOT NULL,
  artista_id INT NOT NULL,
  FOREIGN KEY (artista_id) REFERENCES artista(artista_id)
) ENGINE = InnoDB;

CREATE TABLE usuario(
  usuario_id INT PRIMARY KEY AUTO_INCREMENT,
  nome_usuario VARCHAR(100) NOT NULL,
  idade INT NOT NULL,
  plano_id INT NOT NULL,
  FOREIGN KEY (plano_id) REFERENCES plano(plano_id)
) ENGINE = InnoDB;

CREATE TABLE cancao(
  cancao_id INT PRIMARY KEY AUTO_INCREMENT,
  nome_da_cancao VARCHAR(100) NOT NULL,
  album_id INT NOT NULL,
  FOREIGN KEY (album_id) REFERENCES album(album_id)
) ENGINE = InnoDB;

CREATE TABLE seguidores(
  artista_id INT NOT NULL,
  usuario_id INT NOT NULL,
  PRIMARY KEY(usuario_id, artista_id),
  FOREIGN KEY (artista_id) REFERENCES artista(artista_id),
  FOREIGN KEY (usuario_id) REFERENCES usuario(usuario_id)
) ENGINE = InnoDB;

CREATE TABLE historico_de_reproducao(
  usuario_id INT NOT NULL,
  cancao_id INT NOT NULL,
  PRIMARY KEY(cancao_id, usuario_id),
  FOREIGN KEY (usuario_id) REFERENCES usuario(usuario_id),
  FOREIGN KEY (cancao_id) REFERENCES cancao(cancao_id)
) ENGINE = InnoDB;

INSERT INTO plano (tipo_de_plano, valor_do_plano)
VALUES
("gratuito", 0.00),
("universitario", 5.99),
("familiar", 7.99);

INSERT INTO artista (nome_do_artista)
VALUES
("Freedie Shannon"),
("Lance Day"),
("Peter Strong"),
("Walter Phoenix");

INSERT INTO album (nome_do_album, artista_id)
VALUES
("Envious", 4),
("Exuberant", 4),
("Hallowed Steam", 3),
("Incandescent", 2),
("Temporary Culture", 1);

INSERT INTO usuario (nome_usuario, idade, plano_id)
VALUES
("Thati", 23, 1),
("Cintia", 35, 3),
("Bill", 20, 2),
("Roger", 45, 1);

INSERT INTO cancao (nome_da_cancao, album_id)
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

INSERT INTO seguidores (artista_id, usuario_id)
VALUES
(1, 1),
(1, 4),
(2, 1),
(2, 2),
(3, 3),
(4, 1),
(4, 2),
(4, 3);

INSERT INTO historico_de_reproducao (usuario_id, cancao_id)
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

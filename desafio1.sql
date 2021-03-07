DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE artista(
  artista_id INT PRIMARY KEY,
  nome_artista VARCHAR(25) NOT NULL
) ENGINE = InnoDB;

CREATE TABLE album(
  album_id INT PRIMARY KEY,
  nome_album VARCHAR(30),
  artista_id INT NOT NULL,
  FOREIGN KEY (artista_id) REFERENCES artista(artista_id)
) ENGINE = InnoDB;

CREATE TABLE musica(
  musica_id INT PRIMARY KEY,
  nome_musica VARCHAR(30) NOT NULL,
  album_id INT NOT NULL,
  FOREIGN KEY (album_id) REFERENCES album(album_id)
) ENGINE = InnoDB;

CREATE TABLE plano(
  plano_id INT PRIMARY KEY,
  nome_plano VARCHAR(20) NOT NULL,
  preco_plano DECIMAL(3, 2) NOT NULL
) ENGINE = InnoDB;

CREATE TABLE usuario(
  usuario_id INT PRIMARY KEY,
  nome_usuario VARCHAR(20) NOT NULL,
  idade INT NOT NULL,
  plano_id INT NOT NULL,
  FOREIGN KEY (plano_id) REFERENCES plano(plano_id)
) ENGINE = InnoDB;

CREATE TABLE historico_reproducao(
  usuario_id INT,
  musica_id INT,
  PRIMARY KEY (usuario_id, musica_id),
  FOREIGN KEY (usuario_id) REFERENCES usuario(usuario_id),
  FOREIGN KEY (musica_id) REFERENCES musica(musica_id)
) ENGINE = InnoDB;

CREATE TABLE seguidor(
  artista_id INT,
  usuario_id INT,
  PRIMARY KEY (artista_id, usuario_id),
  FOREIGN KEY (artista_id) REFERENCES artista(artista_id),
  FOREIGN KEY (usuario_id) REFERENCES usuario(usuario_id)
) ENGINE = InnoDB;

INSERT INTO artista (artista_id, nome_artista)
VALUES
  (1, "Freedie Shannon"),
  (2, "Lance Day"),
  (3, "Peter Strong"),
  (4, "Walter Phoenix");
  
  INSERT INTO album (album_id, nome_album, artista_id)
VALUES
  (1, "Envious", 4),
  (2, "Exuberant", 4),
  (3, "Hallowed Steam", 3),
  (4, "Incandescent", 2),
  (5, "Temporary Culture", 1);

INSERT INTO musica (musica_id, nome_musica, album_id)
VALUES
  (1, "Soul For Us", 1),
  (2, "Reflections Of Magic", 1),
  (3, "Dance With Her Own", 1),
  (4, "Troubles Of My Inner Fire", 2),
  (5, "Time Fireworks", 2),
  (6, "Magic Circus", 3),
  (7, "Honey, So Do I", 3),
  (8, "Sweetie, Let's Go Wild", 3),
  (9, "She Knows", 3),
  (10, "Fantasy For Me", 4),
  (11, "Celebration Of More", 4),
  (12, "Rock His Everything", 4),
  (13, "Home Forever", 4),
  (14, "Diamond Power", 4),
  (15, "Honey, Let's Be Silly", 4),
  (16, "Thang Of Thunder", 5),
  (17, "Words Of Her Life", 5),
  (18, "Without My Streets", 5);

INSERT INTO plano (plano_id, nome_plano, preco_plano)
VALUES
  (1, "gratuito", 0.00),
  (2, "universitario", 5.99),
  (3, "familiar", 7.99);

INSERT INTO usuario (usuario_id, nome_usuario, idade, plano_id)
VALUES
  (1, "Thati", 23, 1),
  (2, "Cintia", 35, 3),
  (3, "Bill", 20, 2),
  (4, "Roger", 45, 1);

INSERT INTO historico_reproducao (usuario_id, musica_id)
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

INSERT INTO seguidor (artista_id, usuario_id)
VALUES
  (1, 1),
  (1, 4),
  (2, 1),
  (2, 2),
  (3, 3),
  (4, 1),
  (4, 2),
  (4, 3);
  
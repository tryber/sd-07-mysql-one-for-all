DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE IF NOT EXISTS SpotifyClone;

CREATE TABLE SpotifyClone.planos
(
  plano_id MEDIUMINT PRIMARY KEY AUTO_INCREMENT,
  plano VARCHAR(255) NOT NULL,
  valor DECIMAL(5, 2) NOT NULL
) engine = InnoDB;

CREATE TABLE SpotifyClone.artistas
(
  artista_id MEDIUMINT PRIMARY KEY AUTO_INCREMENT,
  artista VARCHAR(255) NOT NULL
) engine = InnoDB;

CREATE TABLE SpotifyClone.usuarios
(
  usuario_id MEDIUMINT PRIMARY KEY AUTO_INCREMENT,
  usuario VARCHAR(255) NOT NULL,
  idade MEDIUMINT NULL,
  plano_id MEDIUMINT NOT NULL,
  FOREIGN KEY (plano_id) REFERENCES SpotifyClone.planos (plano_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.albuns
(
  albun_id MEDIUMINT PRIMARY KEY AUTO_INCREMENT,
  album VARCHAR(255) NOT NULL,
  artista_id MEDIUMINT NOT NULL,
  FOREIGN KEY (artista_id) REFERENCES SpotifyClone.artistas (artista_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.musicas
(
  musica_id MEDIUMINT PRIMARY KEY AUTO_INCREMENT,
  musica VARCHAR(255) NOT NULL,
  albun_id MEDIUMINT NOT NULL,
  FOREIGN KEY (albun_id) REFERENCES SpotifyClone.albuns (albun_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.usuarios_seguindo_artistas
(
  usuario_id MEDIUMINT NOT NULL,
  artista_id MEDIUMINT NOT NULL,
  PRIMARY KEY (usuario_id, artista_id),
  FOREIGN KEY (usuario_id) REFERENCES SpotifyClone.usuarios (usuario_id),
  FOREIGN KEY (artista_id) REFERENCES SpotifyClone.artistas (artista_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.historico_de_reproducoes
(
  usuario_id MEDIUMINT NOT NULL,
  musica_id MEDIUMINT NOT NULL,
  PRIMARY KEY (usuario_id, musica_id),
  FOREIGN KEY (usuario_id) REFERENCES SpotifyClone.usuarios (usuario_id),
  FOREIGN KEY (musica_id) REFERENCES SpotifyClone.musicas (musica_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.planos (plano, valor)
VALUES
  ('gratuito', 0.00),
  ('familiar', 7.99),
  ('universitário', 5.99);

INSERT INTO SpotifyClone.artistas (artista)
VALUES
  ("Walter Phoenix"),
  ("Peter Strong"),
  ("Lance Day"),
  ("Freedie Shannon");

INSERT INTO SpotifyClone.usuarios (usuario, idade, plano_id)
VALUES
  ('Thati', 23, 1),
  ('CMEDIUMINTia', 35, 2),
  ('Bill', 20, 3),
  ('Roger', 45, 1);

INSERT INTO SpotifyClone.albuns (album, artista_id)
VALUES
  ("Envious", 1),
  ("Exuberant", 1),
  ("Hallowed Steam", 2),
  ("Incandescent", 3),
  ("Temporary Culture", 4);

INSERT INTO SpotifyClone.musicas (musica, albun_id)
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

INSERT INTO SpotifyClone.usuarios_seguindo_artistas (usuario_id, artista_id)
VALUES
  (1, 1),
  (1, 4),
  (1, 3),
  (2, 1),
  (2, 3),
  (3, 2),
  (3, 1),
  (4, 4);

INSERT INTO SpotifyClone.historico_de_reproducoes (usuario_id, musica_id)
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

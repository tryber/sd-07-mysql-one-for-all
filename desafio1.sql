DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE planos (
  plano_id INT NOT NULL AUTO_INCREMENT,
  plano VARCHAR(50) NOT NULL,
  valor DECIMAL(5, 2) NOT NULL,
  PRIMARY KEY (plano_id)
) ENGINE = InnoDB;

CREATE TABLE artistas (
artista_id INT NOT NULL AUTO_INCREMENT,
nome VARCHAR(50) NOT NULL,
PRIMARY KEY (artista_id)
) ENGINE = InnoDB;

CREATE TABLE usuarios (
  usuario_id INT NOT NULL AUTO_INCREMENT,
  usuario VARCHAR(50) NOT NULL,
  idade INT NOT NULL,
  plano_id INT NOT NULL,
  PRIMARY KEY (usuario_id),
  FOREIGN KEY (plano_id) REFERENCES planos (plano_id)
) ENGINE = InnoDB;

CREATE TABLE albuns (
  album_id INT NOT NULL AUTO_INCREMENT,
  album VARCHAR(50) NOT NULL,
  artista_id INT NOT NULL,
  PRIMARY KEY (album_id),
  FOREIGN KEY (artista_id) REFERENCES artistas (artista_id)
) ENGINE = InnoDB;

CREATE TABLE musicas (
  musica_id INT NOT NULL AUTO_INCREMENT,
  musica VARCHAR(50) NOT NULL,
  album_id INT NOT NULL,
  artista_id INT NOT NULL,
  PRIMARY KEY (musica_id),
  FOREIGN KEY (album_id) REFERENCES albuns (album_id),
  FOREIGN KEY (artista_id) REFERENCES artistas (artista_id)
) ENGINE = InnoDB;

CREATE TABLE inscricoes (
  inscricao_id INT NOT NULL AUTO_INCREMENT,
  usuario_id INT NOT NULL,
  artista_id INT NOT NULL,
  PRIMARY KEY (inscricao_id),
  FOREIGN KEY (usuario_id) REFERENCES usuarios (usuario_id),
  FOREIGN KEY (artista_id) REFERENCES artistas (artista_id)
) ENGINE = InnoDB;

CREATE TABLE historicos (
  historico_id INT NOT NULL AUTO_INCREMENT,
  usuario_id INT NOT NULL,
  musica_id INT NOT NULL,
  PRIMARY KEY (historico_id),
  FOREIGN KEY (usuario_id) REFERENCES usuarios (usuario_id),
  FOREIGN KEY (musica_id) REFERENCES musicas (musica_id)
) ENGINE = InnoDB;

INSERT INTO planos (plano, valor) VALUES
('gratuito', 0.00),
('universitário', 5.99),
('familiar', 7.99);

INSERT INTO artistas (nome) VALUES
('Walter Phoenix'),
('Peter Strong'),
('Lance Day'),
('Freedie Shannon');

INSERT INTO usuarios (usuario, idade, plano_id) VALUES
('Thati', 23, 1),
('Cintia', 35, 3),
('Bill', 20, 2),
('Roger', 45, 1);

INSERT INTO albuns (album, artista_id) VALUES
('Envious', 1),
('Exuberant', 1),
('Hallowed Steam', 2),
('Incandescent', 3),
('Temporary Culture', 4);

INSERT INTO musicas (musica, album_id, artista_id) VALUES
('Soul For Us', 1, 1),
('Reflections Of Magic', 1, 1),
('Dance With Her Own', 1, 1),
('Troubles Of My Inner Fire', 2, 1),
('Time Fireworks', 2, 1),
('Magic Circus', 3, 2),
('Honey, So Do I', 3, 2),
("Sweetie, Let's Go Wild", 3, 2),
('She Knows', 3, 2),
('Fantasy For Me', 4, 3),
('Celebration Of More', 4, 3),
('Rock His Everything', 4, 3),
('Home Forever', 4, 3),
('Diamond Power', 4, 3),
("Honey, Let's Be Silly", 4, 3),
('Thang Of Thunder', 5, 4),
('Words Of Her Life', 5, 4),
('Without My Streets', 5, 4);

INSERT INTO inscricoes (usuario_id, artista_id) VALUES
(1, 1),
(1, 3),
(1, 4),
(2, 1),
(2, 3),
(3, 2),
(3, 1),
(4, 4);

INSERT INTO historicos (usuario_id, musica_id) VALUES
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

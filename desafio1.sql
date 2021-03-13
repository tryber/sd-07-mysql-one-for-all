CREATE DATABASE IF NOT EXISTS SpotifyClone;
USE SpotifyClone;

CREATE TABLE plano(
  plano_id INT PRIMARY KEY AUTO_INCREMENT,
  plano_nome  VARCHAR(50) NOT NULL,
  plano_valor DECIMAL(5,2) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE usuario(
  usuario_id INT PRIMARY KEY AUTO_INCREMENT,
  usuario_nome VARCHAR(150) NOT NULL,
  usuario_idade INT NOT NULL,
  plano_id INT NOT NULL,
FOREIGN KEY (plano_id) REFERENCES plano(plano_id)
) ENGINE=InnoDB;

CREATE TABLE artista(
  artista_id INT PRIMARY KEY AUTO_INCREMENT,
  artista_nome VARCHAR(150) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE album(
  album_id INT PRIMARY KEY AUTO_INCREMENT,
  album_nome VARCHAR(150) NOT NULL,
  artista_id INT NOT NULL,
  FOREIGN KEY (artista_id) REFERENCES artista(artista_id)
) ENGINE=InnoDB;

CREATE TABLE cancao(
  cancao_id INT PRIMARY KEY AUTO_INCREMENT,
  cancao_nome VARCHAR(150) NOT NULL,
  album_id INT NOT NULL,
  FOREIGN KEY (album_id) REFERENCES album(album_id)
) ENGINE=InnoDB;

CREATE TABLE historico_de_reproducoes(
  usuario_id INT NOT NULL,
  cancao_id INT NOT NULL,
  CONSTRAINT PK_historico_de_reproducoes PRIMARY KEY (usuario_id, cancao_id),
  CONSTRAINT fk_historico_de_reproducoes_usuario FOREIGN KEY  (usuario_id) REFERENCES usuario(usuario_id),
  CONSTRAINT fk_historico_de_reproducoes_cancao FOREIGN KEY (cancao_id) REFERENCES cancao(cancao_id)
) ENGINE=InnoDB;

CREATE TABLE seguindo_artista(
  usuario_id INT NOT NULL,
  artista_id INT NOT NULL,
  CONSTRAINT PK_seguindo_artista PRIMARY KEY (usuario_id, artista_id),
  CONSTRAINT fk_seguindo_artista_usuario FOREIGN KEY (usuario_id) REFERENCES usuario(usuario_id),
  CONSTRAINT fk_seguindo_artista_artista FOREIGN KEY (artista_id) REFERENCES artista(artista_id)
) ENGINE=InnoDB;

INSERT INTO plano (plano_id, plano_nome, plano_valor) 
VALUES
(1, "gratuito", 0),
(2, "familiar", 7.99),
(3, "universitário", 5.99);

INSERT INTO usuario (usuario_id, usuario_nome, usuario_idade, plano_id) 
VALUES
(1, "Thati", 23, 1),
(2, "Cintia", 35, 2),
(3, "Bill", 20, 3),
(4, "Roger", 45, 1);

INSERT INTO artista (artista_id, artista_nome) 
VALUES
(1, "Walter Phoenix"),
(2, "Peter Strong"),
(3, "Lance Day"),
(4, "Freedie Shannon");

INSERT INTO album (album_id, album_nome, artista_id) 
VALUES
(1, "Envious", 1),
(2, "Exuberant", 1),
(3, "Hallowed Steam", 2),
(4, "Incandescent", 3),
(5, "Temporary Culture", 4);

INSERT INTO cancao (cancao_id, cancao_nome, album_id) 
VALUES
(1, "Soul For Us", 1),
(2, "Troubles Of My Inner Fire", 2),
(3, "Magic Circus", 3),
(4, "Fantasy For Me", 4),
(5, "Thang Of Thunder", 5),
(6, "Reflections Of Magic", 1),
(7, "Dance With Her Own", 1),
(8, "Time Fireworks", 2),
(9, "Honey, So Do I", 3),
(10, "Sweetie, Let's Go Wild", 3),
(11, "She Knows", 3),
(12, "Celebration Of More", 4),
(13, "Rock His Everything", 4),
(14, "Home Forever", 4),
(15, "Diamond Power", 4),
(16, "Honey, Let's Be Silly", 4),
(17, "Words Of Her Life", 5),
(18, "Without My Streets", 5);

INSERT INTO historico_de_reproducoes (usuario_id, cancao_id) 
VALUES
(1, 1),
(2, 14),
(3, 2),
(4, 7),
(1, 3),
(1, 15),
(1, 5),
(2, 17),
(2, 6),
(2, 16),
(4, 12),
(3, 5),
(3, 3),
(4,18);

INSERT INTO seguindo_artista (usuario_id, artista_id) 
VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 4),
(1, 4),
(1, 3),
(2, 3),
(3, 1);

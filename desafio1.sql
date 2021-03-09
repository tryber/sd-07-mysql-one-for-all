DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE usuarios (
    usuario_id INT PRIMARY KEY AUTO_INCREMENT,
    usuario VARCHAR(50) NOT NULL,
    idade INT NOT NULL
)  ENGINE=INNODB;

CREATE TABLE artistas (
    artista_id INT PRIMARY KEY AUTO_INCREMENT,
    artista VARCHAR(100) NOT NULL
)  ENGINE=INNODB;

CREATE TABLE albuns (
    album_id INT PRIMARY KEY AUTO_INCREMENT,
    album VARCHAR(50) NOT NULL,
    artista_id INT NOT NULL,
    FOREIGN KEY (artista_id)
        REFERENCES artistas (artista_id)
)  ENGINE=INNODB;

CREATE TABLE cancoes (
    album_id INT NOT NULL,
    cancao VARCHAR(100) NOT NULL,
    FOREIGN KEY (album_id)
        REFERENCES albuns (album_id)
)  ENGINE=INNODB;

CREATE TABLE seguindo (
    usuario_id INT NOT NULL,
    seguindo_artistas VARCHAR(100) NOT NULL,
    FOREIGN KEY (usuario_id)
        REFERENCES usuarios (usuario_id)
)  ENGINE=INNODB;

CREATE TABLE planos (
    usuario_id INT NOT NULL,
    plano VARCHAR(50) NOT NULL,
    valor_plano DOUBLE NOT NULL,
    FOREIGN KEY (usuario_id)
        REFERENCES usuarios (usuario_id)
)  ENGINE=INNODB;

CREATE TABLE historico_reproducao (
    usuario_id INT NOT NULL,
    historico_de_reproducoes VARCHAR(100) NOT NULL,
    FOREIGN KEY (usuario_id)
        REFERENCES usuarios (usuario_id)
)  ENGINE=INNODB;

INSERT INTO usuarios (usuario_id, usuario, idade)
VALUES
  (1, 'Thati', 23),
  (2, 'Cintia', 35),
  (3, 'Bill', 20),
  (4, 'Roger', 45);
  
  INSERT INTO artistas (artista_id, artista)
VALUES
  (1, 'Walter Phoenix'),
  (2, 'Peter Strong'),
  (3, 'Lance Day'),
  (4, 'Freedie Shannon');
  
  INSERT INTO albuns (album_id, album, artista_id)
VALUES
  (1, 'Envious', 1),
  (2, 'Exuberant', 1),
  (3, 'Hallowed Steam', 2),
  (4, 'Incandescent', 3),
  (5, 'Temporary Culture', 4);
  
  INSERT INTO cancoes (album_id, cancao)
VALUES
  (1, 'Soul For Us'),
  (1, "Reflections Of Magic"),
  (1, "Dance With Her Own"),
  (2, "Troubles Of My Inner Fire"),
  (2, "Time Fireworks"),
  (3, "Magic Circus"),
  (3, "Honey, So Do I"),
  (3, "Sweetie, Let's Go Wild"),
  (3, "She Knows"),
  (4, "Fantasy For Me"),
  (4, "Celebration Of More"),
  (4, "Rock His Everything"),
  (4, "Home Forever"),
  (4, "Diamond Power"),
  (4, "Honey, Let's Be Silly"),
  (5, "Thang Of Thunder"),
  (5, "Words Of Her Life"),
  (5, "Without My Streets");
  
    INSERT INTO seguindo (usuario_id, seguindo_artistas)
VALUES
  (1, 'Walter Phoenix'),
  (1, 'Freedien Shanno'),
  (1, 'Lance Day'),
  (2, 'Walter Phoenix'),
  (2, 'Lance Day'),
  (3, 'Peter Strong'),
  (3, 'Walter Phoenix'),
  (4, 'Freedie Shannon');
  
    INSERT INTO planos (usuario_id, plano, valor_plano)
VALUES
  (1, 'gratuito', 0),
  (2, 'familiar', 7.99),
  (2, 'universitário', 7.99),
  (2, 'gratuito', 0);
  
    INSERT INTO historico_reproducao (usuario_id, historico_de_reproducoes)
VALUES
  (1, "Soul For Us"),
  (1, "Magic Circus"),
  (1, "Diamond Power"),
  (1, "Thang Of Thunder"),
  (2, "Home Forever"),
  (2, "Words Of Her Life"),
  (2, "Reflections Of Magic"),
  (2, "Honey, Let's Be Silly"),
  (3, "Troubles Of My Inner Fire"),
  (3, "Thang Of Thunder"),
  (3, "Magic Circus"),
  (4, "Dance With Her Own"),
  (4, "Without My Streets"),
  (4, "Celebration Of More");

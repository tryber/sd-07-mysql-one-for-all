DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE planos (
    plano VARCHAR(50) PRIMARY KEY NOT NULL,
    valor_plano DOUBLE NOT NULL
)  ENGINE=INNODB;

CREATE TABLE usuarios (
    usuario_id INT PRIMARY KEY AUTO_INCREMENT,
    usuario VARCHAR(50) NOT NULL,
    idade INT NOT NULL,
    plano VARCHAR(50) NOT NULL,
    FOREIGN KEY (plano)
        REFERENCES planos (plano)
)  ENGINE=INNODB;

CREATE TABLE artistas (
    nome VARCHAR(100) PRIMARY KEY NOT NULL
)  ENGINE=INNODB;

CREATE TABLE albuns (
    album_id INT PRIMARY KEY AUTO_INCREMENT,
    album VARCHAR(50) NOT NULL,
    artista VARCHAR(100) NOT NULL,
    FOREIGN KEY (artista)
        REFERENCES artistas (nome)
)  ENGINE=INNODB;

CREATE TABLE cancoes (
    cancao VARCHAR(100) PRIMARY KEY NOT NULL,
    album_id INT NOT NULL,
    FOREIGN KEY (album_id)
        REFERENCES albuns (album_id)
)  ENGINE=INNODB;

CREATE TABLE seguindo (
    usuario_id INT NOT NULL,
    seguindo_artistas VARCHAR(100) NOT NULL,
    PRIMARY KEY (usuario_id , seguindo_artistas),
    FOREIGN KEY (usuario_id)
        REFERENCES usuarios (usuario_id),
    FOREIGN KEY (seguindo_artistas)
        REFERENCES artistas (nome)
)  ENGINE=INNODB;

CREATE TABLE historico_reproducao (
    usuario_id INT NOT NULL,
    historico_de_reproducoes VARCHAR(100) NOT NULL,
    PRIMARY KEY (usuario_id , historico_de_reproducoes),
    FOREIGN KEY (usuario_id)
        REFERENCES usuarios (usuario_id),
    FOREIGN KEY (historico_de_reproducoes)
        REFERENCES cancoes (cancao)
)  ENGINE=INNODB;

INSERT INTO planos (plano, valor_plano)
VALUES
  ('gratuito', 0),
  ('familiar', 7.99),
  ('universitário', 5.99);

INSERT INTO usuarios (usuario_id, usuario, idade, plano)
VALUES
  (1, 'Thati', 23, 'gratuito'),
  (2, 'Cintia', 35, 'familiar'),
  (3, 'Bill', 20, 'universitário'),
  (4, 'Roger', 45, 'gratuito');
  
  INSERT INTO artistas (nome)
VALUES
  ('Walter Phoenix'),
  ('Peter Strong'),
  ('Lance Day'),
  ('Freedie Shannon');
  
  INSERT INTO albuns (album_id, album, artista)
VALUES
  (1, 'Envious', 'Walter Phoenix'),
  (2, 'Exuberant', 'Walter Phoenix'),
  (3, 'Hallowed Steam', 'Peter Strong'),
  (4, 'Incandescent', 'Lance Day'),
  (5, 'Temporary Culture', 'Freedie Shannon');
  
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
  (1, 'Freedie Shannon'),
  (1, 'Lance Day'),
  (2, 'Walter Phoenix'),
  (2, 'Lance Day'),
  (3, 'Peter Strong'),
  (3, 'Walter Phoenix'),
  (4, 'Freedie Shannon');
  
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

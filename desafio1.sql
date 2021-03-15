DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE plano(
    plano_id INT primary key auto_increment,
    plano_nome VARCHAR(100) NOT NULL,
    preco DECIMAL(5, 2) NOT NULL
) engine = InnoDB;

CREATE TABLE usuario(
    usuario_id INT primary key auto_increment,
    usuario_nome VARCHAR(100) not null,
    idade INT not null,
    plano_id INT,
    foreign key (plano_id) references plano (plano_id)
) engine = InnoDB;

CREATE TABLE artistas(
    artista_id INT primary key auto_increment,
    artista_nome VARCHAR(100) NOT NULL
) engine = InnoDB;

CREATE TABLE albuns(
    album_id INT primary key auto_increment,
    album_nome VARCHAR(100) NOT NULL,
    artista_id INT,
    foreign key (artista_id) references artistas (artista_id)
) engine = InnoDB;

CREATE TABLE musicas(
    musica_id INT primary key auto_increment,
    musica_nome VARCHAR(100) NOT NULL,
    album_id INT NOT NULL,
    artista_id INT NOT NULL,
    foreign key (artista_id) references artistas (artista_id),
    foreign key (album_id) references albuns (album_id)
) engine = InnoDB;

CREATE TABLE reproducoes(
    usuario_id INT NOT NULL,
    musica_id INT NOT NULL,
    primary key (usuario_id, musica_id),
    foreign key (usuario_id) references usuario (usuario_id) ON DELETE CASCADE
    foreign key (musica_id) references musicas (musica_id) ON DELETE CASCADE
) engine = InnoDB;

CREATE TABLE seguindo(
    usuario_id INT NOT NULL,
    artista_id INT,
    primary key (usuario_id, artista_id),
    foreign key (usuario_id) references usuario (usuario_id) ON DELETE CASCADE,
    foreign key (artista_id) references artistas (artista_id) ON DELETE CASCADE
) engine = InnoDB;

INSERT INTO plano (plano_nome, preco)
VALUES
  ('gratuito', 0),
  ('familiar', 7.99),
  ('universitário', 5.99);

INSERT INTO usuario (usuario_nome, idade, plano_id)
VALUES
  ('Thati', 23, 1),
  ('Cintia', 35, 2),
  ('Bill', 20, 3),
  ('Roger', 45, 1);

INSERT INTO artistas (artista_nome)
VALUES
  ('Walter Phoenix'),
  ('Peter Strong'),
  ('Lance Day'),
  ('Freedie Shannon');

INSERT INTO albuns (album_nome, artista_id)
VALUES
  ('Envious', 1),
  ('Exuberant', 1),
  ('Hallowed Steam', 2),
  ('Incandescent', 3),
  ('Temporary Culture', 4);

INSERT INTO musicas (musica_nome, artista_id, album_id)
VALUES
  ('Soul For Us', 1, 1),
  ('Reflections Of Magic', 1, 1),
  ('Dance With Her Own', 1, 1),
  ('Troubles Of My Inner Fire', 1, 2),
  ('Time Fireworks', 1, 2),
  ('Magic Circus', 2, 3),
  ('Honey, So Do I', 2, 3),
  ("Sweetie, Let's go Wild", 2, 3),
  ('She Knows', 2, 3),
  ('Fantasy For Me', 3, 4),
  ('Celebration Of More', 3, 4),
  ('Rock His Everything', 3, 4),
  ('Home Forever', 3, 4),
  ('Diamond Power', 3, 4),
  ("Honey, Let's Be Silly", 3, 4),
  ('Thang Of Thunder', 4, 5),
  ('Words Of Her Life', 4, 5),
  ('Without My Streets', 4, 5);

INSERT INTO reproducoes (usuario_id, musica_id)
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

  INSERT INTO seguindo (usuario_id, artista_id)
VALUES
  (1, 1),
  (1, 4),
  (1, 3),
  (2, 1),
  (2, 3),
  (3, 2),
  (3, 1),
  (4, 4);

DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE planos(
plano_id INT PRIMARY KEY auto_increment,
plano VARCHAR(50) NOT NULL,
plano_valor DECIMAL(4,2) NOT NULL
)engine=InnoDB;

CREATE TABLE usuarios(
usuario_id INT PRIMARY KEY auto_increment,
usuario_nome VARCHAR(20) NOT NULL,
idade INT NOT NULL,
plano_id INT NOT NULL,
FOREIGN KEY (plano_id) REFERENCES planos(plano_id)
)engine=InnoDB;

CREATE TABLE artistas( 
artista_id INT PRIMARY KEY auto_increment,
nome VARCHAR(20) NOT NULL UNIQUE
)engine=InnoDB;

CREATE TABLE seguindo(
artista_id INT NOT NULL,
usuario_id INT NOT NULL,
FOREIGN KEY (artista_id) REFERENCES artistas(artista_id),
FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id),
PRIMARY KEY (artista_id, usuario_id)
)engine=InnoDB;

CREATE TABLE albuns(
album_id INT PRIMARY KEY auto_increment,
album VARCHAR(20) NOT NULL UNIQUE,
artista_id INT NOT NULL,
FOREIGN KEY (artista_id) REFERENCES artistas(artista_id)
)engine=InnoDB;

CREATE TABLE musicas(
musica_id INT PRIMARY KEY auto_increment,
nome VARCHAR(50) NOT NULL,
album_id INT NOT NULL,
FOREIGN KEY (album_id) REFERENCES albuns(album_id)
)engine=InnoDB;

CREATE TABLE historico(
usuario_id INT NOT NULL,
musica_id INT NOT NULL,
FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id),
FOREIGN KEY (musica_id) REFERENCES musicas(musica_id),
PRIMARY KEY (usuario_id, musica_id)
)engine=InnoDB;

INSERT INTO planos (plano, plano_valor)
VALUES
('gratuito', 0),
('familiar', 7.99),
('universitário', 5.99);

INSERT INTO usuarios(usuario_nome, idade, plano_id)
VALUES
('Thati', 23, 1),
('Cintia', 35, 2),
('Bill', 20, 3),
('Roger', 45, 1);

INSERT INTO artistas(nome)
VALUES
('Walter Phoenix'),
('Peter Strong'),
('Lance Day'),
('Freedie Shannon');

INSERT INTO seguindo(usuario_id, artista_id)
VALUES
(1, 1),
(1, 4),
(1, 3),
(2, 1),
(2, 3),
(3, 2),
(3, 1),
(4, 4);

INSERT INTO albuns(album, artista_id)
VALUES
('Envious', 1),
('Exuberant', 1),
('Hallowed Steam', 2),
('Incandescent', 3),
('Temporary Culture', 4);

INSERT INTO musicas(nome, album_id)
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

INSERT INTO historico(usuario_id, musica_id)
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

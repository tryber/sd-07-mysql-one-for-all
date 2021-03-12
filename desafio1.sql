-- DROP DATABASE IF EXISTS SpotiyfyClone;-- 
CREATE DATABASE SpotifyClone;
USE SpotifyClone;

CREATE TABLE IF NOT EXISTS planos (
id INT PRIMARY KEY AUTO_INCREMENT,
plano VARCHAR(50) NOT NULL,
valor DECIMAL(5, 2) NOT NULL
);

CREATE TABLE IF NOT EXISTS artistas (
id INT PRIMARY KEY AUTO_INCREMENT,
artista VARCHAR(45) NOT NULL
);

CREATE TABLE IF NOT EXISTS albuns (
id INT PRIMARY KEY AUTO_INCREMENT,
album VARCHAR(50) NOT NULL,
artista_id INT NOT NULL,
FOREIGN KEY (artista_id) REFERENCES SpotifyClone.artistas (id)
);

CREATE TABLE IF NOT EXISTS cancoes (
id INT PRIMARY KEY AUTO_INCREMENT,
cancao VARCHAR(50) NOT NULL,
album_id INT NOT NULL,
FOREIGN KEY (album_id) REFERENCES SpotifyClone.albuns (id)
);

CREATE TABLE IF NOT EXISTS usuarios (
id INT PRIMARY KEY AUTO_INCREMENT,
usuario VARCHAR(50) NOT NULL,
idade INT NOT NULL,
plano_id INT NOT NULL,
FOREIGN KEY (plano_id) REFERENCES SpotifyClone.planos (id)
);

CREATE TABLE IF NOT EXISTS seguidores (
artista_id INT NOT NULL,
usuario_id INT NOT NULL,
PRIMARY KEY (artista_id, usuario_id),
FOREIGN KEY (artista_id) REFERENCES SpotifyClone.artistas (id),
FOREIGN KEY (usuario_id) REFERENCES SpotifyClone.usuarios (id)
);

CREATE TABLE IF NOT EXISTS historico (
cancao_id INT NOT NULL,
usuario_id INT NOT NULL,
PRIMARY KEY (cancao_id, usuario_id),
FOREIGN KEY (cancao_id) REFERENCES SpotifyClone.cancoes (id),
FOREIGN KEY (usuario_id) REFERENCES SpotifyClone.usuarios (id)
);

INSERT INTO planos (plano, valor)
VALUES
    ('gratuito', 0),
    ('universitário', 5.99),
    ('familiar', 7.99);

INSERT INTO artistas (artista)
VALUES
    ('Walter Phoenix'),
    ('Peter Strong'),
    ('Lance Day'),
    ('Freedie Shannon');
    
INSERT INTO albuns (album, artista_id)
VALUES
    ('Envious', 1),
    ('Hallowed Steam', 2),
    ('Exuberant', 1),
    ('Incandescent', 3),
    ('Temporary Culture', 4);

INSERT INTO cancoes (cancao, album_id)
VALUES
    ('Soul For Us', 1),
    ('Reflections Of Magic', 1),
    ('Dance With Her Own', 1),
    ('Troubles Of My Inner Fire', 2),
    ('Time Fireworks', 2),
    ('Magic Circus', 3),
    ('Sweetie, Let''s Go Wild', 3),
    ('Honey, So Do I', 3),
    ('She Knows', 3),
    ('Celebration Of More', 4),
    ('Fantasy For Me', 4),
    ('Rock His Everything', 4),
    ('Home Forever', 4),
    ('Honey, Let''s Be Silly', 4),
    ('Diamond Power', 4),
    ('Words Of Her Life', 5),
    ('Thang Of Thunder', 5),
    ('Without My Streets', 5);

INSERT INTO usuarios (usuario, idade, plano_id)
VALUES
    ('Thati', 23, 1),
    ('Cintia', 35, 2),
    ('Bill', 20, 3),
    ('Roger', 45, 1);
    
INSERT INTO seguidores (usuario_id, artista_id)
VALUES
    (1, 1),
    (1, 4),
    (1, 3),
    (2, 1),
    (2, 3),
    (3, 2),
    (3, 1),
    (4, 4);

INSERT INTO historico (usuario_id, cancao_id)
VALUES
    (1, 1),
    (1, 6),
    (1, 14),
    (1, 16),
    (2, 13),
    (2, 17),
    (2, 2),
    (2, 15),
    (4, 3),
    (3, 4),
    (3, 16),
    (3, 6),
    (4,18),
    (4, 11);
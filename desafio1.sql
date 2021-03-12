DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE IF NOT EXISTS SpotifyClone;

DROP TABLE IF EXISTS `plans` ;

CREATE TABLE IF NOT EXISTS `plans` (
id INT PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR(50) NOT NULL,
    valor DECIMAL(5,2) NOT NULL
) engine = InnoDB;

DROP TABLE IF EXISTS `users` ;

CREATE TABLE IF NOT EXISTS `users` (
id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    idade INT NOT NULL,
    plano_id INT NOT NULL,
    FOREIGN KEY (plano_id) REFERENCES plans (id)
) engine = InnoDB;

DROP TABLE IF EXISTS `artists` ;

CREATE TABLE IF NOT EXISTS `artists` (
id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL
) engine = InnoDB;

DROP TABLE IF EXISTS `albums` ;

CREATE TABLE IF NOT EXISTS `albums` (
id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    artista_id INT NOT NULL,
    FOREIGN KEY (artista_id) REFERENCES artists (id)
) engine = InnoDB;

DROP TABLE IF EXISTS `follow` ;

CREATE TABLE IF NOT EXISTS `follow` (
    usuario_id INT NOT NULL,
    artista_id INT NOT NULL,
    PRIMARY KEY (usuario_id, artista_id),
    FOREIGN KEY (usuario_id) REFERENCES users (id),
    FOREIGN KEY (artista_id) REFERENCES artists (id)
) engine = InnoDB;

DROP TABLE IF EXISTS `songs` ;

CREATE TABLE IF NOT EXISTS `songs` (
id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    artista_id INT NOT NULL,
    album_id INT NOT NULL,
    FOREIGN KEY (artista_id) REFERENCES artists (id),
    FOREIGN KEY (album_id) REFERENCES albums (id)
) engine = InnoDB;

DROP TABLE IF EXISTS `history` ;

CREATE TABLE IF NOT EXISTS `history` (
    usuario_id INT NOT NULL,
    cancao_id INT NOT NULL,
    PRIMARY KEY (usuario_id, cancao_id),
    FOREIGN KEY (usuario_id) REFERENCES users (id),
    FOREIGN KEY (cancao_id) REFERENCES songs (id)
) engine = InnoDB;

INSERT INTO plans (id, tipo, valor)
VALUES (DEFAULT, 'gratuito', 0), (DEFAULT, 'familiar', 7.99), (DEFAULT, 'universitario', 5.99);

INSERT INTO users (nome, idade, plano_id)
VALUES (DEFAULT, 'Thati', 23, 1), (DEFAULT, 'Cintia', 35, 2), (DEFAULT, 'Bill', 20, 3), (DEFAULT, 'Roger', 45, 1);

INSERT INTO artistas (nome)
VALUES (DEFAULT, 'Walter Phoenix'), (DEFAULT, 'Peter Strong'), (DEFAULT, 'Lance Day'), (DEFAULT, 'Freedie Shannon');

INSERT INTO albuns (nome, artista_id)
VALUES (DEFAULT, 'Envious', 1), (DEFAULT, 'Exuberant', 1), (DEFAULT, 'Hallowed Steam', 2), (DEFAULT, 'Incandescent', 3), (DEFAULT, 'Temporary Culture', 4);

INSERT INTO usuario_segue_artista (usuario_id, artista_id)
VALUES (1, 1), (1, 4), (1, 3), (2, 1), (2, 3), (3, 2), (3, 1), (4, 4);

INSERT INTO cancoes (nome, artista_id, album_id) VALUES
(DEFAULT, 'Soul For Us', 1, 1),
(DEFAULT, 'Reflections Of Magic', 1, 1),
(DEFAULT, 'Dance With Her Own', 1, 1),
(DEFAULT, 'Troubles Of My Inner Fire', 1, 2),
(DEFAULT, 'Time Fireworks', 1, 2),
(DEFAULT, 'Magic Circus', 2, 3),
(DEFAULT, 'Honey, So Do I', 2, 3),
(DEFAULT, "Sweetie, Let's Go Wild", 2, 3),
(DEFAULT, 'She Knows', 2, 3),
(DEFAULT, 'Fantasy For Me', 3, 4),
(DEFAULT, 'Celebration Of More', 3, 4),
(DEFAULT, 'Rock His Everything', 3, 4),
(DEFAULT, 'Home Forever', 3, 4),
(DEFAULT, 'Diamond Power', 3, 4),
(DEFAULT, "Honey, Let's Be Silly", 3, 4),
(DEFAULT, 'Thang Of Thunder', 4, 5),
(DEFAULT, 'Words Of Her Life', 4, 5),
(DEFAULT, 'Without My Streets', 4, 5);

INSERT INTO usuario_ouve_cancao (usuario_id, cancao_id) VALUES
(1, 1), (1, 6), (1, 14), (1, 16), (2, 13), (2, 17), (2, 2), (2, 15), (3, 4), (3, 16), (3, 6), (4, 3), (4, 18), (4, 11);

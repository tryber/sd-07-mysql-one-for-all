DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE SpotifyClone;
USE SpotifyClone;

CREATE TABLE Plano(
plano_id INT PRIMARY KEY AUTO_INCREMENT,
plano_name VARCHAR(100) NOT NULL,
valor_plano DOUBLE NOT NULL
) engine = InnoDB;

CREATE TABLE Usuario(
usuario_id INT PRIMARY KEY AUTO_INCREMENT,
usuario_name VARCHAR(100) NOT NULL,
idade INT NOT NULL,
plano_id INT NOT NULL,
FOREIGN KEY (plano_id) REFERENCES Plano(plano_id)
) engine = InnoDB;

CREATE TABLE Artista(
artista_id INT PRIMARY KEY AUTO_INCREMENT,
artista_name VARCHAR(100) NOT NULL
) engine = InnoDB;

CREATE TABLE Albuns(
album_id INT PRIMARY KEY AUTO_INCREMENT,
album_name VARCHAR(100) NOT NULL,
artista_id INT NOT NULL,
FOREIGN KEY (artista_id) REFERENCES Artista(artista_id) 
) engine = InnoDB;

CREATE TABLE Artista_Seguidos(
usuario_id INT NOT NULL,
artista_id INT NOT NULL,
PRIMARY KEY (usuario_id, artista_id),
FOREIGN KEY (usuario_id) REFERENCES Usuario(usuario_id) ,
FOREIGN KEY (artista_id) REFERENCES Artista(artista_id)
) engine = InnoDB;

CREATE TABLE Cancao(
cancao_id INT PRIMARY KEY AUTO_INCREMENT,
cancao_name VARCHAR(100) NOT NULL,
album_id INT NOT NULL,
FOREIGN KEY (album_id) REFERENCES Albuns(album_id) 
) engine = InnoDB;

CREATE TABLE HistoricoReproducao(
usuario_id INT NOT NULL,
cancao_id INT NOT NULL,
PRIMARY KEY (usuario_id, cancao_id),
FOREIGN KEY (usuario_id) REFERENCES Usuario(usuario_id),
FOREIGN KEY (cancao_id) REFERENCES Cancao(cancao_id)
) engine = InnoDB;

INSERT INTO Plano (plano_id, plano_name, valor_plano)
VALUES
(1, 'gratuito', 0),
(2, 'familiar', 7.99),
(3, 'universitário', 5.99);

INSERT INTO Usuario (usuario_id, usuario_name, idade, plano_id)
VALUES
(1, 'Thati', 23, 1),
(2, 'Cintia', 35, 2),
(3, 'Bill', 20, 3),
(4, 'Roger', 45, 1);

INSERT INTO Artista (artista_id, artista_name)
VALUES
(1, 'Walter Phoenix'),
(2, 'Peter Strong'),
(3, 'Lance Day'),
(4, 'Freedie Shannon');

INSERT INTO Albuns (album_id, album_name, artista_id)
VALUES
(1, 'Envious', 1),
(2, 'Exuberant',	1),
(3, 'Hallowed Steam',	2),
(4, 'Incandescent',	3),
(5, 'Temporary Culture',	4);

INSERT INTO Artista_Seguidos (usuario_id, artista_id)
VALUES
(1, 1),
(1, 3),
(1,	4),
(2,	1),
(2,	3),
(3,	1),
(3,	2),
(4,	4);

INSERT INTO Cancao (cancao_id, cancao_name, album_id)
VALUES
(1, 'Soul For Us', 1),
(2, 'Reflections Of Magic', 1),
(3, 'Dance With Her Own', 1),
(4, 'Troubles Of My Inner Fire', 2),
(5, 'Time Fireworks', 2),
(6, 'Magic Circus',	3),
(7, 'Honey, So Do I',	3),
(8, "Sweetie, Let's Go Wild", 3),
(9, 'She Knows', 3),
(10, 'Fantasy For Me', 4),
(11, 'Celebration Of More', 4),
(12, 'Rock His Everything',	4),
(13, 'Home Forever', 4),
(14, 'Diamond Power', 4),
(15, "Honey, Let's Be Silly", 4),
(16, 'Thang Of Thunder', 5),
(17, 'Words Of Her Life', 5),
(18, 'Without My Streets', 5);

INSERT INTO HistoricoReproducao (usuario_id, cancao_id)
VALUES
(1,	1),
(1,	6),
(1,	14),
(1,	16),
(2,	13),
(2,	17),
(2,	2),
(2,	15),
(3,	4),
(3,	16),
(3,	6),
(4,	3),
(4,	18),
(4,	11);

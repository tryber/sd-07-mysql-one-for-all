DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE SpotifyClone;
USE SpotifyClone;

CREATE TABLE Planos(
plano_id INT PRIMARY KEY AUTO_INCREMENT,
plano_nome VARCHAR(75),
plano_valor DECIMAL(5,2)
) ENGINE=InnoDB;

CREATE TABLE Usuarios(
usuario_id INT PRIMARY KEY AUTO_INCREMENT,
usuario_nome VARCHAR(75),
usuario_idade INT NOT NULL,
fk_plano_id INT NOT NULL,
FOREIGN KEY (fk_plano_id) REFERENCES Planos(plano_id)
) ENGINE=InnoDB;

CREATE TABLE Artistas(
artista_id INT PRIMARY KEY AUTO_INCREMENT,
artista_nome VARCHAR(75)
) ENGINE=InnoDB;

CREATE TABLE Albuns(
album_id INT PRIMARY KEY AUTO_INCREMENT,
album_nome VARCHAR(75),
fk_artista_id INT NOT NULL,
FOREIGN KEY (fk_artista_id) REFERENCES Artistas(artista_id)
) ENGINE=InnoDB;

CREATE TABLE Cancoes(
cancao_id INT PRIMARY KEY AUTO_INCREMENT,
cancao_nome VARCHAR(75),
fk_album_id INT NOT NULL,
FOREIGN KEY (fk_album_id) REFERENCES Albuns(album_id)   
) ENGINE=InnoDB;

CREATE TABLE Historico_Usuarios(
fk_usuario_id INT NOT NULL,
fk_cancao_id INT NOT NULL,
PRIMARY KEY(fk_usuario_id, fk_cancao_id),
FOREIGN KEY (fk_usuario_id) REFERENCES Usuarios(usuario_id),
FOREIGN KEY (fk_cancao_id) REFERENCES Cancoes(cancao_id)
) ENGINE=InnoDB;

CREATE TABLE Artistas_Seguidores(
fk_usuario_id INT NOT NULL,
fk_artista_id INT NOT NULL,
PRIMARY KEY(fk_usuario_id, fk_artista_id),
FOREIGN KEY (fk_usuario_id) REFERENCES Usuarios(usuario_id),
FOREIGN KEY (fk_artista_id) REFERENCES Artistas(artista_id)
) ENGINE=InnoDB;

INSERT INTO Planos (plano_nome, plano_valor)
VALUES('gratuito', 0),
('familiar', 7.99),
('universitário', 5.99);
                  
INSERT INTO Artistas (artista_nome)
VALUES('Walter Phoenix'),
('Peter Strong'),
('Lance Day'),
('Freedie Shannon');
                  
INSERT INTO Albuns (album_nome, fk_artista_id)
VALUES('Envious', 1),('Exuberant', 1),
('Hallowed Steam', 2),
('Incandescent', 3),
('Temporary Culture', 4);
                  
INSERT INTO Cancoes (cancao_nome, fk_album_id)
VALUES('Soul For Us', 1),
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

INSERT INTO Usuarios (usuario_nome, usuario_idade, fk_plano_id)
VALUES('Thati', 23, 1),
('Cintia', 35, 2),
('Bill', 20, 3),
('Roger', 45, 1);
                  
INSERT INTO Historico_Usuarios (fk_usuario_id, fk_cancao_id)
VALUES(1, 1),
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

INSERT INTO Artistas_Seguidores(fk_usuario_id, fk_artista_id)
VALUES(1, 1),
(1, 4),
(1, 3),
(2, 1),
(2, 3),
(3, 2),
(3, 1),
(4, 4);

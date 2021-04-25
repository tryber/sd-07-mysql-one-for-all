DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE planos(
id INT PRIMARY KEY AUTO_INCREMENT,
plano VARCHAR(50) NOT NULL,
valor DECIMAL(3,2) NOT NULL
) ENGINE = InnoDB;

INSERT INTO planos(plano,valor) VALUES
('gratuito',0),
('familiar',7.99),
('universitário',5.99);


CREATE TABLE artistas(
id INT PRIMARY KEY AUTO_INCREMENT,
nome_artista VARCHAR(150) NOT NULL
) ENGINE = InnoDB;

INSERT INTO artistas(nome_artista) VALUES
('Walter Phoenix'),
('Peter Strong'),
('Lance Day'),
('Freedie Shannon');


CREATE TABLE albuns(
id INT PRIMARY KEY AUTO_INCREMENT,
nome_album VARCHAR(150) NOT NULL,
artista_id INT NOT NULL,
FOREIGN KEY (artista_id) REFERENCES artistas(id)
) ENGINE = InnoDB;

INSERT INTO albuns(nome_album,artista_id) VALUES 
('Envious',1),
('Exuberant',1),
('Hallowed Steam',2),
('Incandescent',3),
('Temporary Culture',4);

CREATE TABLE musicas(
id INT PRIMARY KEY AUTO_INCREMENT,
nome_musica VARCHAR(100) NOT NULL,
album_id INT NOT NULL,
FOREIGN KEY (album_id) REFERENCES albuns(id)
) ENGINE = InnoDB;

INSERT INTO musicas(nome_musica,album_id) VALUES 
('Soul For Us',1),
('Magic Circus',3),
('Diamond Power',4),
('Thang Of Thunder',5),
('Home Forever',4),
('Words Of Her Life',5),
('Reflections Of Magic',1),
("Honey, Let's Be Silly",4),
('Troubles Of My Inner Fire',2),
('Dance With Her Own',1),
('Without My Streets',5),
('Celebration Of More',4),
('Time Fireworks',2),
("Sweetie,Let's Go Wild",3),
('Rock His Everything' ,4),
('Honey, So Do I',3),
('Fantasy For Me',4),
('She Knows',3);


CREATE TABLE usuarios(
id INT PRIMARY KEY AUTO_INCREMENT,
nome_usuario VARCHAR(100) NOT NULL,
idade INT NOT NULL,
plano_id INT NOT NULL,
FOREIGN KEY (plano_id) REFERENCES planos(id)
) ENGINE = InnoDB;

INSERT INTO usuarios(nome_usuario,idade,plano_id) VALUES
('Thati',23,1),
('Cintia',35,2),
('Bill',20,3),
('Roger',45,1);

CREATE TABLE historico_usuario(
usuario_id INT NOT NULL,
musica_id INT NOT NULL,
PRIMARY KEY (usuario_id,musica_id),
FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
FOREIGN KEY (musica_id) REFERENCES musicas(id)
) ENGINE = InnoDB;

INSERT INTO historico_usuario(usuario_id,musica_id) VALUES
(1,1),
(1,2),
(1,3),
(1,4),
(2,5),
(2,6),
(2,7),
(2,8),
(3,9),
(3,4),
(3,2),
(4,10),
(4,11),
(4,12);

CREATE TABLE artistas_seguidos(
usuario_id INT NOT NULL,
artista_id INT NOT NULL,
PRIMARY KEY (usuario_id,artista_id),
FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
FOReIGN KEY (artista_id) REFERENCES artistas(id) 
)ENGINE = InnoDB;

INSERT INTO artistas_seguidos(usuario_id,artista_id) VALUES 
(1,1),
(1,4),
(1,3),
(2,1),
(2,3),
(3,2),
(3,1),
(4,4);

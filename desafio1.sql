DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;
USE SpotifyClone;


-- CREATE TABLE funcionarios(
-- 	funcionario_id INT PRIMARY KEY auto_increment,
--     nome varchar(100) not null,
--     sobrenome varchar(100) not null,
--     email varchar(100) not null,
--     numero_cell INT not null,
--     data_cadastro DATE not null,
--     setor_id INT not null,
--     FOREIGN KEY (setor_id) REFERENCES setor(setor_id)
-- )engine=InnoDB;

CREATE TABLE planos(
	plano_id INT PRIMARY KEY auto_increment,
    plano varchar(100) not null,
    valor_plano FLOAT not null
)engine=InnoDB;

INSERT INTO planos (valor_plano, plano)
VALUES (0, 'gratuito'),(5.99, 'universitário'),(7.99, 'familia');
-- select * from planos;

CREATE TABLE usuarios(
	usuario_id INT PRIMARY KEY auto_increment,
    nome varchar(300) not null,
    idade INT not null,
    plano_id INT not null,
    FOREIGN KEY (plano_id) REFERENCES planos(plano_id)
)engine=InnoDB;

INSERT INTO usuarios (nome, idade, plano_id)
VALUES ('Thati', 23, 1),('Cintia', 35, 3),('Bill', 20, 2),('Roger', 45, 1);
-- select * from usuarios;

CREATE TABLE artistas(
	artista_id INT PRIMARY KEY auto_increment,
    nome varchar(300) not null
)engine=InnoDB;

INSERT INTO artistas (nome)
VALUES ('Walter Phoenix'),('Peter Strong'),('Lance Day'), ('Freedie Shannon');
-- select * from artistas;

CREATE TABLE albuns(
	album_id INT PRIMARY KEY auto_increment,
    album varchar(300) not null,
    artista_id INT not null,
	FOREIGN KEY (artista_id) REFERENCES artistas(artista_id)
)engine=InnoDB;

INSERT INTO albuns (album, artista_id)
VALUES ('Envious',1),('Exuberant',1),('Hallowed Steam',2),('Incandescent',3),('Temporary Culture',4);
-- select * from albuns;


CREATE TABLE usuario_artista(
	usuario_id INT not null,
    seguindo_artista INT not null,
    PRIMARY KEY (usuario_id,seguindo_artista),
	FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id),
    FOREIGN KEY (seguindo_artista) REFERENCES artistas(artista_id)
)engine=InnoDB;

INSERT INTO usuario_artista (usuario_id, seguindo_artista)
VALUES (1,1),(1,4),(1,3),(2,1),(2,3),(3,2),(3,1),(4,4);
-- select * from usuario_artista;

CREATE TABLE cancoes(
	cancao_id INT PRIMARY KEY auto_increment,
    nome varchar(300) not null,
	album_id INT not null,
    FOREIGN KEY (album_id) REFERENCES albuns(album_id)
)engine=InnoDB;

INSERT INTO cancoes (nome, album_id)
VALUES 
('Soul For Us',1),
('Reflections Of Magic',1),
('Dance With Her Own',1),
('Troubles Of My Inner Fire',2),
('Time FireWorks',2),
('Magic Circus',3),
('Honey, So Do I',3),
("Sweetie, Let's Go Wild",3),
("She Knows",3),
("Fantasy For Me",4),
("Celebration Of More",4),
("Rock His Everything",4),
("Home Forever",4),
("Diamond Power",4),
("Honey, Let's Be Silly",4),
("Thang Of Thunder",5),
("Words Of Her Life",5),
("Without My Streets",5);
-- select * from cancoes;

CREATE TABLE hist_reproducoes(
	usuario_id INT not null,
    cancao_id INT not null,
    PRIMARY KEY (usuario_id,cancao_id),
	FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id),
    FOREIGN KEY (cancao_id) REFERENCES cancoes(cancao_id)
)engine=InnoDB;

INSERT INTO hist_reproducoes (usuario_id, cancao_id)
VALUES (1,1),(1,6),(1,14),(1,16),(2,13),(2,17),(2,2),(2,15),(3,4),(3,16),(3,6),(4,3),(4,18),(4,11);
-- select * from hist_reproducoes;




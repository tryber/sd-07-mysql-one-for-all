DROP SCHEMA IF EXISTS SpotifyClone;
CREATE SCHEMA SpotifyClone;
USE SpotifyClone;

CREATE TABLE planos (
plano_id INT NOT NULL auto_increment,
plano_tipo varchar(45) not null,
plano_preço decimal(4,2) not null,
PRIMARY KEY (plano_id)
);

CREATE TABLE usuarios (
usuario_id int not null auto_increment,
usuario_nome int not null auto_increment,
idade int zerofill null,
plano_id int not null,
PRIMARY KEY (usuario_id),
FOREIGN KEY (plano_id) REFERENCES planos (plano_id)
);

CREATE TABLE historico_de_reproducao (
usuario_id INT NOT NULL,
musica_id INT NOT NULL,
PRIMARY KEY (usuario_id, musica_id),
FOREIGN KEY (usuario_id)
REFERENCES usuarios (usuario_id),
FOREIGN KEY (musica_id)
REFERENCES musicas (musica_id)
);

CREATE TABLE musicas (
musica_id int not null auto_increment,
musica_titulo varchar(100) not null,
album_id int not null,
artista_id int not null,
PRIMARY KEY(musica_id),
FOREIGN KEY (artista_id) references artistas (artista_id),
FOREIGN KEY (album_id) references albuns(album_id)
);

CREATE TABLE albuns (
album_id int not null auto_increment,
album_titulo varchar(45) not null,
artista_id int not null,
PRIMARY KEY (album_id),
foreign key (artista_id) references artistas(artista_id)
);

CREATE TABLE artistas (
artista_id INT NOT NULL AUTO_INCREMENT,
artista_nome VARCHAR(60) NOT NULL,
PRIMARY KEY (artista_id)
);

CREATE TABLE historico_de_seguidores (
usuario_id INT NOT NULL,
artista_id INT NOT NULL,
PRIMARY KEY (usuario_id, artista_id),
FOREIGN KEY (usuario_id)
    REFERENCES usuarios (usuario_id),
    FOREIGN KEY (artista_id)
    REFERENCES artistas (artista_id)
);


insert into SpotifyClone.usuarios(usuario_nome, idade, plano_id)
values ('Thati', '23', 1),('Cintia', 35, 2),('Bill', 20, 3), ('Roger', '45', 1);

insert into SpotifyClone.planos (plano_tipo, plano_preço)
values ('gratuito', 0), ('familiar', 7.99),('universitário', 5.99);

insert into SpotifyClone.artistas(artista_nome)
values ('Walter Phoenix'), ('Peter Strong'), ('Lance Day'), ('Freedie Shannon');

insert into SpotifyClone.historico_de_seguidores(usuario_id, artista_id)
values(1, 1), (1, 4), (1,3),(2,1),(2,3),(3,2),(3,1),(4,4);

insert into SpotifyClone.albuns(album_titulo, artista_id)
values('Envious', 1),('Exuberant',1),('Hallowed Steam',2), ('Incandescent',3), ('Temporary Culture',4);

insert into SpotifyClone.musicas(album_id, artista_id, musica_titulo)
values (1,1,'Soul For Us'),(1,1,'Reflections of Magic'), (1,1,'Dance with her own'),(2,1,'Troubles Of My Inner Fire'),(2,1,'Time Fireworks'),
(3,2, 'Magic Circus'), (3,2,'Honey, So Do I'),(3,2,'Sweetie, Let\'s Go Wild'), (3,2,'She Knows'), (4,3,'Fantasy for Me'), (4,3,'Celebration Of More'),
(4,3,'Rock His Everything'), (4,3,'Home Forever'),(4,3,'Diamond Power'), (4,3,'Honey, Let\'s Be Silly'), (5,4,'Thang Of Thunder'),(5,4,'Words Of Her Life'),
(5,4,'Without My Streets');

insert into SpotifyClone.historico_de_reproducao(usuario_id, musica_id)
values(1,1),(1,6),(1,14),(1,16),(2,13),(2,17),(2,2),(2,15),(3,4),(3,16),(3,6),(4,3),(4,18),(4,11);

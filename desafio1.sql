DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

CREATE TABLE SpotifyClone.plano(
    plano_id int (11) primary key not null auto_increment,
    plano varchar(100) not null,
    valor_plano decimal(10,2) not null
) engine = InnoDB;

CREATE TABLE SpotifyClone.usuario(
    usuario_id int (11) primary key not null auto_increment, 
    usuario varchar(100) not null,
    idade int(11) not null,
    plano_id int (11) not null,
    foreign key (plano_id) references plano(plano_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.artista(
    artista_id int (11) primary key not null auto_increment,
    artista varchar(100) not null    
) engine = InnoDB;

CREATE TABLE SpotifyClone.album(
    album_id int (11) primary key not null auto_increment,
    album varchar(100) not null,
    artista_id int (11) not null,
    foreign key (artista_id) references artista(artista_id)    
) engine = InnoDB;

CREATE TABLE SpotifyClone.musica(
    musica_id int (11) primary key not null auto_increment,
    musica varchar(255) not null,
    album_id int (11) not null,
    foreign key (album_id) references album(album_id)    
) engine = InnoDB;

CREATE TABLE SpotifyClone.seguindo(
    seguindo_id int (11) primary key not null auto_increment,
    usuario_id int (11) not null,
    artista_id int (11) not null,
    foreign key (usuario_id) references usuario(usuario_id),
    foreign key (artista_id) references artista(artista_id)
) engine = InnoDB;

CREATE TABLE SpotifyClone.historico(
    historico_id int (11) primary key not null auto_increment,
    usuario_id int (11) not null,
    musica_id int (11) not null,
    foreign key (usuario_id) references usuario(usuario_id),
    foreign key (musica_id) references musica(musica_id)
) engine = InnoDB;


INSERT INTO SpotifyClone.plano (plano, valor_plano)
VALUES
  ('gratuito', 0.00),
  ('familiar', 7.99),
  ('universitário', 5.99);

INSERT INTO SpotifyClone.usuario (usuario, idade,plano_id)
VALUES
  ('Thati', 23,1),
  ('Cintia', 35,2),
  ('Bill', 20,3),
  ('Roger', 45,1);

INSERT INTO SpotifyClone.artista (artista)
VALUES
  ('Walter Phoenix'),
  ('Peter Strong'),
  ('Lance Day'),
  ('Freedie Shannon');

INSERT INTO SpotifyClone.album (album, artista_id)
VALUES
  ('Envious', 1),
  ('Exuberant', 1),
  ('Hallowed Steam', 2),  
  ('Incandescent', 3),
  ('Temporary Culture', 4);

INSERT INTO SpotifyClone.musica (musica, album_id)
VALUES
  ('Soul For Us', 1),
  ('Reflections Of Magic',1),
  ('Dance With Her Own',1),
  ('Troubles Of My Inner Fire',2),
  ('Time Fireworks',2),
  ('Magic Circus', 3),
  ('Honey, So Do I', 3),
  ('Sweetie, Let''s''Go Wild',3),
  ('She Knows',3), 
  ('Fantasy For Me', 4),
  ('Celebration Of More', 4), 
  ('Rock His Everything', 4), 
  ('Home Forever', 4), 
  ('Diamond Power', 4), 
  ('Honey, Let''s'' Be Silly',4), 
  ('Thang Of Thunder', 5), 
  ('Words Of Her Life', 5),      
  ('Without My Streets', 5);

INSERT INTO SpotifyClone.historico (usuario_id, musica_id)
VALUES
  (1,1),
  (1,6),
  (1,14),
  (1,16),
  (2,13),
  (2,17),
  (2,2),
  (2,15),
  (3,4),
  (3,16),
  (3,6),
  (4,3),
  (4,18),
  (4,11);

INSERT INTO SpotifyClone.seguindo (usuario_id, artista_id)
VALUES
  (1,1),
  (1,4),
  (1,3),
  (2,1),
  (2,3),
  (3,2),
  (3,1),
  (4,4);

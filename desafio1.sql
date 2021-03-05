create database if not exists SpotifyClone;

create table SpotifyClone.planos(
  plano_id int primary key auto_increment,
  tipo varchar(50) not null,
  preço double not null
) engine = InnoDB;

create table SpotifyClone.usuarios(
  usuario_id int primary key auto_increment,
  nomeUsuario varchar(50) NOT NULL,
  idade int not null,
  plano_id int not null,
  foreign key (plano_id) references SpotifyClone.planos(plano_id)
) engine = InnoDB;

create table SpotifyClone.cantores(
  cantor_id int primary key auto_increment,
  nome varchar(50) not null,
  sobreNome varchar(50)
) engine = InnoDB;

create table SpotifyClone.albuns(
  albun_id int primary key auto_increment,
  nome varchar(50) not null,
  cantor_id int not null,
  foreign key (cantor_id) references SpotifyClone.cantores(cantor_id)
) engine = InnoDB;

create table SpotifyClone.musicas(
  musica_id int primary key auto_increment,
  titulo varchar(50) not null,
  albun_id int not null,
  foreign key (albun_id) references SpotifyClone.albuns(albun_id)
);

create table SpotifyClone.seguidores(
  cantor_id int not null,
  usuario_id int not null,
  primary key (cantor_id, usuario_id),
  foreign key (usuario_id) references SpotifyClone.usuarios(usuario_id),
  foreign key (cantor_id) references SpotifyClone.cantores(cantor_id)
) engine = InnoDB;

create table SpotifyClone.historiocos(
  musica_id int not null,
  usuario_id int not null,
  primary key (musica_id, usuario_id),
  foreign key (usuario_id) references SpotifyClone.usuarios(usuario_id),
  foreign key (musica_id) references SpotifyClone.musicas(musica_id)
) engine = InnoDB;

insert into SpotifyClone.planos (tipo, preço)
values
('gratuito', 0),
('familiar', 7.99),
('universitário', 5.99);

insert into SpotifyClone.usuarios (nomeUsuario, idade, plano_id)
values
('Thati', 23, 1),
('Cintia', 35, 2),
('Bill', 20, 3),
('Roger', 45, 1);

insert into SpotifyClone.cantores (nome, sobreNome)
values
('Walter', 'Phoenix'),
('Peter', 'Strong'),
('Lance', 'Day'),
('Freedie', 'Shannon');

insert into SpotifyClone.albuns (nome, cantor_id)
values
('Envious', 1),
('Exuberant', 1),
('Hallowed Steam', 2),
('Incandescent', 3),
('Temporary Culture', 4);

insert into SpotifyClone.musicas (titulo, albun_id)
values
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
('Dimond Power', 4),
("Honey, Let's Be Silly", 4),
('Thang Of Thunder', 5),
('Words Of Her Life', 5),
('Without My Streets', 5);

insert into SpotifyClone.seguidores (cantor_id, usuario_id)
values
(1, 1),
(4, 1),
(3, 1),
(1, 2),
(3, 2),
(2, 3),
(1, 3),
(4, 4);

insert into SpotifyClone.historiocos (musica_id, usuario_id)
values
(1, 1),
(6, 1),
(14, 1),
(16, 1),
(13, 2),
(17, 2),
(2, 2),
(15, 2),
(4, 3),
(16, 3),
(6, 3),
(3, 4),
(18, 4),
(11, 4);

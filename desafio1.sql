drop database if exists SpotifyClone;
create database SpotifyClone;

create table SpotifyClone.planos(
plano_id int auto_increment primary key,
plano varchar(15) not null,
valor decimal(3,2) not null
);

create table SpotifyClone.usuarios(
usuario_id int auto_increment primary key,
usuario varchar(30) not null,
idade int not null,
plano_id int not null,
foreign key(plano_id) references planos(plano_id)
);

create table SpotifyClone.artistas(
artista_id int auto_increment primary key,
artista varchar(30) not null
);

create table SpotifyClone.albuns(
album_id int auto_increment primary key,
album varchar(30) not null,
artista_id int not null,
foreign key(artista_id) references artistas(artista_id)
);

create table SpotifyClone.cancoes(
cancao_id int auto_increment primary key,
cancao varchar(30) not null,
album_id int not null,
foreign key(album_id) references albuns(album_id)
);

create table SpotifyClone.reproducoes(
usuario_id int not null,
cancao_id int not null,
foreign key(usuario_id) references usuarios(usuario_id),
foreign key(cancao_id) references cancoes(cancao_id),
primary key(usuario_id, cancao_id)
);

create table SpotifyClone.seguindo(
usuario_id int not null,
artista_id int not null,
foreign key(usuario_id) references usuarios(usuario_id),
foreign key(artista_id) references artistas(artista_id),
primary key(usuario_id, artista_id)
);

insert into SpotifyClone.planos values
(default, "gratuito", 0.0),
(default, "universitário", 5.99),
(default, "familiar", 7.99);

insert into SpotifyClone.artistas values
(default, "Walter Phoenix"),
(default, "Peter Strong"),
(default, "Lance Day"),
(default, "Freedie Shannon");

insert into SpotifyClone.usuarios values
(default, "Thati", 23, 1),
(default, "Cintia", 35, 3),
(default, "Bill", 20, 2),
(default, "Roger", 45, 1);

insert into SpotifyClone.albuns values
(default, "Envious", 1),
(default, "Exuberant", 1),
(default, "Hallowed Steam", 2),
(default, "Incandescent", 3),
(default, "Temporary Culture", 4);

insert into SpotifyClone.cancoes values
(default, "Soul For Us", 1),
(default, "Reflections Of Magic", 1),
(default, "Dance With Her Own", 1),
(default, "Troubles Of My Inner Fire", 2),
(default, "Time Fireworks", 2),
(default, "Magic Circus", 3),
(default, "Honey, So Do I", 3),
(default, "Sweetie, Let's Go Wild", 3),
(default, "She Knows", 3),
(default, "Fantasy For Me", 4),
(default, "Celebration Of More", 4),
(default, "Rocks His Everything", 4),
(default, "Home Forever", 4),
(default, "Diamond Power", 4),
(default, "Honey, Let's be Silly", 4),
(default, "Thang Of Thunder", 5),
(default, "Words Of Her Life", 5),
(default, "Without My Streets", 5);

insert into SpotifyClone.reproducoes values
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

insert into SpotifyClone.seguindo values
(1, 1),
(1, 4),
(1, 3),
(2, 1),
(2, 3),
(3, 2),
(3, 1),
(4, 4);

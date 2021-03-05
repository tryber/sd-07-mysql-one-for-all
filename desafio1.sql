DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

create table artistas (
artista_id int primary key auto_increment,
artista varchar(100)
) engine = InnoDB;

insert into artistas (artista)
values
('Walter Phoenix'),
('Peter Strong'),
('Lance Day'),
('Freedie Shannon');

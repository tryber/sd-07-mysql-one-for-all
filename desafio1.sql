DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE Plano(
  plano_id INTEGER auto_increment PRIMARY KEY NOT NULL,
  tipo VARCHAR(30) NOT NULL,
  price DECIMAL(5,2) NOT NULL
) engine = InnoDB;

CREATE TABLE Users(
  user_id INTEGER auto_increment PRIMARY KEY NOT NULL,
  user_name VARCHAR(30) NOT NULL,
  age INTEGER NOT NULL,
  plano_id INTEGER,
  FOREIGN KEY (plano_id) REFERENCES Plano (plano_id)
) engine = InnoDB;

CREATE TABLE Artists(
  artist_id INTEGER auto_increment PRIMARY KEY NOT NULL,
  artist_name VARCHAR(30) NOT NULL
) engine = InnoDB;

CREATE TABLE Album(
  album_id INTEGER auto_increment PRIMARY KEY NOT NULL,
  album_name VARCHAR(30) NOT NULL,
  artist_id INTEGER,
  FOREIGN KEY (artist_id) REFERENCES Artists (artist_id)
) engine = InnoDB;

CREATE TABLE Following(
  PRIMARY KEY (user_id, artist_id),
  user_id INTEGER,
  FOREIGN KEY (user_id) REFERENCES Users (user_id),
  artist_id INTEGER,
  FOREIGN KEY (artist_id) REFERENCES Artists (artist_id)
) engine = InnoDB;


CREATE TABLE Songs(
  song_id INTEGER auto_increment PRIMARY KEY NOT NULL,
  song_name VARCHAR(30) NOT NULL,
  album_id INTEGER,
  FOREIGN KEY (album_id) REFERENCES Album (album_id)
) engine = InnoDB;

CREATE TABLE Music_history(
  PRIMARY KEY (user_id, song_id),	
  user_id INTEGER,
  FOREIGN KEY (user_id) REFERENCES Users (user_id),
  song_id INTEGER,
  FOREIGN KEY (song_id) REFERENCES Songs (song_id)
) engine = InnoDB;

INSERT INTO Artists(artist_name) VALUES
('Walter Phoenix'),
('Peter Strong'),
('Lance Day'),
('Freedie Shannon');

INSERT INTO Album(album_name, artist_id) VALUES
('Envious', 1),
('Exuberant', 1),
('Hallowed Steam', 2),
('Incandescent', 3),
('Temporary Culture', 4);

INSERT INTO Plano(tipo, price) VALUES
('gratuito', 0),
('familiar', 7.99),
('universitário', 5.99);

INSERT INTO Users(user_name, age, plano_id) VALUES
('Thati', 23, 1),
('Cintia', 35, 2),
('Bill', 20, 3),
('Roger', 45, 1);

INSERT INTO Songs(song_name, album_id) VALUES
('Saul For US', 1),
('Reflections Of Magic', 1),
('Dance With Her Own', 1),
('Troubles Of My Inner Fire', 2),
('Time Fireworks', 2),
('Magic Circus', 3),
('Honey, So Do I', 3),
('Sweetie, Lets Go Wild ', 3),
('She Knows', 3),
('Fantasy For Me', 4),
('Celebration Of More', 4),
('Rock His Everything', 4),
('Home Forever', 4),
('Diamond Power', 4),
('Honey, Lets Be Silly', 4),
('Thang Of Thunder', 5),
('Words Of Her Life', 5),
('Without My Streets', 5);

INSERT INTO Music_history(user_id, song_id) VALUES
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

INSERT INTO Following(user_id, artist_id) VALUES
(1, 1),
(1, 4),
(1, 3),
(2, 1),
(2, 3),
(3, 2),
(3, 1),
(4, 1);

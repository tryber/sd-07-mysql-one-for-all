DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;
USE SpotifyClone;

CREATE TABLE IF NOT EXISTS artist(
id INT PRIMARY KEY AUTO_INCREMENT,
artist_name VARCHAR(100)) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS album(
id INT PRIMARY KEY AUTO_INCREMENT,
artist_id INT NOT NULL,
album_title VARCHAR(100) NOT NULL,
released_year DATE NOT NULL,
FOREIGN KEY (artist_id) REFERENCES artist(id)) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS song(
id INT PRIMARY KEY AUTO_INCREMENT, 
album_id INT NOT NULL,
song_title VARCHAR(100) NOT NULL,
song_length Varchar(4) NOT NULL,
FOREIGN KEY (album_id) REFERENCES album(id)) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS plan(
id INT PRIMARY KEY AUTO_INCREMENT, 
plan VARCHAR(100) NOT NULL, 
price INT(100) NOT NULL,
activated BOOLEAN) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS users(
id INT PRIMARY KEY AUTO_INCREMENT,
plan_id INT NOT NULL,
first_name VARCHAR(100) NOT NULL, 
last_name VARCHAR(100) NOT NULL,
age INT(100) NOT NULL,
FOREIGN KEY (plan_id) REFERENCES plan(id)) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS history_reproduction(
user_id INT NOT NULL, 
song_id INT NOT NULL,
PRIMARY KEY (user_id, song_id),
FOREIGN KEY (user_id) REFERENCES users(id),
FOREIGN KEY (song_id) REFERENCES song(id)) ENGINE=InnoDB;

CREATE TABLE IF NOT EXISTS follewed_artist(
user_id INT NOT NULL,
artist_id INT NOT NULL,
PRIMARY KEY (user_id, artist_id),
FOREIGN KEY (user_id) REFERENCES users(id), 
FOREIGN KEY (artist_id) REFERENCES artist(id)) ENGINE=InnoDB;

INSERT INTO plan (plan, price, activated)
VALUES('gratuito', 0, true),
('familiar', 7.99, true),
('universitário', 5.99, true);

INSERT INTO artist (artist_name)
VALUES('Walter Phoenix'),
('Peter Strong'),
('Lance Day'),
('Freedie Shannon');

INSERT INTO album (artist_id, album_title, released_year)
VALUES(1,'Envious', '1994-4-21'),
(1,'Exuberant', '2001-10-3'),
(2,'Hallowed Steam', '2003-7-21'),
(3,'Incandescent', '1998-6-8'),
(4,'Temporary Culture', '2000-1-10');

INSERT INTO song (album_id, song_title, song_length)
VALUES(1, 'Soul For Us','2:45'),
(1,'Reflections Of Magic','2:45'),
(1,'Dance With Her Own','2:45'),
(2,'Troubles Of My Inner Fire','2:45'),
(2,'Time Fireworks','2:45'),
(3,'Magic Circus','2:45'),
(3,'Honey, So Do I','2:45'),
(3,'Sweetie, Lets Go Wild','2:45'),
(3,'She Knows','2:45'),
(4,'Fantasy For Me','2:45'),
(4,'Celebration Of More','2:45'),
(5,'Rock His Everything','2:45'),
(4,'Home Forever','2:45'),
(4,'Diamond Power','2:45'),
(4,'Honey, Lets Be Silly','2:45'),
(5,'Thang Of Thunder','2:45'),
(5,'Words Of Her Life','2:45'),
(5,'Without My Streets','2:45');

INSERT INTO users (plan_id, first_name, last_name, age)
VALUES(1, 'Thati','Sales', 23),
(2, 'Cintia','Dias', 35),
(3, 'Bill','Silva', 20),
(1, 'Roger','Totti', 45);

INSERT INTO history_reproduction (user_id, song_id)
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

INSERT INTO follewed_artist(user_id, artist_id)
VALUES(1, 1),
(1, 4),
(1, 3),
(2, 1),
(2, 3),
(3, 2),
(3, 1),
(4, 4);   

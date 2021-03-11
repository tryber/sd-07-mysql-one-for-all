DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE SpotifyClone;
USE SpotifyClone;

CREATE TABLE artists (
artist_id INT AUTO_INCREMENT PRIMARY KEY,
artist_colum VARCHAR(30) NOT NULL
) ENGINE = InnoDB;

CREATE TABLE albums (
album_id INT AUTO_INCREMENT PRIMARY KEY,
album_colum VARCHAR(30) NOT NULL,
artist_id INT NOT NULL, 
FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
) engine = InnoDB;

CREATE TABLE songs (
song_id INT AUTO_INCREMENT PRIMARY KEY,
song_colum VARCHAR(50) NOT NULL,
album_id INT NOT NULL,
FOREIGN KEY (album_id) REFERENCES albums(album_id)
) engine = InnoDB;

CREATE TABLE plans (
plan_id INT AUTO_INCREMENT PRIMARY KEY,
plan_colum VARCHAR(30) NOT NULL,
plan_price DOUBLE NOT NULL 
) engine = InnoDB;

CREATE TABLE users (
user_id INT AUTO_INCREMENT PRIMARY KEY,
user_colum VARCHAR(30) NOT NULL,
age INT NOT NULL,
plan_id INT NOT NULL,
FOREIGN KEY (plan_id) REFERENCES plans(plan_id)
) engine = InnoDB;

CREATE TABLE history (
song_id INT NOT NULL,
user_id INT NOT NULL,
PRIMARY KEY (song_id, user_id),
FOREIGN KEY (song_id) REFERENCES songs(song_id),
FOREIGN KEY (user_id) REFERENCES users(user_id)
) engine = InnoDB;

CREATE TABLE followers  (
artist_id INT NOT NULL,
user_id INT NOT NULL,
PRIMARY KEY (artist_id, user_id),
FOREIGN KEY (artist_id) REFERENCES artists(artist_id),
FOREIGN KEY (user_id) REFERENCES users(user_id)
) engine = InnoDB;

INSERT INTO artists (artist_colum)
VALUES
('Walter Phoenix'),
('Freedie Shannon'),
('Lance Day'),
('Peter Strong');

INSERT INTO albums (album_colum, artist_id)
VALUES
('Envious',1),
('Exuberant',1),
('Hallowed Steam',4),
('Incandescent',3),
('Temporary Culture',2);

INSERT INTO songs (song_colum, album_id)
VALUES
('Soul For Us',1),
('Reflections Of Magic',1),
('Dance With Her Own', 1),
('Troubles Of My Inner Fire',2),
('Time Fireworks',2),
('Magic Circus',3),
('Honey, So Do I',3),
("Sweetie, Let's Go Wild",3),
('She Knows',3),
('Fantasy For Me',4),
('Celebration Of More',4),
('Rock His Everything',4),
('Home Forever',4),
('Diamond Power',4),
("Honey, Let's Be Silly",4),
('Thang Of Thunder',5),
('Words Of Her Life',5),
('Without My Streets',5);

INSERT INTO plans (plan_colum, plan_price)
VALUES
('gratuito', 0),
('familiar', 7.99),
('universitário', 5.99);

INSERT INTO users (user_colum, age, plan_id)
VALUES 
('Thati', 23, 1),
('Cintia', 35, 2),
('Bill', 20, 3),
('Roger', 45, 1);

INSERT INTO history (user_id, song_id)
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

INSERT INTO followers (user_id, artist_id)
VALUES
(1,1),
(1,4),
(1,3),
(2,1),
(2,3),
(3,2),
(3,1),
(4,4);

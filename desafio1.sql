DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE plans (
plan_id INT PRIMARY KEY AUTO_INCREMENT,
plan VARCHAR(50) NOT NULL,
plan_value DECIMAL(4,2) NOT NULL
) engine = InnoDB;

CREATE TABLE users (
user_id INT PRIMARY KEY AUTO_INCREMENT,
user_name VARCHAR(50) NOT NULL,
age INT NOT NULL,
plan_id INT NOT NULL,
FOREIGN KEY (plan_id) REFERENCES SpotifyClone(plan_id)
) engine = InnoDB;

CREATE TABLE artists (
artist_id INT PRIMARY KEY AUTO_INCREMENT,
artist VARCHAR(100) NOT NULL
) engine = InnoDB;

CREATE TABLE albums (
album_id INT PRIMARY KEY AUTO_INCREMENT,
album VARCHAR(100) NOT NULL,
artist_id INT NOT NULL,
FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
) engine = InnoDB;

CREATE TABLE songs (
song_id INT PRIMARY KEY AUTO_INCREMENT,
song VARCHAR(100) NOT NULL,
artist_id INT NOT NULL,
album_id INT NOT NULL,
FOREIGN KEY (artist_id) REFERENCES SpotifyClone.artists(artist_id),
FOREIGN KEY (album_id) REFERENCES SpotifyClone.albums(album_id)
) engine = InnoDB;

CREATE TABLE playbacks (
user_id INT NOT NULL,
song_id INT NOT NULL,
FOREIGN KEY (user_id) REFERENCES SpotifyClone.users(user_id),
FOREIGN KEY (song_id) REFERENCES SpotifyClone.song(song_id)
) engine = InnoDB;

CREATE TABLE followers (
user_id INT NOT NULL,
artist_id INT NOT NULL,
FOREIGN KEY (user_id) REFERENCES SpotifyClone.users(user_id),
FOREIGN KEY (artist_id) REFERENCES SpotifyClone.artists(artist_id)
) engine = InnoDB;

INSERT INTO plans (plan, plan_value)
VALUES
('gratuito', 00.00),
('universitário', 05.99),
('familiar', 07.99);

INSERT INTO users (user_name, age, plan_id)
VALUES
('Thati', 23, 1),
('Cintia', 35, 3),
('Bill', 20, 2),
('Roger', 45, 1);

INSERT INTO artists (artist)
VALUES
('Freedie Shannon'),
('Lance Day'),
('Peter Strong'),
('Walter Phoenix');  

INSERT INTO albums (album, artist_id)
VALUES
('Envious', 4),
('Exuberant', 4),
('Hallowed Steam', 3),
('Incandescent', 2),
('Temporary Culture', 1);

INSERT INTO songs (song, artist_id, album_id)
VALUES
('Celebration Of More', 2, 4),
('Dance With Her Own', 4, 1),
('Diamond Power', 2, 4),
('Fantasy For Me', 2, 4),
('Home Forever', 2, 4),
("Honey, Let's Be Silly", 2, 4),
("Honey, So Do I", 3, 3),
('Magic Circus', 3, 3),
('Reflections Of Magic', 4, 1),
('Rock His Everything', 2, 4),
('She Knows', 3, 3),
('Soul For Us', 4, 1),
("Sweetie, Let's Go Wild", 3, 3),
('Thang Of Thunder', 1, 5),
('Time Fireworks', 4, 2),
('Troubles Of My Inner Fire', 4, 2),
('Without My Streets', 1, 5),
('Words Of Her Life', 1, 5);

INSERT INTO playbacks (user_id, song_id)
VALUES
(1, 12),
(1, 8),
(1, 3),
(1, 14),
(2, 5),
(2, 18),
(2, 9),
(2, 6),
(3, 16),
(3, 14),
(3, 8),
(4, 2),
(4, 17),
(4, 1);

INSERT INTO followers (user_id, artist_id)
VALUES
(1, 4),
(1, 1),
(1, 2),
(2, 4),
(2, 2),
(3, 3),
(3, 4),
(4, 1);

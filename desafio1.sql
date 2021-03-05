DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE plans(
plan_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
plan_name VARCHAR(50) NOT NULL,
price DECIMAL(3,2) NOT NULL DEFAULT 0.00,
PRIMARY KEY (plan_id)
) engine = InnoDB;

CREATE TABLE users(
user_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
name VARCHAR(50) NOT NULL,
age INT UNSIGNED NOT NULL,
plan_id INT UNSIGNED NOT NULL,
PRIMARY KEY (user_id),
KEY idx_fk_plan_id (plan_id),
CONSTRAINT fk_user_plan FOREIGN KEY (plan_id)
REFERENCES plans (plan_id) ON DELETE RESTRICT ON UPDATE CASCADE
) engine = InnoDB;

CREATE TABLE artists(
artist_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
name VARCHAR(50) NOT NULL,
PRIMARY KEY (artist_id)
) engine = InnoDB;

CREATE TABLE albums(
album_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
album_name VARCHAR(50) NOT NULL,
artist_id INT UNSIGNED NOT NULL,
PRIMARY KEY (album_id),
CONSTRAINT fk_albums_artist FOREIGN KEY (artist_id)
REFERENCES artists (artist_id) ON DELETE RESTRICT ON UPDATE CASCADE
) engine = InnoDB;

CREATE TABLE songs(
song_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
song_name VARCHAR(50) NOT NULL,
artist_id INT UNSIGNED NOT NULL,
album_id INT UNSIGNED NOT NULL,
PRIMARY KEY (song_id),
CONSTRAINT fk_songs_artist FOREIGN KEY (artist_id)
REFERENCES artists (artist_id) ON DELETE RESTRICT ON UPDATE CASCADE,
CONSTRAINT fk_songs_album FOREIGN KEY (album_id)
REFERENCES albums (album_id) ON DELETE RESTRICT ON UPDATE CASCADE
) engine = InnoDB;

CREATE TABLE reproduction_history(
history_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
user_id INT UNSIGNED NOT NULL,
song_id INT UNSIGNED NOT NULL,
PRIMARY KEY (history_id),
KEY idx_fk_user_id (user_id),
KEY idx_fk_song_id (song_id),
CONSTRAINT fk_reproduction_history_user FOREIGN KEY (user_id)
REFERENCES users (user_id) ON DELETE RESTRICT ON UPDATE CASCADE,
CONSTRAINT fk_reproduction_history_song FOREIGN KEY (song_id)
REFERENCES songs (song_id) ON DELETE RESTRICT ON UPDATE CASCADE
) engine = InnoDB;

CREATE TABLE followers(
follower_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
artist_id INT UNSIGNED NOT NULL,
user_id INT UNSIGNED NOT NULL,
PRIMARY KEY (follower_id),
KEY idx_fk_artist_id (artist_id),
KEY idx_fk_user_id (user_id),
CONSTRAINT fk_followers_artist FOREIGN KEY (artist_id)
REFERENCES artists (artist_id) ON DELETE RESTRICT ON UPDATE CASCADE,
CONSTRAINT fk_followers_user FOREIGN KEY (user_id)
REFERENCES users (user_id) ON DELETE RESTRICT ON UPDATE CASCADE
) engine = InnoDB;

INSERT INTO plans (plan_id, plan_name, price)
VALUES
(1, 'Gratuito', 0.00),
(2, 'Universitário', 5.99),
(3, 'Familiar', 7.99);
  
INSERT INTO users (user_id, name, age, plan_id)
VALUES
(1, 'Tathi', 23, 1),
(2, 'Cintia', 35, 3),
(3, 'Bill', 20, 2),
(4, 'Roger', 45, 1);

INSERT INTO artists (artist_id, name)
VALUES
(1, 'Freedie Shannon'),
(2, 'Lance Day'),
(3, 'Peter Strong'),
(4, 'Walter Phoenix');
  
INSERT INTO albums (album_id, album_name, artist_id)
VALUES
(1, 'Envious', 4),
(2, 'Exuberant', 4),
(3, 'Hallowed Steam', 3),
(4, 'Incandescent', 2),
(5, 'Temporary Culture', 1);
  
INSERT INTO songs (song_id, song_name, artist_id, album_id)
VALUES
(1, 'Soul For Us', 4, 1),
(2, 'Reflections Of Magic', 4, 1),
(3, 'Dance With Her Own', 4, 1),
(4, 'Troubles Of My Inner Fire', 4, 2),
(5, 'Time Fireworks', 4, 2),
(6, 'Magic Circus', 3, 3),
(7, 'Honey, So Do I', 3, 3),
(8, "Sweetie, Let's Go Wild", 3, 3),
(9, 'She Knows', 3, 3),
(10, 'Fantasy For Me', 2, 4),
(11, 'Celebration Of More', 2, 4),
(12, 'Rock His Everything', 2, 4),
(13, 'Home Forever', 2, 4),
(14, 'Diamond Power', 2, 4),
(15, "Honey, Let's Be Silly", 2, 4),
(16, 'Thang Of Thunder', 1, 5),
(17, 'Words Of Her Life', 1, 5),
(18, 'Without My Streets', 1, 5);
  
INSERT INTO reproduction_history (user_id, song_id)
VALUES
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
  
INSERT INTO followers (artist_id, user_id)
VALUES
(1, 1),
(1, 4),
(2, 1),
(2, 2),
(3, 3),
(4, 1),
(4, 2),
(4, 3);

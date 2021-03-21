DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE IF NOT EXISTS SpotifyClone;

USE SpotifyClone;

CREATE TABLE artist(
artist_id INT PRIMARY KEY AUTO_INCREMENT,
first_name VARCHAR(20),
last_name VARCHAR(30)
) ENGINE = InnoDB;

CREATE TABLE album(
album_id INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(50),
artist_id INT NOT NULL,
FOREIGN KEY (artist_id) REFERENCES artist(artist_id)
) ENGINE = InnoDB;

CREATE TABLE songs(
song_id INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(50),
album_id INT NOT NULL,
FOREIGN KEY (album_id) REFERENCES album(album_id)
) ENGINE = InnoDB;

CREATE TABLE plan(
plan_id INT PRIMARY KEY AUTO_INCREMENT,
`type` VARCHAR(30),
cost REAL
) ENGINE = InnoDB;

CREATE TABLE `user`(
user_id INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(20),
age INT,
plan_id INT NOT NULL,
FOREIGN KEY (plan_id) REFERENCES plan(plan_id)
) ENGINE = InnoDB;

CREATE TABLE user_artist (
-- user_artist_id INT PRIMARY KEY AUTO_INCREMENT,
user_id INT NOT NULL,
artist_id INT NOT NULL,
FOREIGN KEY (user_id) REFERENCES `user`(user_id),
FOREIGN KEY (artist_id) REFERENCES artist(artist_id),
PRIMARY KEY (user_id, artist_id)
) ENGINE = InnoDB;

CREATE TABLE user_songs_reproduction (
-- user_song_id INT PRIMARY KEY AUTO_INCREMENT,
user_id INT NOT NULL,
song_id INT NOT NULL,
FOREIGN KEY (user_id) REFERENCES `user`(user_id),
FOREIGN KEY (song_id) REFERENCES songs(song_id),
PRIMARY KEY (user_id, song_id)
) ENGINE = InnoDB;

-- CREATE TABLE album_artist (
-- -- album_artist_id INT PRIMARY KEY AUTO_INCREMENT,
-- album_id INT NOT NULL,
-- artist_id INT NOT NULL,
-- FOREIGN KEY (album_id) REFERENCES album(album_id),
-- FOREIGN KEY (artist_id) REFERENCES artist(artist_id),
-- CONSTRAINT PK_album_artist_id PRIMARY KEY (album_id, artist_id)
-- ) ENGINE = InnoDB;

-- CREATE TABLE album_song (
-- -- album_song_id INT PRIMARY KEY AUTO_INCREMENT,
-- album_id INT NOT NULL,
-- song_id INT NOT NULL,
-- FOREIGN KEY (album_id) REFERENCES album(album_id),
-- FOREIGN KEY (song_id) REFERENCES songs(song_id),
-- CONSTRAINT PK_album_song_id PRIMARY KEY (album_id, song_id)
-- ) ENGINE = InnoDB;

-- CREATE TABLE user_plan (
-- -- user_plan_id INT PRIMARY KEY AUTO_INCREMENT,
-- user_id INT NOT NULL,
-- plan_id INT NOT NULL,
-- FOREIGN KEY (user_id) REFERENCES `user`(user_id),
-- FOREIGN KEY (plan_id) REFERENCES plan(plan_id),
-- CONSTRAINT PK_user_plan_id PRIMARY KEY (user_id, plan_id)
-- ) ENGINE = InnoDB;

INSERT INTO artist(first_name, last_name) VALUES
("Walter","Phoenix"),
("Peter","Strong"),
("Lance","Day"),
("Freedie","Shannon");

INSERT INTO album(`name`, artist_id) VALUES
("Envious",1),
("Exuberant",1),
("Hallowed Steam",2),
("Incandescent",3),
("Temporary Culture",4);

INSERT INTO songs(`name`, album_id) VALUES
("Soul For Us", 1),
("Reflections Of Magic", 1),
("Dance With Her Own", 1),
("Troubles Of My Inner Fire", 2),
("Time Fireworks", 2),
("Magic Circus", 3),
("Honey, So Do I", 3),
("Sweetie, Let's Go Wild", 3),
("She Knows", 3),
("Fantasy For Me", 4),
("Celebration Of More", 4),
("Rock His Everything", 4),
("Home Forever", 4),
("Diamond Power", 4),
("Honey, Let's Be Silly", 4),
("Thang Of Thunder", 5),
("Words Of Her Life", 5),
("Without My Streets", 5);

INSERT INTO plan(`type`, cost) VALUES
("gratuito",0.00),
("familiar",7.99),
("universitário",5.99);

INSERT INTO `user`(`name`, age, plan_id) VALUES
("Thati",23,1),
("Cintia",35,2),
("Bill",20,3),
("Roger",45,1);

INSERT INTO user_artist(user_id, artist_id) VALUES
(1,1),
(1,3),
(1,4),
(2,1),
(2,3),
(3,1),
(3,2),
(4,4);

INSERT INTO user_songs_reproduction(user_id, song_id) VALUES
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

-- INSERT INTO album_artist(album_id, artist_id) VALUES
-- (1,1),
-- (2,1),
-- (3,2),
-- (4,3),
-- (5,4);

-- INSERT INTO album_song(album_id, song_id) VALUES
-- (1,1),
-- (1,2),
-- (1,3),
-- (2,4),
-- (2,5),
-- (3,6),
-- (3,7),
-- (3,8),
-- (3,9),
-- (4,10),
-- (4,11),
-- (4,12),
-- (4,13),
-- (4,14),
-- (4,15),
-- (5,16),
-- (5,17),
-- (5,18);

-- INSERT INTO user_plan(user_id, plan_id) VALUES
-- (1,1),
-- (2,2),
-- (3,3),
-- (4,1);

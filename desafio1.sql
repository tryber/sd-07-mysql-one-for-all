DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;

USE SpotifyClone;

DROP TABLE IF EXISTS `plans`;
CREATE TABLE IF NOT EXISTS `plans` (
	plans_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    plan VARCHAR(40) NOT NULL,
    price DECIMAL(5, 2) NOT NULL
) ENGINE = InnoDB;

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
	user_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name_users VARCHAR(50) NOT NULL,
    age INT,
    plans_id INT NOT NULL,
    FOREIGN KEY (`plans_id`)
		REFERENCES SpotifyClone.plans (`plans_id`)
) ENGINE = InnoDB;

DROP TABLE IF EXISTS `artists`;
CREATE TABLE IF NOT EXISTS `artists` (
	artist_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	name_artists VARCHAR (50)
) ENGINE = InnoDB;

DROP TABLE IF EXISTS `follow`;
CREATE TABLE IF NOT EXISTS `follow` (
	user_id INT,
    artist_id INT,
    PRIMARY KEY(user_id, artist_id),
    FOREIGN KEY (`user_id`)
		REFERENCES SpotifyClone.users(`user_id`),
	FOREIGN KEY (`artist_id`)
		REFERENCES SpotifyClone.artists(`artist_id`)
) ENGINE = InnoDB;

DROP TABLE IF EXISTS `albums`;
CREATE TABLE IF NOT EXISTS `albums` (
	album_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name_album VARCHAR(100),
    artist_id INT,
    FOREIGN KEY (`artist_id`)
		REFERENCES SpotifyClone.artists(`artist_id`)
) ENGINE = InnoDB;

DROP TABLE IF EXISTS `songs`;
CREATE TABLE IF NOT EXISTS `songs` (
	songs_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name_songs VARCHAR(100),
    album_id INT,
    FOREIGN KEY (`album_id`)
		REFERENCES SpotifyClone.albums(`album_id`)
) ENGINE = InnoDB;

DROP TABLE IF EXISTS `reproductions`;
CREATE TABLE IF NOT EXISTS `reproductions` (
	reproductions_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    songs_id INT,
    FOREIGN KEY (`user_id`)
		REFERENCES SpotifyClone.users(`user_id`),
	FOREIGN KEY (`songs_id`)
		REFERENCES SpotifyClone.songs(`songs_id`)
) ENGINE = InnoDB;

INSERT INTO plans (plan, price)
VALUES
('gratuito', 0),
('familiar', 7.99),
('universitário', 5.99);

INSERT INTO users (name_users, age, plans_id)
VALUES
('Thati', 23, 1),
('Cintia', 35, 2),
('Bill', 20, 3),
('Roger', 45, 1);

INSERT INTO artists (name_artists)
VALUES
('Walter Phoenix'),
('Peter Strong'),
('Lance Day'),
('Freedie Shannon');

INSERT INTO follow (user_id, artist_id)
VALUES
(1, 1),
(1, 4),
(1, 3),
(2, 1),
(2, 3),
(3, 2),
(3, 1),
(4, 4);

INSERT INTO albums (name_album, artist_id)
VALUES
('Envious', 1),
('Exuberant', 1),
('Hallowed Steam', 2),
('Incandescent', 3),
('Temporary Culture', 4);

INSERT INTO songs (name_songs, album_id)
VALUES
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
('Diamond Power', 4),
("Honey, Let's Be Silly", 4),
('Thang Of Thunder', 5),
('Words Of Her Life', 5),
('Without My Streets', 5);

INSERT INTO reproductions (user_id, songs_id)
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

DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE subscriptions (
  `sub_id` int NOT NULL AUTO_INCREMENT,
  `subscription` varchar(255) NOT NULL,
  `sub_value` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`sub_id`),
  UNIQUE KEY `sub_id_UNIQUE` (`sub_id`),
  UNIQUE KEY `subscription_UNIQUE` (`subscription`)
) ENGINE=InnoDB;

INSERT INTO subscriptions(subscription, sub_value)
VALUES
('gratuito', 0),
('familiar', 7.99),
('universitário', 5.99);

CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) NOT NULL,
  `user_age` int NOT NULL,
  `subscription_id` int NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `fk_user_sub_idx` (`subscription_id`),
  CONSTRAINT `fk_user_sub` FOREIGN KEY (`subscription_id`) REFERENCES `subscriptions` (`sub_id`)
) ENGINE=InnoDB;

INSERT INTO users(user_name, user_age, subscription_id)
VALUES
('Thati', 23, 1),
('Cintia', 35, 2),
('Bill', 20, 3),
('Roger', 45, 1);

CREATE TABLE `artists` (
  `artist_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`artist_id`),
  UNIQUE KEY `artist_id_UNIQUE` (`artist_id`)
) ENGINE=InnoDB;

INSERT INTO artists(name)
VALUES
('Walter Phoenix'),
('Peter Strong'),
('Lance Day'),
('Freedie Shannon');

CREATE TABLE `albums` (
  `album_id` int NOT NULL AUTO_INCREMENT,
  `album_name` varchar(255) NOT NULL,
  `artist_id` int NOT NULL,
  PRIMARY KEY (`album_id`),
  UNIQUE KEY `album_id_UNIQUE` (`album_id`),
  KEY `fk_albums_artist_idx` (`artist_id`),
  CONSTRAINT `fk_albums_artist` FOREIGN KEY (`artist_id`) REFERENCES `artists` (`artist_id`)
) ENGINE=InnoDB;

INSERT INTO albums(album_name, artist_id)
VALUES
('Envious', 1),
('Exuberant', 1),
('Hallowed Steam', 2),
('Incandescent', 3),
('Temporary Culture', 4);

CREATE TABLE `songs` (
  `song_id` int NOT NULL AUTO_INCREMENT,
  `song_title` varchar(255) NOT NULL,
  `album_id` int NOT NULL,
  PRIMARY KEY (`song_id`),
  KEY `fk_song_album_idx` (`album_id`),
  CONSTRAINT `fk_song_album` FOREIGN KEY (`album_id`) REFERENCES `albums` (`album_id`)
) ENGINE=InnoDB;

INSERT INTO songs(song_title, album_id)
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
("Without My Streets", 5);

CREATE TABLE `followers` (
  `user_id` int NOT NULL,
  `artist_id` int NOT NULL,
  KEY `fk_following_user_idx` (`user_id`),
  KEY `fk_following_artist_idx` (`artist_id`),
  CONSTRAINT `fk_following_artist` FOREIGN KEY (`artist_id`) REFERENCES `artists` (`artist_id`),
  CONSTRAINT `fk_following_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  PRIMARY KEY (user_id, artist_id)
) ENGINE=InnoDB;

INSERT INTO followers(user_id, artist_id)
VALUES
(1, 1),
(1, 4),
(1, 3),
(2, 1),
(2, 3),
(3, 2),
(3, 1),
(4, 4);

CREATE TABLE `plays` (
  `song_id` int NOT NULL,
  `user_id` int NOT NULL,
  KEY `fk_play_song_idx` (`song_id`),
  KEY `fk_plays_user_idx` (`user_id`),
  CONSTRAINT `fk_play_song` FOREIGN KEY (`song_id`) REFERENCES `songs` (`song_id`),
  CONSTRAINT `fk_plays_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  PRIMARY KEY (song_id, user_id)
) ENGINE=InnoDB;

INSERT INTO plays(song_id, user_id)
VALUES
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

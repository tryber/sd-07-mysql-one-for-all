DROP DATABASE IF EXISTS `SpotifyClone` ;

CREATE DATABASE IF NOT EXISTS `SpotifyClone`;

USE `SpotifyClone` ;

DROP TABLE IF EXISTS `plans` ;

CREATE TABLE IF NOT EXISTS `plans` (
  `plan_id` INT PRIMARY KEY AUTO_INCREMENT,
  `plan_name` VARCHAR(100) NOT NULL,
  `price` DECIMAL(5, 2) NOT NULL)
ENGINE = InnoDB;

DROP TABLE IF EXISTS `users` ;

CREATE TABLE IF NOT EXISTS `users` (
  `user_id` INT PRIMARY KEY AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `age` INT NOT NULL,
  `plan_id` INT NOT NULL,
  CONSTRAINT `fk_users_plans`
    FOREIGN KEY (`plan_id`)
    REFERENCES `plans` (`plan_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
)ENGINE = InnoDB;

DROP TABLE IF EXISTS `artists` ;

CREATE TABLE IF NOT EXISTS `artists` (
  `artist_id` INT PRIMARY KEY AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL )
ENGINE = InnoDB;

DROP TABLE IF EXISTS `albums` ;

CREATE TABLE IF NOT EXISTS `albums` (
  `album_id` INT PRIMARY KEY AUTO_INCREMENT,
  `album_name` VARCHAR(100) NOT NULL,
  `artist_id` INT NOT NULL,
  CONSTRAINT `fk_albums_artists`
    FOREIGN KEY (`artist_id`)
    REFERENCES `artists` (`artist_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
)ENGINE = InnoDB;

DROP TABLE IF EXISTS `followers` ;

CREATE TABLE IF NOT EXISTS `followers` (
  `user_id` INT NOT NULL,
  `artist_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `artist_id`),
  CONSTRAINT `fk_follow_users`
    FOREIGN KEY (`user_id`)
    REFERENCES `users` (`user_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_folow_artists`
    FOREIGN KEY (`artist_id`)
    REFERENCES `artists` (`artist_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
)ENGINE = InnoDB;

DROP TABLE IF EXISTS `songs` ;

CREATE TABLE IF NOT EXISTS `songs` (
  `song_id` INT PRIMARY KEY AUTO_INCREMENT,
  `song_name` VARCHAR(100) NOT NULL,
  `artist_id` INT NOT NULL,
  `album_id` INT NOT NULL,
  CONSTRAINT `fk_songs_artists`
    FOREIGN KEY (`artist_id`)
    REFERENCES `artists` (`artist_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
  CONSTRAINT `fk_songs_albums`
    FOREIGN KEY (`album_id`)
    REFERENCES `albums` (`album_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
)ENGINE = InnoDB;

DROP TABLE IF EXISTS `reproduction_history` ;

CREATE TABLE IF NOT EXISTS `reproduction_history` (
  `user_id` INT NOT NULL,
  `song_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `song_id`),
  CONSTRAINT `fk_history_users`
    FOREIGN KEY (`user_id`)
    REFERENCES `users` (`user_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_history_songs`
    FOREIGN KEY (`song_id`)
    REFERENCES `songs` (`song_id`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
)ENGINE = InnoDB;

INSERT INTO `plans` (`name`, `price`) VALUES 
('gratuito', 0),
('familiar', 7.99),
('universitário', 5.99);

INSERT INTO `users` (`name`, `age`, `plan_id`) VALUES 
('Thati', 23, 1),
('Cintia', 35, 2),
('Bill', 20, 3),
('Roger', 45, 1);

INSERT INTO `artists` (`name`) VALUES 
('Freedie Shannon'),
('Lance Day'),
('Peter Strong'),
('Walter Phoenix');

INSERT INTO `albums` (`album_name`, `artist_id`) VALUES
('Envious', 4),
('Exuberant', 4),
('Hallowed Steam', 3),
('Incandescent', 2),
('Temporary Culture', 1);

INSERT INTO `followers` (`user_id`, `artist_id`) VALUES
(1, 1),
(1, 2),
(1, 4),
(2, 2),
(2, 4),
(3, 3),
(3, 4),
(4, 1);

INSERT INTO `songs` (`song_name`, `album_id`) VALUES
('Soul For Us', 1),
('Reflections Of Magic', 1),
('Dance With Her Own', 1),
('Troubles Of My Inner Fire', 2),
('Time Fireworks', 2),
('Magic Circus', 3),
('Honey, So Do I', 3),
('Sweetie, Let\'s Go Wild', 3),
('She Knows', 3),
('Fantasy For Me', 4),
('Celebration Of More', 4),
('Rock His Everything', 4),
('Home Forever', 4),
('Diamond Power', 4),
('Honey, Let\'s Be Silly', 4),
('Thang Of Thunder', 5),
('Words Of Her Life', 5),
('Without My Streets', 5);

INSERT INTO `reproduction_history` (`user_id`, `song_id`) VALUES 
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

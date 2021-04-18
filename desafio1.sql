DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE IF NOT EXISTS `planos` (
  `plano_id` INT PRIMARY KEY AUTO_INCREMENT,
  `nome_plano` VARCHAR(45) NOT NULL,
  `valor` DECIMAL(5, 2) NOT NULL
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `users` (
`user_id` INT NOT NULL AUTO_INCREMENT,
`username` CHAR(100) NOT NULL,
`age` INT NOT NULL,
`plano_id` INT NOT NULL,
PRIMARY KEY (`user_id`),
FOREIGN KEY (`plano_id`) REFERENCES `planos` (`plano_id`)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `artists` (
`artist_id` INT NOT NULL AUTO_INCREMENT,
`artist` CHAR(100) NOT NULL,
PRIMARY KEY (`artist_id`)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `albums` (
`album_id` INT NOT NULL AUTO_INCREMENT,
`album` CHAR(100) NOT NULL,
`artist_id` INT NOT NULL,
PRIMARY KEY (`album_id`),
FOREIGN KEY (`artist_id`) REFERENCES `artists` (`artist_id`)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `songs` (
`song_id` INT NOT NULL AUTO_INCREMENT,
`song` CHAR(100) NOT NULL,
`album_id` INT NOT NULL,
PRIMARY KEY (`song_id`),
FOREIGN KEY (`album_id`) REFERENCES `albums` (`album_id`)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `musichistory` (
`user_id` INT NOT NULL,
`song_id` INT NOT NULL,
PRIMARY KEY (`user_id`, `song_id`),
FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
FOREIGN KEY (`song_id`) REFERENCES `songs` (`song_id`)
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `followers` (
`user_id` INT NOT NULL,
`artist_id` INT NOT NULL,
PRIMARY KEY (`user_id`, `artist_id`),
FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
FOREIGN KEY (`artist_id`) REFERENCES `artists` (`artist_id`)
) ENGINE = InnoDB;

INSERT INTO `planos` (`nome_plano`, `valor`)
VALUES ('gratuito', 0),
('familiar', 7.99),
('universitário', 5.99);

INSERT INTO `users` (`username`, `age`, `plano_id`) 
VALUES('Thati', 23, 1),
('Cintia', 35, 2),
('Bill', 20, 3),
('Roger', 45, 1);

INSERT INTO `artists` (`artist`)
VALUES ('Walter Phoenix'),
('Peter Strong'),
('Lance Day'),
('Freedie Shannon');

INSERT INTO `albums` (`album`, `artist_id`)
VALUES ('Envious', 1),
('Exuberant', 1),
('Hallowed Steam', 2),
('Incandescent', 3),
('Temporary Culture', 4);

INSERT INTO `songs` (`song`, `album_id`)
VALUES ('Soul For Us', 1),
('Reflections Of Magic', 1),
('Dance With Her Own', 1),
('Troubles Of My Inner Fire', 2),
('Time Fireworks', 2),
('Magic Circus', 3),
('Honey, So Do I', 3),
('Sweetie, Let''s Go Wild', 3),
('She Knows', 3),
('Fantasy For Me', 4),
('Celebration Of More', 4),
('Rock His Everything', 4),
('Home Forever', 4),
('Diamond Power', 4),
('Honey, Let''s Be Silly', 4),
('Thang Of Thunder', 5),
('Words Of Her Life', 5),
('Without My Streets', 5);

INSERT INTO `musichistory` (`user_id`, `song_id`)
VALUES (1, 1),
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

INSERT INTO `followers` (`user_id`, `artist_id`)
VALUES (1, 1),
(1, 4),
(1, 3),
(2, 1),
(2, 3),
(3, 2),
(3, 1),
(4, 4);

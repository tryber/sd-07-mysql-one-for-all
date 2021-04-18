DROP SCHEMA IF EXISTS spotifyclone;
CREATE SCHEMA spotifyclone;
USE spotifyclone;

DROP TABLE IF EXISTS plans;
CREATE TABLE plans (
PLAN_ID INT NOT NULL AUTO_INCREMENT,
PLAN CHAR(100) NOT NULL,
PLAN_VALUE DECIMAL(5, 2) NOT NULL,
PRIMARY KEY (PLAN_ID)
) ENGINE = InnoDB;

DROP TABLE IF EXISTS users;
CREATE TABLE users (
USER_ID INT NOT NULL AUTO_INCREMENT,
`USER` CHAR(100) NOT NULL,
AGE INT NOT NULL,
PLAN_ID INT NOT NULL,
PRIMARY KEY (USER_ID),
FOREIGN KEY (PLAN_ID) REFERENCES plans (PLAN_ID)
) ENGINE = InnoDB;

DROP TABLE IF EXISTS artists;
CREATE TABLE artists (
ARTIST_ID INT NOT NULL AUTO_INCREMENT,
ARTIST CHAR(100) NOT NULL,
PRIMARY KEY (ARTIST_ID)
) ENGINE = InnoDB;

DROP TABLE IF EXISTS albums;
CREATE TABLE albums (
ALBUM_ID INT NOT NULL AUTO_INCREMENT,
ALBUM CHAR(100) NOT NULL,
ARTIST_ID INT NOT NULL,
PRIMARY KEY (ALBUM_ID),
FOREIGN KEY (ARTIST_ID) REFERENCES artists (ARTIST_ID)
) ENGINE = InnoDB;

DROP TABLE IF EXISTS songs;
CREATE TABLE songs (
SONG_ID INT NOT NULL AUTO_INCREMENT,
SONG CHAR(100) NOT NULL,
ALBUM_ID INT NOT NULL,
PRIMARY KEY (SONG_ID),
FOREIGN KEY (ALBUM_ID) REFERENCES albums (ALBUM_ID)
) ENGINE = InnoDB;

DROP TABLE IF EXISTS `history`;
CREATE TABLE `history` (
USER_ID INT NOT NULL,
SONG_ID INT NOT NULL,
PRIMARY KEY (USER_ID, SONG_ID),
FOREIGN KEY (USER_ID) REFERENCES users (USER_ID),
FOREIGN KEY (SONG_ID) REFERENCES songs (SONG_ID)
) ENGINE = InnoDB;

DROP TABLE IF EXISTS followers;
CREATE TABLE followers (
USER_ID INT NOT NULL,
ARTIST_ID INT NOT NULL,
PRIMARY KEY (USER_ID, ARTIST_ID),
FOREIGN KEY (USER_ID) REFERENCES users (USER_ID),
FOREIGN KEY (ARTIST_ID) REFERENCES artists (ARTIST_ID)
) ENGINE = InnoDB;

INSERT INTO plans (PLAN, PLAN_VALUE)
VALUES ('gratuito', 0),
('familiar', 7.99),
('universitário', 5.99);

INSERT INTO USERS (`USER`, AGE, PLAN_ID) 
VALUES('Thati', 23, 1),
('Cintia', 35, 2),
('Bill', 20, 3),
('Roger', 45, 1);

INSERT INTO artists (ARTIST)
VALUES ('Walter Phoenix'),
('Peter Strong'),
('Lance Day'),
('Freedie Shannon');

INSERT INTO albums (ALBUM, ARTIST_ID)
VALUES ('Envious', 1),
('Exuberant', 1),
('Hallowed Steam', 2),
('Incandescent', 3),
('Temporary Culture', 4);

INSERT INTO songs (SONG, ALBUM_ID)
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

INSERT INTO `history` (USER_ID, SONG_ID)
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

INSERT INTO followers (USER_ID, ARTIST_ID)
VALUES (1, 1),
(1, 4),
(1, 3),
(2, 1),
(2, 3),
(3, 2),
(3, 1),
(4, 4);

DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE plans(
    plan_id INT PRIMARY KEY  AUTO_INCREMENT,
    plan VARCHAR(100),
    planValue DECIMAL(4,2) NOT NULL
) engine = InnoDB;

CREATE TABLE users(
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    uname VARCHAR(100),
    age INT NOT NULL,
    plan_id INT,
    FOREIGN KEY (plan_id) REFERENCES plans(plan_id)
) engine = InnoDB;

CREATE TABLE artists(
    artist_id INT PRIMARY KEY  AUTO_INCREMENT,
    artist VARCHAR(100)
) engine = InnoDB;

CREATE TABLE albuns(
    album_id INT PRIMARY KEY  AUTO_INCREMENT,
    album VARCHAR(100),
    artist_id INT,
    FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
) engine = InnoDB;

CREATE TABLE songs(
	song_id INT PRIMARY KEY  AUTO_INCREMENT,
    song VARCHAR(100)
) engine = InnoDB;

CREATE TABLE folowers(
	user_id INT,
    artist_id INT,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
) engine = InnoDB;

CREATE TABLE histories(
	user_id INT,
    song_id INT,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (song_id) REFERENCES songs(song_id)
) engine = InnoDB;

INSERT INTO plans (plan, planValue)
VALUES
('gratuito', 0), 
('universitário', 5.99), 
('familiar', 7.99);

INSERT INTO users (uname, age, plan_id)
VALUES
('Thati', 23, 1), 
('Cintia', 35, 3), 
('Bill', 20, 2), 
('Roger', 45, 1);

INSERT INTO artists (artist)
VALUES
('Walter Phoenix'), 
('Peter Strong'), 
('Lance Day'), 
('Freedie Shannon');

INSERT INTO albuns (album, artist_id)
VALUES
('Envious', 1), 
('Exuberant', 1), 
('Hallowed Steam', 2), 
('Incandescent', 3), 
('Temporary Culture', 4);

INSERT INTO songs (song)
VALUES
('Soul For Us'), 
('Reflections Of Magic'), 
('Dance With Her Own'), 
('Troubles Of My Inner Fire'), 
('Time Fireworks'), 
('Magic Circus'), 
('Honey, So Do I'), 
("Sweetie, Let's Go Wild"), 
('She Knows'), 
('Fantasy For Me'), 
('Celebration Of More'), 
('Rock His Everything'), 
('Home Foreve'), 
('Diamond Power'), 
("Honey, Let's Be Silly"), 
('Thang Of Thunder'), 
('Words Of Her Life'), 
('Without My Streets');

INSERT INTO histories (user_id, song_id)
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

INSERT INTO folowers (user_id, artist_id)
VALUES
(1, 1), 
(1, 4), 
(1, 3), 
(2, 1), 
(2, 3), 
(3, 4), 
(3, 1), 
(4, 4);
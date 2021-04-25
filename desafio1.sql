DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE artists(
  artist_id INT PRIMARY KEY AUTO_INCREMENT,
  artist_name VARCHAR(50)
);

CREATE TABLE monthlyPlans(
  plan_id INT PRIMARY KEY AUTO_INCREMENT,
  plan_name VARCHAR(50),
  plan_value DECIMAL(3,2) NOT NULL
);

CREATE TABLE users(
  user_id INT PRIMARY KEY AUTO_INCREMENT,
  user_name VARCHAR(50) NOT NULL,
  age INT NOT NULL,
  plan_id INT NOT NULL,
  FOREIGN KEY (plan_id) REFERENCES monthlyPlans(plan_id)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION
);

CREATE TABLE albuns(
  album_id INT PRIMARY KEY AUTO_INCREMENT,
  album_name VARCHAR(50) NOT NULL,
  artist_id INT NOT NULL,
  FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION
);

CREATE TABLE songs(
  song_id INT PRIMARY KEY AUTO_INCREMENT,
  song_name VARCHAR(100) NOT NULL,
  album_id INT NOT NULL,
  FOREIGN KEY (album_id) REFERENCES albuns(album_id)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION
);

CREATE TABLE playedMusicHistory(
  song_id INT NOT NULL,
  user_id INT NOT NULL,
  PRIMARY KEY (song_id, user_id),
  FOREIGN KEY (song_id) REFERENCES songs(song_id)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
  FOREIGN KEY (user_id) REFERENCES users(user_id)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION
);

CREATE TABLE followingArtists(
  user_id INT,
  artist_id INT,
  PRIMARY KEY (user_id, artist_id),
  FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
  FOREIGN KEY (user_id) REFERENCES users(user_id)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION
);
/* linha 44 e 53 feitas com ajuda do código da @vanessaberbidi */

INSERT INTO artists(artist_name)
VALUES
('Walter Phoenix'),
('Peter Strong'),
('Lance Day'),
('Freedie Shannon');

INSERT INTO monthlyPlans(plan_name, plan_value)
VALUES
('gratuito', 0),
('familiar', 7.99),
('universitário', 5.99);

INSERT INTO users(user_name, age, plan_id)
VALUES
('Thati',	23, 1),
('Cintia', 35, 2),
('Bill', 20, 3),
('Roger', 45, 1);

INSERT INTO albuns(album_name, artist_id)
VALUES
('Envious', 1),
('Exuberant', 1),
('Hallowed Steam', 2),
('Incandescent', 3),
('Temporary Culture', 4);

INSERT INTO songs(song_name, album_id)
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

INSERT INTO playedMusicHistory(song_id, user_id)
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

INSERT INTO followingArtists(user_id, artist_id)
VALUES
(1, 1),
(1, 4),
(1, 3),
(2, 1),
(2, 3),
(3, 2),
(3, 1),
(4, 4);

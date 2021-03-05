DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE SpotifyClone;
USE SpotifyClone;
CREATE TABLE Artist(
  artist_ID INT PRIMARY KEY AUTO_INCREMENT,
  artist_name VARCHAR(50) NOT NULL
) engine = InnoDB;
CREATE TABLE Album(
  album_ID INT PRIMARY KEY AUTO_INCREMENT,
  album_name VARCHAR(50) NOT NULL,
  artist_ID INT NOT NULL,
  FOREIGN KEY (artist_ID) REFERENCES Artist(artist_ID)
) engine = InnoDB;
CREATE TABLE Subscription(
  subscription_ID INT PRIMARY KEY AUTO_INCREMENT,
  subscription_name VARCHAR(50) NOT NULL,
  subscription_price DECIMAL(5, 2) NOT NULL
) engine = InnoDB;
CREATE TABLE Artist_Album(
  artist_ID INT NOT NULL,
  album_ID INT NOT NULL,
  FOREIGN KEY (artist_ID) REFERENCES Artist(artist_ID),
  FOREIGN KEY (album_ID) REFERENCES Album(album_ID)
) engine = InnoDB;
CREATE TABLE User(
  user_ID INT PRIMARY KEY AUTO_INCREMENT,
  user_name VARCHAR(50) NOT NULL,
  user_age INT NOT NULL,
  subscription_ID INT NOT NULL,
  FOREIGN KEY (subscription_ID) REFERENCES Subscription(subscription_ID)
) engine = InnoDB;
CREATE TABLE User_Artist(
  user_ID INT NOT NULL,
  artist_ID INT NOT NULL,
  PRIMARY KEY (user_ID, artist_ID),
  FOREIGN KEY (user_ID) REFERENCES User(user_ID),
  FOREIGN KEY (artist_ID) REFERENCES Artist(artist_ID)
) engine = InnoDB;
CREATE TABLE Song(
  song_ID INT PRIMARY KEY AUTO_INCREMENT,
  song_name VARCHAR(50) NOT NULL,
  album_ID INT NOT NULL,
  FOREIGN KEY (album_ID) REFERENCES Album(album_ID)
) engine = InnoDB;
CREATE TABLE User_Song(
  user_ID INT NOT NULL,
  song_ID INT NOT NULL,
  PRIMARY KEY (user_ID, song_ID),
  FOREIGN KEY (user_ID) REFERENCES User(user_ID),
  FOREIGN KEY (song_ID) REFERENCES Song(song_ID)
) engine = InnoDB;
INSERT INTO Artist (artist_name)
VALUES ('Walter Phoenix'),
  ('Peter Strong'),
  ('Lance Day'),
  ('Freedie Shannon');
INSERT INTO Album (album_name, artist_ID)
VALUES ('Envious', 1),
  ('Exuberant', 1),
  ('Hallowed Steam', 2),
  ('Incandescent', 3),
  ('Temporary Culture', 4);
INSERT INTO Subscription (subscription_name, subscription_price)
VALUES ('gratuito', "0.00"),
  ('familiar', "7.99"),
  ('universitário', "5.99");
INSERT INTO Artist_Album (artist_ID, album_ID)
VALUES (1, 1),
  (1, 2),
  (2, 3),
  (3, 4),
  (4, 5);
INSERT INTO User (user_name, user_age, subscription_ID)
VALUES ('Thati', 23, 1),
  ('Cintia', 35, 2),
  ('Bill', 20, 3),
  ('Roger', 45, 1);
INSERT INTO User_Artist (user_ID, artist_ID)
VALUES (1, 1),
  (1, 3),
  (1, 4),
  (2, 1),
  (2, 3),
  (3, 2),
  (3, 1),
  (4, 4);
INSERT INTO Song (song_name, album_id)
VALUES ('Soul For Us', 1),
  ('Reflections Of Magic', 1),
  ('Dance With Her Own', 1),
  ('Troubles Of My Inner Fire', 2),
  ('Time Fireworks', 2),
  ('Magic Circus', 3),
  ('Honey, So Do I', 3),
  ('Soul For UsSweetie, Let\'s Go Wild', 3),
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
INSERT INTO User_Song (user_ID, song_ID)
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

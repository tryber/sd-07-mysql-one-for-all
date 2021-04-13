SELECT * FROM SpotifyClone.artists;
DROP DATABASE IF exists SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE plans(
  category_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  category_name VARCHAR(20) NOT NULL,
  value DECIMAL(4, 2) NOT NULL
);

INSERT INTO
plans(category_name, `value`)
VALUES
  ("gratuito", 0.00),
  ("universitário", 5.99),
  ("familiar", 7.99);

CREATE TABLE users(
  user_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  user_name VARCHAR(20) NOT NULL,
  age TINYINT NOT NULL,
  category_id INT NOT NULL,
  FOREIGN KEY (category_id) REFERENCES plans(category_id)
);

INSERT INTO
users(user_name, age, category_id)
VALUES
  ("Thati", 23, 1),
  ("Cintia", 35, 3),
  ("Bill", 20, 2),
  ("Roger", 45, 1);

CREATE TABLE artists(
  artist_id INT PRIMARY KEY AUTO_INCREMENT,
  artist_name VARCHAR(60) NOT NULL 
);

INSERT INTO
  artists(artist_name)
VALUES
  ("Walter Phoenix"),
  ("Peter Strong"),
  ("Lance Day"),
  ("Freedle Shannon");

CREATE TABLE albums(
  album_id INT PRIMARY KEY AUTO_INCREMENT,
  album_title VARCHAR(50) NOT NULL,
  artist_id INT NOT NULL,
  FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
);

INSERT INTO
  albums(album_title, artist_id)
VALUES
  ("Envious", 1),
  ("Exuberant", 1),
  ("Hallowed Steam", 2),
  ("Incandescent", 3),
  ("Temporary Culture", 4);

CREATE TABLE songs(
  song_id INT PRIMARY KEY AUTO_INCREMENT,
  song_title VARCHAR(100) NOT NULL,
  album_id INT NOT NULL,
  artist_id INT NOT NULL,
  FOREIGN KEY (album_id) REFERENCES albums(album_id),
  FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
);

INSERT INTO
  songs(song_title, album_id, artist_id)
VALUES
  ("Soul For Us", 1, 1),
  ("Reflections Of Magic", 1, 1),
  ("Dance With Her Own", 1, 1),
  ("Troubles Of My Inner Fire", 2, 1),
  ("Time Fireworks", 2, 1),
  ("Magic Circus", 3, 2),
  ("Honey, So Do I", 3, 2),
  ("Sweetie, Let's Go Wild", 3, 2),
  ("She Knows", 3, 2),
  ("Fantasy For Me", 4, 3),
  ("Celebration Of More", 4, 3),
  ("Rock His Everything", 4, 3),
  ("Home Forever", 4, 3),
  ("Diamond Power", 4, 3),
  ("Honey, Let's Be Silly", 4, 3),
  ("Thang Of Thunder", 5, 4),
  ("Words Of Her Life", 5, 4),
  ("Without My Streets", 5, 4);

CREATE TABLE play_history(
  user_id INT NOT NULL,
  song_id INT NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(user_id),
  FOREIGN KEY (song_id) REFERENCES songs(song_id)
);

INSERT INTO
  play_history(user_id, song_id)
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

CREATE TABLE favorites(
  user_id INT NOT NULL,
  artist_id INT NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(user_id),
  FOREIGN KEY (artist_id) REFERENCES artists(artist_id)
);

INSERT INTO
  favorites(user_id, artist_id)
VALUES
  (1, 1),
  (1, 4),
  (1, 3),
  (2, 1),
  (2, 3),
  (3, 2),
  (3, 1),
  (4, 4);

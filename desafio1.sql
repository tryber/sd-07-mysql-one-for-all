DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE SpotifyClone;
USE SpotifyClone;

CREATE TABLE plan(
plan_id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(100) NOT NULL,
value_plan DOUBLE(6,2) NOT NULL
);

CREATE TABLE users(
user_id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(100) NOT NULL,
age INT NOT NULL,
plan_id INT NOT NULL,
FOREIGN KEY(plan_id) REFERENCES plan(plan_id)
);

CREATE TABLE singers(
singer_id INT PRIMARY KEY AUTO_INCREMENT,
name_singer VARCHAR(100) NOT NULL);

CREATE TABLE album(
album_id INT PRIMARY KEY AUTO_INCREMENT,
name_album VARCHAR(100) NOT NULL,
singer_id INT NOT NULL,
FOREIGN KEY(singer_id) REFERENCES singers(singer_id)
);

CREATE TABLE songs(
song_id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(100) NOT NULL,
album_id INT NOT NULL,
FOREIGN KEY(album_id) REFERENCES album(album_id)
);

CREATE TABLE user_history_songs(
user_id INT NOT NULL,
song_id INT NOT NULL, 
PRIMARY KEY(user_id,song_id),
FOREIGN KEY(user_id) REFERENCES users(user_id), 
FOREIGN KEY(song_id) REFERENCES songs(song_id)
);

CREATE TABLE following_artist (
user_id INT NOT NULL,
singer_id INT NOT NULL,
PRIMARY KEY(user_id,singer_id),
FOREIGN KEY(user_id) REFERENCES users(user_id),
FOREIGN KEY(singer_id) REFERENCES singers(singer_id)
);

INSERT INTO plan(name, value_plan)
VALUES ('familiar', 7.99), ('universitário', 5.99), ('gratuito', 0.0);

INSERT INTO users(name, age, plan_id)
VALUES ('Thati', 23, 3), ('Cintia', 35, 1), ('Bill', 20,2), ('Roger', 45, 3);

INSERT INTO singers(name_singer)
VALUES ('Walter Phoenix'), ('Peter Strong'), ('Lance Day'), ('Freedie Shannon');

INSERT INTO album(name_album, singer_id)
VALUES ('Envious', 1), ('Exuberant', 1), ('Hallowed Steam', 2), ('Incandescent', 3), ('Temporary Culture', 4);

INSERT INTO songs(name, album_id)
VALUES ('Soul For Us', 1), ('Reflections Of Magic', 1), ('Dance With Her Own', 1), ('Troubles Of My Inner Fire', 2), ('Time Fireworks', 2), ('Magic Circus', 3), ('Honey, So Do I', 3), ("Sweetie, Let's Go Wild", 3), ('She Knows', 3), ('Fantasy For Me', 4), ('Celebration Of More', 4), ('Rock His Everything', 4), ('Home Forever', 4), ('Diamond Power', 4), ("Honey, Let's Be Silly", 4), ('Thang Of Thunder', 5), ('Words Of Her Life', 5), ('Without My Streets', 5);

INSERT INTO user_history_songs(user_id, song_id)
VALUES (1,1),(1,6),(1,14),(1,16),(2,13),(2,17),(2,2),(2,15),(3,4),(3,16),(3,6),(4,3),(4,18),(4,11);

INSERT INTO following_artist(user_id, singer_id)
VALUES (1,1),(1,4),(1,3),(2,1),(2,3), (3,2),(3,1), (4,4);

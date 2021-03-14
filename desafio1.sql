DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE singers(
singer_id INTEGER PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(30) NOT NULL
) engine = InnoDB;

-- Referência: https://github.com/tryber/sd-07-mysql-one-for-all/blob/vini-mysql-one-for-all/desafio1.sql
CREATE TABLE albuns(
album_id INTEGER PRIMARY KEY AUTO_INCREMENT,
title VARCHAR(100) NOT NULL,
    singer_id INTEGER NOT NULL,
    FOREIGN KEY (singer_id) REFERENCES singers(singer_id)
) engine = InnoDB;

CREATE TABLE plans(
plan_id INTEGER PRIMARY KEY AUTO_INCREMENT,
account VARCHAR(100) NOT NULL,
    price DECIMAL(6,2) NOT NULL
) engine = InnoDB;

CREATE TABLE songs(
song_id INTEGER PRIMARY KEY AUTO_INCREMENT,
album_id INTEGER,
    singer_id INTEGER,
title VARCHAR(100) NOT NULL,
    FOREIGN KEY(album_id) REFERENCES albuns(album_id),
    FOREIGN KEY(singer_id) REFERENCES singers(singer_id)
) engine = InnoDB;

CREATE TABLE users(
user_id INTEGER PRIMARY KEY AUTO_INCREMENT,
plan_id INTEGER,
name VARCHAR(30) NOT NULL,
    age INTEGER NOT NULL,
    FOREIGN KEY(plan_id) REFERENCES plans(plan_id)
) engine = InnoDB;

-- Referência: https://github.com/tryber/sd-07-mysql-one-for-all/blob/vini-mysql-one-for-all/desafio1.sql
CREATE TABLE users_history(
user_history_id INTEGER NOT NULL,
    song_history_id INTEGER NOT NULL,
    PRIMARY KEY (user_history_id, song_history_id),
    FOREIGN KEY (user_history_id) REFERENCES users(user_id),
    FOREIGN KEY (song_history_id) REFERENCES songs(song_id)
) engine = InnoDB;

CREATE TABLE users_following(
user_following_id INTEGER NOT NULL,
    singer_following_id INTEGER NOT NULL,
    PRIMARY KEY (user_following_id, singer_following_id),
    FOREIGN KEY (user_following_id) REFERENCES users(user_id),
    FOREIGN KEY (singer_following_id) REFERENCES singers(singer_id)
) engine = InnoDB;

INSERT INTO singers (name)
VALUES
    ('Walter Phoenix'),
    ('Peter Strong'),
    ('Lance Day'),
    ('Freedie Shannon');

INSERT INTO albuns (title, singer_id)
VALUES
    ('Envious', 1),
    ('Exuberant', 1),
    ('Hallowed Steam', 2),
    ('Incandescent', 3),
    ('Temporary Culture', 4);

INSERT INTO plans (account, price)
VALUES
    ('Gratuito', 0),
    ('Familiar', 7.99),
    ('Universitário', 5.99);

INSERT INTO songs (album_id, singer_id, title)
VALUES
    (1, 1, 'Soul For Us'), -- 1
    (1, 1, 'Reflections Of Magic'), -- 2
    (1, 1, 'Dance With Her Own'), -- 3
    (2, 1, 'Troubles Of My Inner Fire'), -- 4
    (2, 1, 'Time Fireworks'), -- 5
    (3, 2, 'Magic Circus'), -- 6
    (3, 2, 'Honey, So Do I'), -- 7
    (3, 2, "Sweetie, Let's Go Wild"), -- 8
    (3, 2, 'She Knows'), -- 9
    (4, 3, 'Fantasy For Me'), -- 10
    (4, 3, 'Celebration Of More'), -- 11
    (4, 3, 'Rock His Everything'), -- 12
    (4, 3, 'Home Forever'), -- 13
    (4, 3, 'Diamond Power'), -- 14
    (4, 3, "Honey, Let's Be Silly"), -- 15
    (5, 4, 'Thang Of Thunder'), -- 16
    (5, 4, 'Words Of Her Life'), -- 17
    (5, 4, 'Without My Streets'); -- 18

INSERT INTO users (plan_id, name, age)
VALUES
    (1, 'Thati', 23),
    (2, 'Cintia', 35),
    (3, 'Bill', 20),
    (1, 'Roger', 45);

INSERT INTO users_history (user_history_id, song_history_id)
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

INSERT INTO users_following (user_following_id, singer_following_id)
VALUES
    (1, 1),
    (1, 4),
    (1, 3),
    (2, 1),
    (2, 3),
    (3, 2),
    (3, 1),
    (4, 4);

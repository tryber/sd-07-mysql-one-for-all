DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE plans(
    id_plan INT PRIMARY KEY AUTO_INCREMENT,
    plan_type VARCHAR(10) UNIQUE NOT NULL,
    plan_price DECIMAL(5, 2) NOT NULL
) ENGINE = InnoDB;

CREATE TABLE artists(
    id_artist INT PRIMARY KEY AUTO_INCREMENT,
    artist_name VARCHAR(30) NOT NULL
) ENGINE = InnoDB;

CREATE TABLE albums(
    id_album INT PRIMARY KEY AUTO_INCREMENT,
    album_name VARCHAR(30) NOT NULL,
    id_artist INT NOT NULL,
    FOREIGN KEY (id_artist) REFERENCES artists(id_artist)
) ENGINE = InnoDB;

CREATE TABLE songs(
    id_song INT PRIMARY KEY AUTO_INCREMENT,
    song_name VARCHAR(30) NOT NULL,
    id_album INT NOT NULL,
    FOREIGN KEY (id_album) REFERENCES albums(id_album)
) ENGINE = InnoDB;

CREATE TABLE users(
    id_user INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(15) UNIQUE NOT NULL,
    id_plan INT NOT NULL,
    FOREIGN KEY (id_plan) REFERENCES plans(id_plan)
) ENGINE = InnoDB;

CREATE TABLE historic(
    id_user INT NOT NULL,
    id_song INT NOT NULL,
    FOREIGN KEY (id_user) REFERENCES users(id_user),
    FOREIGN KEY (id_song) REFERENCES songs(id_song),
    PRIMARY KEY (id_user, id_song)
) ENGINE = InnoDB;

CREATE TABLE followers(
    id_user INT NOT NULL,
    id_artist INT NOT NULL,
    FOREIGN KEY (id_user) REFERENCES users(id_user),
    FOREIGN KEY (id_artist) REFERENCES artists(id_artist),
    PRIMARY KEY (id_user, id_artist)
) ENGINE = InnoDB;

INSERT INTO plans(plan_type, plan_price)
VALUES
    ('Free', 0.00),
    ('Individual', 7.99),
    ('Duo', 5.99);

INSERT INTO artists(artist_name)
VALUES
    ('Walter Phoenix'),
    ('Lance Day'),
    ('Peter Strong'),
    ('Freedie Shannon');

INSERT INTO albums(album_name, id_artist)
VALUES 
    ('Envious', 1),
    ('Exuberant', 1),
    ('Hallowed Steam', 3),
    ('Incandescent', 2), 
    ('Temporary Culture', 4);

INSERT INTO songs(song_name, id_album)
VALUES
    ("Soul For Us", 1),
    ("Reflections Of Magic", 1),
    ("Dance With Her Own", 1),
    ("Troubles Of My Inner Fire", 2), 
    ("Time Fireworks", 2),
    ("Magic Circus", 3), 
    ("Honey, So Do I", 3),
    ("Sweetie, Let's Go Wild", 3),
    ("She Knows", 3),
    ("Fantasy For Me", 4),  
    ("Celebration Of More", 4),
    ("Rock His Everything", 4),
    ("Home Forever", 4),
    ("Diamond Power", 4),
    ("Honey, Let's Be Silly", 4),
    ("Thang Of Thunder", 5),
    ("Words Of Her Life", 5),
    ("Without My Streets", 5);

INSERT INTO users(username, id_plan)
VALUES 
    ('Thati', 1),
    ('Cintia', 2),
    ('Bill', 3),
    ('Roger', 1);

INSERT INTO historic
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

INSERT INTO followers
VALUES 
    (1, 1),
    (1, 2),
    (1, 4),
    (2, 1),
    (2, 2),
    (3, 3),
    (3, 1),
    (4, 4);

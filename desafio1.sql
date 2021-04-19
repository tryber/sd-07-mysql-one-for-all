DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE Singers(
  sin_id INT PRIMARY KEY AUTO_INCREMENT,
  sin_name VARCHAR(100) NOT NULL
) engine = InnoDB;

CREATE TABLE Albums(
  abl_id INT PRIMARY KEY AUTO_INCREMENT,
  abl_name VARCHAR(100) NOT NULL,
  sin_id INT NOT NULL,
  FOREIGN KEY (sin_id) REFERENCES Singers(sin_id)
) engine = InnoDB;

CREATE TABLE Songs(
  son_id INT PRIMARY KEY AUTO_INCREMENT,
  son_name VARCHAR(100) NOT NULL,
  abl_id INT NOT NULL,
FOREIGN KEY (abl_id) REFERENCES Albums(abl_id)
) engine = InnoDB;

CREATE TABLE Plans(
  pla_id TINYINT PRIMARY KEY AUTO_INCREMENT,
  pla_name VARCHAR(100) NOT NULL UNIQUE,
  pla_value DECIMAL(6,2) NOT NULL UNIQUE
) engine = InnoDB;

CREATE TABLE Users(
  use_id INT PRIMARY KEY AUTO_INCREMENT,
  use_name VARCHAR(100) NOT NULL,
  use_age TINYINT NOT NULL,
  pla_id TINYINT NOT NULL,
  FOREIGN KEY (pla_id) REFERENCES Plans (pla_id)
) engine = InnoDB;

CREATE TABLE Followings(
  use_id INT NOT NULL,
  sin_id INT NOT NULL,
PRIMARY KEY (use_id, sin_id),
FOREIGN KEY (use_id) REFERENCES Users(use_id),
  FOREIGN KEY (sin_id) REFERENCES Singers(sin_id)
) engine = InnoDB;

CREATE TABLE Historic(
  use_id INT NOT NULL,
  son_id INT NOT NULL,
  PRIMARY KEY (use_id, son_id),
FOREIGN KEY (use_id) REFERENCES Users(use_id),
  FOREIGN KEY (son_id) REFERENCES Songs(son_id)
) engine = InnoDB;

INSERT INTO SpotifyClone.Singers (sin_name)
VALUES
  ('Walter Phoenix'),
  ('Peter Strong'),
  ('Lance Day'),
  ('Freedie Shannon');

INSERT INTO SpotifyClone.Albums (abl_name, sin_id)
VALUES
  ('Envious', 1),
  ('Exuberant', 1),
  ('Hallowed Steam', 2),
  ('Incandescent', 3),
  ('Temporary Culture', 4);

INSERT INTO SpotifyClone.Songs (son_name, abl_id)
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

INSERT INTO SpotifyClone.Plans (pla_name, pla_value)
VALUES
  ('gratuito', 0.00),
  ('familiar', 7.99),
  ('universitário', 5.99);

INSERT INTO SpotifyClone.Users (use_name, use_age, pla_id)
VALUES
  ('Thati', 23, 1),
  ('Cintia', 35, 2),
  ('Bill', 20, 3),
  ('Roger', 45, 1);

INSERT INTO SpotifyClone.Followings (use_id, sin_id)
VALUES
  (1, 1),
  (1, 4),
  (1, 3),
  (2, 1),
  (2, 3),
  (3, 2),
  (3, 1),
  (4, 4);

INSERT INTO SpotifyClone.Historic (use_id, son_id)
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
  
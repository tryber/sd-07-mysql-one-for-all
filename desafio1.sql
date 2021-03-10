DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE IF NOT EXISTS SpotifyClone;

USE SpotifyClone;

CREATE TABLE plans(
	plan varchar(50) PRIMARY KEY NOT NULL,
    value DOUBLE NOT NULL
);

CREATE TABLE users(
	user_id INT PRIMARY KEY auto_increment,
    name VARCHAR(50) NOT NULL,
    age INT NOT NULL,
    plan VARCHAR(50) NOT NULL,
    FOREIGN KEY (plan) REFERENCES plans (plan)
);


CREATE TABLE artists(
	name VARCHAR(100) PRIMARY KEY NOT NULL
);


CREATE TABLE covers(
	cover_id INT PRIMARY KEY NOT NULL auto_increment,
    cover varchar(50) NOT NULL,
    artist varchar(50) NOT NULL,
    FOREIGN KEY (artist) REFERENCES artists(name)
);

CREATE TABLE songs(
    cover_id INT NOT NULL,
	song VARCHAR(50) PRIMARY KEY NOT NULL,
    FOREIGN KEY (cover_id) REFERENCES covers (cover_id)
);

CREATE TABLE history_reproductions(
	user_id INT NOT NULL,
    reproductions varchar(50) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users (user_id),
    FOREIGN KEY (reproductions) REFERENCES songs (song)
);

CREATE TABLE following (
	user_id INT NOT NULL,
    following varchar(50) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (following) REFERENCES artists (name)
);

INSERT INTO plans(plan, value)
VALUES
  ('gratuito', 0),
  ('familiar', 7.99),
  ('universitário', 5.99);

INSERT INTO users(name, age, plan)
VALUES
  ('Thati', 23, 'gratuito'),
  ('Cintia', 35, 'familiar'),
  ('Bill', 20, 'universitário'),
  ('Roger', 45, 'gratuito');
  
INSERT INTO artists(name) 
VALUES
  ('Walter Phoenix'),
  ('Peter Strong'),
  ('Lance Day'),
  ('Freedie Shannon');
  
INSERT INTO covers(cover, artist)
VALUES
  ('Envious', 'Walter Phoenix'),
  ('Exuberant', 'Walter Phoenix'),
  ('Hallowed Steam', 'Peter Strong'),
  ('Incandescent', 'Lance Day'),
  ('Temporary Culture', 'Freedie Shannon');
  
INSERT INTO songs (cover_id, song)
VALUES
  (1, 'Soul For Us'),
  (1, "Reflections Of Magic"),
  (1, "Dance With Her Own"),
  (2, "Troubles Of My Inner Fire"),
  (2, "Time Fireworks"),
  (3, "Magic Circus"),
  (3, "Honey, So Do I"),
  (3, "Sweetie, Let's Go Wild"),
  (3, "She Knows"),
  (4, "Fantasy For Me"),
  (4, "Celebration Of More"),
  (4, "Rock His Everything"),
  (4, "Home Forever"),
  (4, "Diamond Power"),
  (4, "Honey, Let's Be Silly"),
  (5, "Thang Of Thunder"),
  (5, "Words Of Her Life"),
  (5, "Without My Streets");
  
INSERT INTO following (user_id, following)
VALUES
  (1, 'Walter Phoenix'),
  (1, 'Freedie Shannon'),
  (1, 'Lance Day'),
  (2, 'Walter Phoenix'),
  (2, 'Lance Day'),
  (3, 'Peter Strong'),
  (3, 'Walter Phoenix'),
  (4, 'Freedie Shannon');

INSERT INTO history_reproductions(user_id, reproductions)
VALUES
  (1, "Soul For Us"),
  (1, "Magic Circus"),
  (1, "Diamond Power"),
  (1, "Thang Of Thunder"),
  (2, "Home Forever"),
  (2, "Words Of Her Life"),
  (2, "Reflections Of Magic"),
  (2, "Honey, Let's Be Silly"),
  (3, "Troubles Of My Inner Fire"),
  (3, "Thang Of Thunder"),
  (3, "Magic Circus"),
  (4, "Dance With Her Own"),
  (4, "Without My Streets"),
  (4, "Celebration Of More");

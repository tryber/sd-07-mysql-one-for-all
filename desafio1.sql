DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE subscriptions(
    id INT primary key auto_increment,
    plan varchar(30) not null,
    price DECIMAL(5, 2) not null
) engine = InnoDB;

CREATE TABLE user(
    id INT primary key auto_increment,
    name varchar(50) not null,
    age tinyint not null,
    plan_id INT,
    foreign key (plan_id) references subscriptions (id)
) engine = InnoDB;

CREATE TABLE artists(
    id INT primary key auto_increment,
    artist varchar(400) not null
) engine = InnoDB;

CREATE TABLE albums(
    id INT primary key auto_increment,
    name varchar(80) not null,
    artist_id INT,
    foreign key (artist_id) references artists (id)
) engine = InnoDB;

CREATE TABLE songs(
    id INT primary key auto_increment,
    name varchar(80) not null,
    artist_id INT NOT NULL,
    album_id INT NOT NULL,
    foreign key (artist_id) references artists (id),
    foreign key (album_id) references albums (id)
) engine = InnoDB;

CREATE TABLE rep_history(
    user_id INT NOT NULL,
    song_id INT,
    primary key (user_id, song_id),
    foreign key (user_id) references user (id) ON DELETE CASCADE,
    foreign key (song_id) references songs (id) ON DELETE CASCADE
) engine = InnoDB;

CREATE TABLE followed_artists(
    user_id INT NOT NULL,
    artist_id INT,
    primary key (user_id, artist_id),
    foreign key (user_id) references user (id) ON DELETE CASCADE,
    foreign key (artist_id) references artists (id) ON DELETE CASCADE
) engine = InnoDB;

INSERT INTO subscriptions (plan, price)
VALUES
  ('gratuito', 0),
  ('familiar', 7.99),
  ('universitário', 5.99);

INSERT INTO user (name, age, plan_id)
VALUES
  ('Thati', 23, 1),
  ('Cintia', 35, 2),
  ('Bill', 20, 3),
  ('Roger', 45, 1);

INSERT INTO artists (artist)
VALUES
  ('Walter Phoenix'),
  ('Peter Strong'),
  ('Lance Day'),
  ('Freedie Shannon');

INSERT INTO albums (name, artist_id)
VALUES
  ('Envious', 1),
  ('Exuberant', 1),
  ('Hallowed Steam', 2),
  ('Incandescent', 3),
  ('Temporary Culture', 4);

INSERT INTO songs (name, artist_id, album_id)
VALUES
  ('Soul For Us', 1, 1),
  ('Reflections Of Magic', 1, 1),
  ('Dance With Her Own', 1, 1),
  ('Troubles Of My Inner Fire', 1, 2),
  ('Time Fireworks', 1, 2),
  ('Magic Circus', 2, 3),
  ('Honey, So Do I', 2, 3),
  ("Sweetie, Let's go Wild", 2, 3),
  ('She Knows', 2, 3),
  ('Fantasy For Me', 3, 4),
  ('Celebration Of More', 3, 4),
  ('Rock His Everything', 3, 4),
  ('Home Forever', 3, 4),
  ('Diamond Power', 3, 4),
  ("Honey, Let's Be Silly", 3, 4),
  ('Thang Of Thunder', 4, 5),
  ('Words Of Her Life', 4, 5),
  ('Without My Streets', 4, 5);

INSERT INTO rep_history (user_id, song_id)
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

  INSERT INTO followed_artists (user_id, artist_id)
VALUES
  (1, 1),
  (1, 4),
  (1, 3),
  (2, 1),
  (2, 3),
  (3, 2),
  (3, 1),
  (4, 4);

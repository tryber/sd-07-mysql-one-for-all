DROP DATABASE IF EXISTS `SpotifyClone`;
CREATE DATABASE IF NOT EXISTS `SpotifyClone`;
USE `SpotifyClone`;

CREATE TABLE IF NOT EXISTS followers (
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    user_id INT,
    artist_id INT
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `user` (
  user_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  user_name VARCHAR(255) NOT NULL,
  user_age  INT NOT NULL,
  user_plan int
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS artist (
    artist_id INT PRIMARY KEY  AUTO_INCREMENT  NOT NULL,
    artist_name VARCHAR(255)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS plan (
  plan_id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
  plan_name VARCHAR(255),
  plan_price DECIMAL (15,2)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS albums (
    album_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    album_name VARCHAR(255),
    artist_id INT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS musics (
    music_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    music_name VARCHAR(255),
    album_id INT NOT NULL,
    artist_id INT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS historys (
    hitory_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    id_user INT NOT NULL,
    id_music INT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

  INSERT INTO user (
    user_name,
    user_age,
    user_plan
) 
VALUES ('Thati', 23,1), ('Cintia', 35, 2), ('Bill', 20, 3), ('Roger', 45,1);

  INSERT INTO artist (
    artist_name
  ) 
  VALUES ('Walter Phoenix'),('Peter Strong'),('Lance Day'), ('Freedie Shannon'); 

  INSERT INTO plan (
    plan_name,
    plan_price
  ) 
  VALUES ('gratuito',0.00),('familiar', 7.99),('universitário', 5.99);

INSERT INTO historys (
  id_user,
  id_music
)
VALUES
  (1,1),
  (1,6),
  (1,14),
  (1,16),
  (2,13),
  (2,17),
  (2,2),
  (2,15),
  (3,4),
  (3,16),
  (3,6),
  (4,3),
  (4,18),
  (4,11);

  INSERT INTO albums (
    album_name,
    artist_id
  ) 
  VALUES ('Envious',1), ('Exuberant',1), ('Hallowed Steam',2),('Incandescent',3),('Temporary Culture',4);

  INSERT INTO musics (
    music_name ,
    album_id ,
    artist_id
  ) 
  VALUES ('Soul For Us',1,1),('Reflections Of Magic',1,1),('Dance With Her Own',1,1),
  ('Troubles Of My Inner Fire',2,1),('Time Fireworks',2,1),
  ('Magic Circus',3,2),('Honey, So Do I',3,2),("Sweetie, Let's Go Wild",3,2),('She Knows',3,2),
  ('Fantasy For Me',4,3),('Celebration Of More',4,3),('Rock His Everything',4,3),
  ('Home Forever',4,3),('Diamond Power',4,3),("Honey, Let's Be Silly",4,3),
  ('Thang Of Thunder',5,4),('Words Of Her Life',5,4),("Without My Streets",5,4);

  INSERT INTO followers (
    user_id,
    artist_id
  ) 
  VALUES (1,1),(1,4),(1,3),(2,1),(2,3),(3,2),(3,1),(4,4);
  ALTER TABLE `followers` ADD CONSTRAINT `fk_followerUser` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);
  ALTER TABLE `followers` ADD CONSTRAINT `fk_followerArtist` FOREIGN KEY (`user_id`) REFERENCES `artist` (`artist_id`);
  ALTER TABLE `albums` ADD CONSTRAINT `fk_albumsArtist` FOREIGN KEY (`artist_id`) REFERENCES `artist` (`artist_id`);
  ALTER TABLE `historys` ADD CONSTRAINT `fk_historyUser` FOREIGN KEY (`id_user`) REFERENCES `user` (`user_id`);
  --  ALTER TABLE `historys` ADD CONSTRAINT `fk_historyMusic` FOREIGN KEY (`id_music`) REFERENCES `music` (`music_id`);

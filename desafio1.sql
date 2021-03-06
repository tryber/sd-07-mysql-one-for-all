DROP DATABASE IF EXISTS `SpotifyClone` ;
CREATE DATABASE IF NOT EXISTS `SpotifyClone` ;
USE `SpotifyClone` ;
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`plans` (
  `id_plan` INT NOT NULL AUTO_INCREMENT,
  `plan` VARCHAR(45) NOT NULL,
  `price` DECIMAL(5,2) NOT NULL,
  PRIMARY KEY (`id_plan`),
  UNIQUE INDEX `plan_UNIQUE` (`plan` ASC) VISIBLE)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`users` (
  `id_user` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `age` INT NOT NULL,
  `id_plan` INT NOT NULL,
  PRIMARY KEY (`id_user`),
  INDEX `fk_users_plans_idx` (`id_plan` ASC) VISIBLE,
  CONSTRAINT `fk_users_plans`
    FOREIGN KEY (`id_plan`)
    REFERENCES `SpotifyClone`.`plans` (`id_plan`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`artists` (
  `id_artist` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id_artist`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`albums` (
  `id_album` INT NOT NULL AUTO_INCREMENT,
  `album` VARCHAR(100) NOT NULL,
  `id_artist` INT NOT NULL,
  PRIMARY KEY (`id_album`),
  INDEX `fk_album_artists1_idx` (`id_artist` ASC) VISIBLE,
  CONSTRAINT `fk_album_artists1`
    FOREIGN KEY (`id_artist`)
    REFERENCES `SpotifyClone`.`artists` (`id_artist`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`songs` (
  `id_song` INT NOT NULL AUTO_INCREMENT,
  `song` VARCHAR(100) NOT NULL,
  `album_id_album` INT NOT NULL,
  PRIMARY KEY (`id_song`),
  INDEX `fk_songs_album1_idx` (`album_id_album` ASC) VISIBLE,
  CONSTRAINT `fk_songs_album1`
    FOREIGN KEY (`album_id_album`)
    REFERENCES `SpotifyClone`.`albums` (`id_album`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`users_songs` (
  `id_users` INT NOT NULL,
  `id_song` INT NOT NULL,
  PRIMARY KEY (`id_users`, `id_song`),
  INDEX `fk_users_has_songs_songs1_idx` (`id_song` ASC) VISIBLE,
  INDEX `fk_users_has_songs_users1_idx` (`id_users` ASC) VISIBLE,
  CONSTRAINT `fk_users_has_songs_users1`
    FOREIGN KEY (`id_users`)
    REFERENCES `SpotifyClone`.`users` (`id_user`),
  CONSTRAINT `fk_users_has_songs_songs1`
    FOREIGN KEY (`id_song`)
    REFERENCES `SpotifyClone`.`songs` (`id_song`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`users_artists` (
  `id_user` INT NOT NULL,
  `id_artist` INT NOT NULL,
  PRIMARY KEY (`id_user`, `id_artist`),
  INDEX `fk_users_has_artists_artists1_idx` (`id_artist` ASC) VISIBLE,
  INDEX `fk_users_has_artists_users1_idx` (`id_user` ASC) VISIBLE,
  CONSTRAINT `fk_users_has_artists_users1`
    FOREIGN KEY (`id_user`)
    REFERENCES `SpotifyClone`.`users` (`id_user`),
  CONSTRAINT `fk_users_has_artists_artists1`
    FOREIGN KEY (`id_artist`)
    REFERENCES `SpotifyClone`.`artists` (`id_artist`))
ENGINE = InnoDB;

-- Data insertion
INSERT INTO `SpotifyClone`.`plans` (`plan`, `price`) VALUES
    ('gratuito', '0'),
    ('universitário', '5.99'),
    ('familiar', '7.99');

INSERT INTO `SpotifyClone`.`artists` (`name`) VALUES
    ('Freedie Shannon'),
    ('Lance Day'),
    ('Peter Strong'),
    ('Walter Phoenix');
    
INSERT INTO `SpotifyClone`.`albums` (`album`, `id_artist`) VALUES
    ('Envious', '4'),
    ('Exuberant', '4'),
    ('Hallowed Steam', '3'),
    ('Incandescent', '2'),
    ('Temporary Culture', '1');

INSERT INTO `SpotifyClone`.`songs` (`song`, `album_id_album`) VALUES
    ('Soul For Us', '1'),
    ('Reflections Of Magic', '1'),
    ('Dance With Her Own', '1'),
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
    
INSERT INTO `SpotifyClone`.`users` (`name`, `age`, `id_plan`) VALUES
    ('Thati', '23', '1'),
    ('Cintia', '35', '3'),
    ('Bill', '20', '2'),
    ('Roger', '45', '1');
    
INSERT INTO `SpotifyClone`.`users_songs` (`id_users`, `id_song`) VALUES
    ('1', '1'),
    ('1', '6'),
    ('1', '14'),
    ('1', '16'),
    ('2', '13'),
    ('2', '17'),
    ('2', '2'),
    ('2', '15'),   
    ('3', '4'),
    ('3', '16'),
    ('3', '6'),    
    ('4', '3'),
    ('4', '18'),
    ('4', '11');

INSERT INTO `SpotifyClone`.`users_artists` (`id_user`, `id_artist`) VALUES
    ('1', '4'),
    ('1', '2'),
    ('1', '1'),
    ('2', '4'),
    ('2', '2'),
    ('3', '3'),
    ('3', '4'),
    ('4', '1');

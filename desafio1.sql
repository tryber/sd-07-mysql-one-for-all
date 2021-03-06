-- -----------------------------------------------------
-- DATABASE SpotifyClone
-- -----------------------------------------------------
DROP DATABASE IF EXISTS `SpotifyClone` ;

-- -----------------------------------------------------
-- DATABASE SpotifyClone
-- -----------------------------------------------------
CREATE DATABASE IF NOT EXISTS `SpotifyClone` DEFAULT CHARACTER SET utf8 ;
USE `SpotifyClone` ;

-- -----------------------------------------------------
-- Table `SpotifyClone`.`plans`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SpotifyClone`.`plans` ;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`plans` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `price` DOUBLE NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SpotifyClone`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SpotifyClone`.`users` ;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `age` INT NOT NULL,
  `plan_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_users_plans_idx` (`plan_id` ASC) VISIBLE,
  CONSTRAINT `fk_users_plans`
    FOREIGN KEY (`plan_id`)
    REFERENCES `SpotifyClone`.`plans` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SpotifyClone`.`artists`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SpotifyClone`.`artists` ;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`artists` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SpotifyClone`.`albums`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SpotifyClone`.`albums` ;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`albums` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `artist_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_albums_artists_idx` (`artist_id` ASC) VISIBLE,
  CONSTRAINT `fk_albums_artists`
    FOREIGN KEY (`artist_id`)
    REFERENCES `SpotifyClone`.`artists` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SpotifyClone`.`follow`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SpotifyClone`.`follow` ;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`follow` (
  `user_id` INT NOT NULL,
  `artist_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `artist_id`),
  INDEX `fk_folow_artists_idx` (`artist_id` ASC) VISIBLE,
  CONSTRAINT `fk_follow_users`
    FOREIGN KEY (`user_id`)
    REFERENCES `SpotifyClone`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_folow_artists`
    FOREIGN KEY (`artist_id`)
    REFERENCES `SpotifyClone`.`artists` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SpotifyClone`.`songs`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SpotifyClone`.`songs` ;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`songs` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `album_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_songs_albums_idx` (`album_id` ASC) VISIBLE,
  CONSTRAINT `fk_songs_albums`
    FOREIGN KEY (`album_id`)
    REFERENCES `SpotifyClone`.`albums` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SpotifyClone`.`history`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SpotifyClone`.`history` ;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`history` (
  `user_id` INT NOT NULL,
  `song_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `song_id`),
  INDEX `fk_history_songs_idx` (`song_id` ASC) VISIBLE,
  CONSTRAINT `fk_history_users`
    FOREIGN KEY (`user_id`)
    REFERENCES `SpotifyClone`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_history_songs`
    FOREIGN KEY (`song_id`)
    REFERENCES `SpotifyClone`.`songs` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Data for table `SpotifyClone`.`plans`
-- -----------------------------------------------------
START TRANSACTION;
USE `SpotifyClone`;
INSERT INTO `SpotifyClone`.`plans` (`id`, `name`, `price`) VALUES (DEFAULT, 'gratuito', 0);
INSERT INTO `SpotifyClone`.`plans` (`id`, `name`, `price`) VALUES (DEFAULT, 'familiar', 7.99);
INSERT INTO `SpotifyClone`.`plans` (`id`, `name`, `price`) VALUES (DEFAULT, 'universitário', 5.99);

COMMIT;


-- -----------------------------------------------------
-- Data for table `SpotifyClone`.`users`
-- -----------------------------------------------------
START TRANSACTION;
USE `SpotifyClone`;
INSERT INTO `SpotifyClone`.`users` (`id`, `name`, `age`, `plan_id`) VALUES (DEFAULT, 'Thati', 23, 1);
INSERT INTO `SpotifyClone`.`users` (`id`, `name`, `age`, `plan_id`) VALUES (DEFAULT, 'Cintia', 35, 2);
INSERT INTO `SpotifyClone`.`users` (`id`, `name`, `age`, `plan_id`) VALUES (DEFAULT, 'Bill', 20, 3);
INSERT INTO `SpotifyClone`.`users` (`id`, `name`, `age`, `plan_id`) VALUES (DEFAULT, 'Roger', 45, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `SpotifyClone`.`artists`
-- -----------------------------------------------------
START TRANSACTION;
USE `SpotifyClone`;
INSERT INTO `SpotifyClone`.`artists` (`id`, `name`) VALUES (DEFAULT, 'Walter Phoenix');
INSERT INTO `SpotifyClone`.`artists` (`id`, `name`) VALUES (DEFAULT, 'Peter Strong');
INSERT INTO `SpotifyClone`.`artists` (`id`, `name`) VALUES (DEFAULT, 'Lance Day');
INSERT INTO `SpotifyClone`.`artists` (`id`, `name`) VALUES (DEFAULT, 'Freedie Shannon');

COMMIT;


-- -----------------------------------------------------
-- Data for table `SpotifyClone`.`albums`
-- -----------------------------------------------------
START TRANSACTION;
USE `SpotifyClone`;
INSERT INTO `SpotifyClone`.`albums` (`id`, `name`, `artist_id`) VALUES (DEFAULT, 'Envious', 1);
INSERT INTO `SpotifyClone`.`albums` (`id`, `name`, `artist_id`) VALUES (DEFAULT, 'Exuberant', 1);
INSERT INTO `SpotifyClone`.`albums` (`id`, `name`, `artist_id`) VALUES (DEFAULT, 'Hallowed Steam', 2);
INSERT INTO `SpotifyClone`.`albums` (`id`, `name`, `artist_id`) VALUES (DEFAULT, 'Incandescent', 3);
INSERT INTO `SpotifyClone`.`albums` (`id`, `name`, `artist_id`) VALUES (DEFAULT, 'Temporary Culture', 4);

COMMIT;


-- -----------------------------------------------------
-- Data for table `SpotifyClone`.`follow`
-- -----------------------------------------------------
START TRANSACTION;
USE `SpotifyClone`;
INSERT INTO `SpotifyClone`.`follow` (`user_id`, `artist_id`) VALUES (1, 1);
INSERT INTO `SpotifyClone`.`follow` (`user_id`, `artist_id`) VALUES (1, 3);
INSERT INTO `SpotifyClone`.`follow` (`user_id`, `artist_id`) VALUES (1, 4);
INSERT INTO `SpotifyClone`.`follow` (`user_id`, `artist_id`) VALUES (2, 1);
INSERT INTO `SpotifyClone`.`follow` (`user_id`, `artist_id`) VALUES (2, 3);
INSERT INTO `SpotifyClone`.`follow` (`user_id`, `artist_id`) VALUES (3, 1);
INSERT INTO `SpotifyClone`.`follow` (`user_id`, `artist_id`) VALUES (3, 2);
INSERT INTO `SpotifyClone`.`follow` (`user_id`, `artist_id`) VALUES (4, 4);

COMMIT;


-- -----------------------------------------------------
-- Data for table `SpotifyClone`.`songs`
-- -----------------------------------------------------
START TRANSACTION;
USE `SpotifyClone`;
INSERT INTO `SpotifyClone`.`songs` (`id`, `name`, `album_id`) VALUES (DEFAULT, 'Soul For Us', 1);
INSERT INTO `SpotifyClone`.`songs` (`id`, `name`, `album_id`) VALUES (DEFAULT, 'Reflections Of Magic', 1);
INSERT INTO `SpotifyClone`.`songs` (`id`, `name`, `album_id`) VALUES (DEFAULT, 'Dance With Her Own', 1);
INSERT INTO `SpotifyClone`.`songs` (`id`, `name`, `album_id`) VALUES (DEFAULT, 'Troubles Of My Inner Fire', 2);
INSERT INTO `SpotifyClone`.`songs` (`id`, `name`, `album_id`) VALUES (DEFAULT, 'Time Fireworks', 2);
INSERT INTO `SpotifyClone`.`songs` (`id`, `name`, `album_id`) VALUES (DEFAULT, 'Magic Circus', 3);
INSERT INTO `SpotifyClone`.`songs` (`id`, `name`, `album_id`) VALUES (DEFAULT, 'Honey, So Do I', 3);
INSERT INTO `SpotifyClone`.`songs` (`id`, `name`, `album_id`) VALUES (DEFAULT, 'Sweetie, Let\'s Go Wild', 3);
INSERT INTO `SpotifyClone`.`songs` (`id`, `name`, `album_id`) VALUES (DEFAULT, 'She Knows', 3);
INSERT INTO `SpotifyClone`.`songs` (`id`, `name`, `album_id`) VALUES (DEFAULT, 'Fantasy For Me', 4);
INSERT INTO `SpotifyClone`.`songs` (`id`, `name`, `album_id`) VALUES (DEFAULT, 'Celebration Of More', 4);
INSERT INTO `SpotifyClone`.`songs` (`id`, `name`, `album_id`) VALUES (DEFAULT, 'Rock His Everything', 4);
INSERT INTO `SpotifyClone`.`songs` (`id`, `name`, `album_id`) VALUES (DEFAULT, 'Home Forever', 4);
INSERT INTO `SpotifyClone`.`songs` (`id`, `name`, `album_id`) VALUES (DEFAULT, 'Diamond Power', 4);
INSERT INTO `SpotifyClone`.`songs` (`id`, `name`, `album_id`) VALUES (DEFAULT, 'Honey, Let\'s Be Silly', 4);
INSERT INTO `SpotifyClone`.`songs` (`id`, `name`, `album_id`) VALUES (DEFAULT, 'Thang Of Thunder', 5);
INSERT INTO `SpotifyClone`.`songs` (`id`, `name`, `album_id`) VALUES (DEFAULT, 'Words Of Her Life', 5);
INSERT INTO `SpotifyClone`.`songs` (`id`, `name`, `album_id`) VALUES (DEFAULT, 'Without My Streets', 5);

COMMIT;


-- -----------------------------------------------------
-- Data for table `SpotifyClone`.`history`
-- -----------------------------------------------------
START TRANSACTION;
USE `SpotifyClone`;
INSERT INTO `SpotifyClone`.`history` (`user_id`, `song_id`) VALUES (1, 1);
INSERT INTO `SpotifyClone`.`history` (`user_id`, `song_id`) VALUES (1, 6);
INSERT INTO `SpotifyClone`.`history` (`user_id`, `song_id`) VALUES (1, 14);
INSERT INTO `SpotifyClone`.`history` (`user_id`, `song_id`) VALUES (1, 16);
INSERT INTO `SpotifyClone`.`history` (`user_id`, `song_id`) VALUES (2, 13);
INSERT INTO `SpotifyClone`.`history` (`user_id`, `song_id`) VALUES (2, 17);
INSERT INTO `SpotifyClone`.`history` (`user_id`, `song_id`) VALUES (2, 6);
INSERT INTO `SpotifyClone`.`history` (`user_id`, `song_id`) VALUES (2, 15);
INSERT INTO `SpotifyClone`.`history` (`user_id`, `song_id`) VALUES (3, 4);
INSERT INTO `SpotifyClone`.`history` (`user_id`, `song_id`) VALUES (3, 16);
INSERT INTO `SpotifyClone`.`history` (`user_id`, `song_id`) VALUES (3, 6);
INSERT INTO `SpotifyClone`.`history` (`user_id`, `song_id`) VALUES (4, 3);
INSERT INTO `SpotifyClone`.`history` (`user_id`, `song_id`) VALUES (4, 18);
INSERT INTO `SpotifyClone`.`history` (`user_id`, `song_id`) VALUES (4, 11);

COMMIT;

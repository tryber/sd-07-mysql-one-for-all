-- -----------------------------------------------------
-- DATABASE SpotifyClone
-- -----------------------------------------------------
DROP DATABASE IF EXISTS `SpotifyClone` ;

-- -----------------------------------------------------
-- DATABASE SpotifyClone
-- -----------------------------------------------------
CREATE DATABASE IF NOT EXISTS `SpotifyClone`;

USE `SpotifyClone` ;

-- -----------------------------------------------------
-- Table `plans`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `plans` ;

CREATE TABLE IF NOT EXISTS `plans` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `price` DECIMAL(5, 2) NOT NULL)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `users` ;

CREATE TABLE IF NOT EXISTS `users` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `age` INT NOT NULL,
  `plan_id` INT NOT NULL,
  CONSTRAINT `fk_users_plans`
    FOREIGN KEY (`plan_id`)
    REFERENCES `plans` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `artists`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `artists` ;

CREATE TABLE IF NOT EXISTS `artists` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `albums`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `albums` ;

CREATE TABLE IF NOT EXISTS `albums` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `artist_id` INT NOT NULL,
  CONSTRAINT `fk_albums_artists`
    FOREIGN KEY (`artist_id`)
    REFERENCES `artists` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `follow`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `follow` ;

CREATE TABLE IF NOT EXISTS `follow` (
  `user_id` INT NOT NULL,
  `artist_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `artist_id`),
  CONSTRAINT `fk_follow_users`
    FOREIGN KEY (`user_id`)
    REFERENCES `users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_folow_artists`
    FOREIGN KEY (`artist_id`)
    REFERENCES `artists` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `songs`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `songs` ;

CREATE TABLE IF NOT EXISTS `songs` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `album_id` INT NOT NULL,
  CONSTRAINT `fk_songs_albums`
    FOREIGN KEY (`album_id`)
    REFERENCES `albums` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `history`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `history` ;

CREATE TABLE IF NOT EXISTS `history` (
  `user_id` INT NOT NULL,
  `song_id` INT NOT NULL,
  PRIMARY KEY (`user_id`, `song_id`),
  CONSTRAINT `fk_history_users`
    FOREIGN KEY (`user_id`)
    REFERENCES `users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_history_songs`
    FOREIGN KEY (`song_id`)
    REFERENCES `songs` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Data for table `plans`
-- -----------------------------------------------------
INSERT INTO `plans` (`id`, `name`, `price`) VALUES 
(DEFAULT, 'gratuito', 0),
(DEFAULT, 'familiar', 7.99),
(DEFAULT, 'universitário', 5.99);

-- -----------------------------------------------------
-- Data for table `users`
-- -----------------------------------------------------
INSERT INTO `users` (`id`, `name`, `age`, `plan_id`) VALUES 
(DEFAULT, 'Thati', 23, 1),
(DEFAULT, 'Cintia', 35, 2),
(DEFAULT, 'Bill', 20, 3),
(DEFAULT, 'Roger', 45, 1);

-- -----------------------------------------------------
-- Data for table `artists`
-- -----------------------------------------------------
INSERT INTO `artists` (`id`, `name`) VALUES 
(DEFAULT, 'Walter Phoenix'),
(DEFAULT, 'Peter Strong'),
(DEFAULT, 'Lance Day'),
(DEFAULT, 'Freedie Shannon');

-- -----------------------------------------------------
-- Data for table `albums`
-- -----------------------------------------------------
INSERT INTO `albums` (`id`, `name`, `artist_id`) VALUES
(DEFAULT, 'Envious', 1),
(DEFAULT, 'Exuberant', 1),
(DEFAULT, 'Hallowed Steam', 2),
(DEFAULT, 'Incandescent', 3),
(DEFAULT, 'Temporary Culture', 4);

-- -----------------------------------------------------
-- Data for table `follow`
-- -----------------------------------------------------
INSERT INTO `follow` (`user_id`, `artist_id`) VALUES
(1, 1),
(1, 3),
(1, 4),
(2, 1),
(2, 3),
(3, 1),
(3, 2),
(4, 4);

-- -----------------------------------------------------
-- Data for table `songs`
-- -----------------------------------------------------
INSERT INTO `songs` (`id`, `name`, `album_id`) VALUES
(DEFAULT, 'Soul For Us', 1),
(DEFAULT, 'Reflections Of Magic', 1),
(DEFAULT, 'Dance With Her Own', 1),
(DEFAULT, 'Troubles Of My Inner Fire', 2),
(DEFAULT, 'Time Fireworks', 2),
(DEFAULT, 'Magic Circus', 3),
(DEFAULT, 'Honey, So Do I', 3),
(DEFAULT, 'Sweetie, Let\'s Go Wild', 3),
(DEFAULT, 'She Knows', 3),
(DEFAULT, 'Fantasy For Me', 4),
(DEFAULT, 'Celebration Of More', 4),
(DEFAULT, 'Rock His Everything', 4),
(DEFAULT, 'Home Forever', 4),
(DEFAULT, 'Diamond Power', 4),
(DEFAULT, 'Honey, Let\'s Be Silly', 4),
(DEFAULT, 'Thang Of Thunder', 5),
(DEFAULT, 'Words Of Her Life', 5),
(DEFAULT, 'Without My Streets', 5);

-- -----------------------------------------------------
-- Data for table `history`
-- -----------------------------------------------------
INSERT INTO `history` (`user_id`, `song_id`) VALUES 
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

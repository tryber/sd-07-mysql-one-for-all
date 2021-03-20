CREATE database IF NOT EXISTS `SpotifyClone` ;
USE `SpotifyClone`;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`planos` (
  `plano_id` INT NOT NULL,
  `plano` VARCHAR(45) NOT NULL,
  `valor_plano` DECIMAL(5,2) NOT NULL,
  PRIMARY KEY (`plano_id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`users` (
  `usuario_id` INT NOT NULL,
  `usuario` VARCHAR(45) NOT NULL,
  `idade` INT NOT NULL,
  `planos_plano_id` INT NOT NULL,
  PRIMARY KEY (`usuario_id`),
  INDEX `fk_users_planos1_idx` (`planos_plano_id` ASC) VISIBLE,
  CONSTRAINT `fk_users_planos1`
    FOREIGN KEY (`planos_plano_id`)
    REFERENCES `SpotifyClone`.`planos` (`plano_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`albuns` (
  `album_id` INT NOT NULL AUTO_INCREMENT,
  `album` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`album_id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`artistas` (
  `artista_id` INT NOT NULL AUTO_INCREMENT,
  `artista` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`artista_id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`songs` (
  `cancoes_id` INT NOT NULL AUTO_INCREMENT,
  `cancoes` VARCHAR(45) NOT NULL,
  `artistas_artista_id` INT NOT NULL,
  `albuns_album_id` INT NOT NULL,
  PRIMARY KEY (`cancoes_id`),
  INDEX `fk_songs_artistas1_idx` (`artistas_artista_id` ASC) VISIBLE,
  INDEX `fk_songs_albuns1_idx` (`albuns_album_id` ASC) VISIBLE,
  CONSTRAINT `fk_songs_artistas1`
    FOREIGN KEY (`artistas_artista_id`)
    REFERENCES `SpotifyClone`.`artistas` (`artista_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_songs_albuns1`
    FOREIGN KEY (`albuns_album_id`)
    REFERENCES `SpotifyClone`.`albuns` (`album_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`historico` (
  `users_usuario_id` INT NOT NULL,
  `songs_cancoes_id` INT NOT NULL,
  PRIMARY KEY (`users_usuario_id`, `songs_cancoes_id`),
  INDEX `fk_users_has_songs_songs1_idx` (`songs_cancoes_id` ASC) VISIBLE,
  INDEX `fk_users_has_songs_users1_idx` (`users_usuario_id` ASC) VISIBLE,
  CONSTRAINT `fk_users_has_songs_users1`
    FOREIGN KEY (`users_usuario_id`)
    REFERENCES `SpotifyClone`.`users` (`usuario_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_users_has_songs_songs1`
    FOREIGN KEY (`songs_cancoes_id`)
    REFERENCES `SpotifyClone`.`songs` (`cancoes_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `SpotifyClone`.`seguindo` (
  `artistas_artista_id` INT NOT NULL,
  `users_usuario_id` INT NOT NULL,
  PRIMARY KEY (`artistas_artista_id`, `users_usuario_id`),
  INDEX `fk_artistas_has_users_users1_idx` (`users_usuario_id` ASC) VISIBLE,
  INDEX `fk_artistas_has_users_artistas1_idx` (`artistas_artista_id` ASC) VISIBLE,
  CONSTRAINT `fk_artistas_has_users_artistas1`
    FOREIGN KEY (`artistas_artista_id`)
    REFERENCES `SpotifyClone`.`artistas` (`artista_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_artistas_has_users_users1`
    FOREIGN KEY (`users_usuario_id`)
    REFERENCES `SpotifyClone`.`users` (`usuario_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

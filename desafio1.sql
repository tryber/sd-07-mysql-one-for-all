
DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

DROP TABLE IF EXISTS `SpotifyClone`.`planos` ;

​CREATE TABLE IF NOT EXISTS `SpotifyClone`.`planos` (
`plano_id` INT NOT NULL AUTO_INCREMENT,
`plano` VARCHAR(45) NOT NULL,
`valor` DECIMAL(5,2) NOT NULL,
PRIMARY KEY (`plano_id`))
ENGINE = InnoDB;
DROP TABLE IF EXISTS `SpotifyClone`.`usuarios` ;
​
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`usuarios` (
`usuario_id` INT NOT NULL AUTO_INCREMENT,
`usuario` VARCHAR(100) NOT NULL,
`idade` INT NOT NULL,
`plano_id` INT NOT NULL,
PRIMARY KEY (`usuario_id`, `plano_id`),
INDEX `fk_usuarios_planos1_idx` (`plano_id` ASC) VISIBLE,
CONSTRAINT `fk_usuarios_planos1`
FOREIGN KEY (`plano_id`)
REFERENCES `SpotifyClone`.`planos` (`plano_id`)
ON DELETE NO ACTION
ON UPDATE NO ACTION)
ENGINE = InnoDB;
​
​
-- -----------------------------------------------------
-- Table `SpotifyClone`.`artistas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SpotifyClone`.`artistas` ;
​
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`artistas` (
`artista_id` INT NOT NULL AUTO_INCREMENT,
`artista` VARCHAR(45) NOT NULL,
PRIMARY KEY (`artista_id`))
ENGINE = InnoDB;
​
​
-- -----------------------------------------------------
-- Table `SpotifyClone`.`albuns`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SpotifyClone`.`albuns` ;
​
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`albuns` (
`album_id` INT NOT NULL AUTO_INCREMENT,
`album` VARCHAR(45) NOT NULL,
`artista_id` INT NOT NULL,
PRIMARY KEY (`album_id`, `artista_id`),
INDEX `fk_albuns_artistas1_idx` (`artista_id` ASC) VISIBLE,
CONSTRAINT `fk_albuns_artistas1`
FOREIGN KEY (`artista_id`)
REFERENCES `SpotifyClone`.`artistas` (`artista_id`)
ON DELETE NO ACTION
ON UPDATE NO ACTION)
ENGINE = InnoDB;
​
​
-- -----------------------------------------------------
-- Table `SpotifyClone`.`musicas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SpotifyClone`.`musicas` ;
​
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`musicas` (
`musica_id` INT NOT NULL AUTO_INCREMENT,
`musica` VARCHAR(100) NOT NULL,
`album_id` INT NOT NULL,
`artista_id` INT NOT NULL,
PRIMARY KEY (`musica_id`, `album_id`, `artista_id`),
INDEX `fk_musicas_albuns1_idx` (`album_id` ASC, `artista_id` ASC) VISIBLE,
CONSTRAINT `fk_musicas_albuns1`
FOREIGN KEY (`album_id` , `artista_id`)
REFERENCES `SpotifyClone`.`albuns` (`album_id` , `artista_id`)
ON DELETE NO ACTION
ON UPDATE NO ACTION)
ENGINE = InnoDB;
​
​
-- -----------------------------------------------------
-- Table `SpotifyClone`.`historico_reproducoes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SpotifyClone`.`historico_reproducoes` ;
​
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`historico_reproducoes` (
`usuario_id` INT NOT NULL,
`musica_id` INT NOT NULL,
PRIMARY KEY (`usuario_id`, `musica_id`),
INDEX `fk_usuarios_has_musicas_musicas1_idx` (`musica_id` ASC) VISIBLE,
INDEX `fk_usuarios_has_musicas_usuarios_idx` (`usuario_id` ASC) VISIBLE,
CONSTRAINT `fk_usuarios_has_musicas_usuarios`
FOREIGN KEY (`usuario_id`)
REFERENCES `SpotifyClone`.`usuarios` (`usuario_id`)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
CONSTRAINT `fk_usuarios_has_musicas_musicas1`
FOREIGN KEY (`musica_id`)
REFERENCES `SpotifyClone`.`musicas` (`musica_id`)
ON DELETE NO ACTION
ON UPDATE NO ACTION)
ENGINE = InnoDB;
​
​
-- -----------------------------------------------------
-- Table `SpotifyClone`.`seguidores`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SpotifyClone`.`seguidores` ;
​
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`seguidores` (
`usuario_id` INT NOT NULL,
`artista_id` INT NOT NULL,
PRIMARY KEY (`usuario_id`, `artista_id`),
INDEX `fk_usuarios_has_artistas_artistas1_idx` (`artista_id` ASC) VISIBLE,
INDEX `fk_usuarios_has_artistas_usuarios1_idx` (`usuario_id` ASC) VISIBLE,
CONSTRAINT `fk_usuarios_has_artistas_usuarios1`
FOREIGN KEY (`usuario_id`)
REFERENCES `SpotifyClone`.`usuarios` (`usuario_id`)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
CONSTRAINT `fk_usuarios_has_artistas_artistas1`
FOREIGN KEY (`artista_id`)
REFERENCES `SpotifyClone`.`artistas` (`artista_id`)
ON DELETE NO ACTION
ON UPDATE NO ACTION)
ENGINE = InnoDB;
​
​
SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
​
INSERT INTO SpotifyClone.planos (plano, valor) VALUES
('gratuito', 0), ('familiar', 7.99), ('universitário', 5.99);
​
INSERT INTO SpotifyClone.usuarios (usuario, idade, plano_id)
VALUES ('Thati', 23, 1), ('Cintia', 35, 2), ('Bill', 20, 3), ('Roger', 45, 1);
​
INSERT INTO SpotifyClone.artistas (artista)
VALUES ('Walter Phoenix'), ('Peter Strong'), ('Lance Day'), ('Freedie Shannon');
​
INSERT INTO SpotifyClone.seguidores (usuario_id, artista_id)
VALUES (1, 1), (1, 4), (1, 3), (2,1), (2, 3), (3, 2), (3, 1), (4, 4);
​
INSERT INTO SpotifyClone.albuns (album, artista_id)
VALUES ('Envious', 1), ('Exuberant', 1), ('Hallowed Steam', 2), ('Incandescent', 3), ('Temporary Culture', 4);
​
INSERT INTO SpotifyClone.musicas (musica, album_id, artista_id)
VALUES ('Soul For Us', 1, 1), ('Reflections Of Magic', 1, 1), ('Dance With Her Own', 1, 1),
('Troubles Of My Inner Fire', 2, 1), ('Time Fireworks', 2, 1),
('Magic Circus', 3, 2), ('Honey, So Do I', 3, 2), ('Sweetie, Let''s Go Wild', 3, 2), ('She Knows', 3, 2),
('Fantasy For Me', 4, 3), ('Celebration Of More', 4, 3), ('Rock His Everything', 4, 3),
('Home Forever', 4, 3), ('Diamond Power', 4, 3), ('Honey, Let''s Be Silly', 4, 3),
('Thang Of Thunder', 5, 4), ('Words Of Her Life', 5, 4), ('Without My Streets', 5, 4);
​
INSERT INTO SpotifyClone.historico_reproducoes (usuario_id, musica_id)
VALUES (1, 1), (1, 6), (1, 14), (1, 16),
(2, 13), (2, 17), (2, 2), (2, 15),
(3, 4), (3, 16),  (3, 6),
(4, 3), (4,18), (4, 11);

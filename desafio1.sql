-- MySQL Script generated by MySQL Workbench
-- Fri Mar  5 16:03:39 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema SpotifyClone
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema SpotifyClone
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `SpotifyClone` DEFAULT CHARACTER SET utf8 ;
USE `SpotifyClone` ;

-- -----------------------------------------------------
-- Table `SpotifyClone`.`plano`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`plano` (
  `idplano` INT NOT NULL,
  `nome_plano` VARCHAR(45) NULL,
  `valor_plano` DECIMAL(10,2) NULL,
  PRIMARY KEY (`idplano`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SpotifyClone`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`usuarios` (
  `usuario_id` INT NOT NULL,
  `nome_usuario` VARCHAR(45) NULL,
  `idade` INT NULL,
  `idplano` INT NOT NULL,
  PRIMARY KEY (`usuario_id`, `idplano`),
  INDEX `fk_usuarios_reproducoes1_idx` (`idplano` ASC) VISIBLE,
  CONSTRAINT `fk_usuarios_reproducoes1`
    FOREIGN KEY (`idplano`)
    REFERENCES `SpotifyClone`.`plano` (`idplano`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SpotifyClone`.`artistas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`artistas` (
  `artista_id` INT NOT NULL,
  `nome_artista` VARCHAR(45) NULL,
  PRIMARY KEY (`artista_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SpotifyClone`.`albums`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`albums` (
  `id_album` INT NOT NULL,
  `album` VARCHAR(45) NULL,
  `artista_id` INT NOT NULL,
  PRIMARY KEY (`id_album`, `artista_id`),
  INDEX `fk_albums_artistas1_idx` (`artista_id` ASC) VISIBLE,
  CONSTRAINT `fk_albums_artistas1`
    FOREIGN KEY (`artista_id`)
    REFERENCES `SpotifyClone`.`artistas` (`artista_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SpotifyClone`.`musicas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`musicas` (
  `musica_id` INT NOT NULL,
  `nome_musica` VARCHAR(45) NULL,
  `id_album` INT NOT NULL,
  PRIMARY KEY (`musica_id`, `id_album`),
  INDEX `fk_musicas_albums1_idx` (`id_album` ASC) VISIBLE,
  CONSTRAINT `fk_musicas_albums1`
    FOREIGN KEY (`id_album`)
    REFERENCES `SpotifyClone`.`albums` (`id_album`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SpotifyClone`.`historico_reproducoes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`historico_reproducoes` (
  `usuarios_usuario_id` INT NOT NULL,
  `musicas_musica_id` INT NOT NULL,
  PRIMARY KEY (`usuarios_usuario_id`, `musicas_musica_id`),
  INDEX `fk_usuarios_has_musicas_musicas1_idx` (`musicas_musica_id` ASC) VISIBLE,
  INDEX `fk_usuarios_has_musicas_usuarios1_idx` (`usuarios_usuario_id` ASC) VISIBLE,
  CONSTRAINT `fk_usuarios_has_musicas_usuarios1`
    FOREIGN KEY (`usuarios_usuario_id`)
    REFERENCES `SpotifyClone`.`usuarios` (`usuario_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuarios_has_musicas_musicas1`
    FOREIGN KEY (`musicas_musica_id`)
    REFERENCES `SpotifyClone`.`musicas` (`musica_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `SpotifyClone`.`seguindo_artistas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `SpotifyClone`.`seguindo_artistas` (
  `usuarios_usuario_id` INT NOT NULL,
  `artistas_artista_id` INT NOT NULL,
  PRIMARY KEY (`usuarios_usuario_id`, `artistas_artista_id`),
  INDEX `fk_usuarios_has_artistas_artistas1_idx` (`artistas_artista_id` ASC) VISIBLE,
  INDEX `fk_usuarios_has_artistas_usuarios1_idx` (`usuarios_usuario_id` ASC) VISIBLE,
  CONSTRAINT `fk_usuarios_has_artistas_usuarios1`
    FOREIGN KEY (`usuarios_usuario_id`)
    REFERENCES `SpotifyClone`.`usuarios` (`usuario_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_usuarios_has_artistas_artistas1`
    FOREIGN KEY (`artistas_artista_id`)
    REFERENCES `SpotifyClone`.`artistas` (`artista_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

use SpotifyClone;
insert into 
plano (idplano, nome_plano, valor_plano)
values 
  (1, 'gratuito', 0),
  (2, 'familiar', 7.99),
  (3, 'universitário', 5.99);

insert into 
usuarios (usuario_id, nome_usuario, idade, idplano) 
values 
  (1, 'Thati',23,1),
  (2, 'Cintia',35,2),
  (3, 'Bill',20,3),
  (4, 'Roger',45,1);

insert into 
artistas (artista_id, nome_artista)
values 
  (1, 'Walter Phoenix'),
  (2, 'Peter Strong'),
  (3, 'Lance Day'),
  (4, 'Freedie Shannon');

insert into 
albums (id_album, album, artista_id)
values
  (1,'Envious',1),
  (2,'Exuberant',1),
  (3,'Hallowed Steam',2),
  (4,'Incandescent',3),
  (5,'Temporary Culture',4);
  
insert into 
musicas (musica_id,nome_musica,id_album)
values
  (1, "Soul For Us", 1),
  (2, "Reflections Of Magic", 1),
  (3,"Dance With Her Own",1),
  (4,"Troubles Of My Inner Fire", 2),
  (5,"Time Fireworks",2),
  (6,"Magic Circus",3),
  (7,"Honey, So Do I",3),
  (8,"Sweetie, Let's Go Wild",3), 
  (9,"She Knows",3),
  (10,"Fantasy For Me",4),
  (11,"Celebration Of More",4),
  (12,"Rock His Everything",4),
  (13,"Home Forever",4),
  (14,"Diamond Power",4),
  (15,"Honey, Let's Be Silly",4),
  (16,"Thang Of Thunder",5),
  (17,"Words Of Her Life",5),
  (18,"Without My Streets",5);

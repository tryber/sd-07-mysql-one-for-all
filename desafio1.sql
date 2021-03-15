DROP DATABASE IF EXISTS `SpotifyClone`;

CREATE DATABASE `SpotifyClone`;

USE `SpotifyClone`;

CREATE TABLE `SpotifyClone`.`planos`(
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `plano` VARCHAR(45) NOT NULL,
  `valor` DECIMAL(5,2) NOT NULL,
  PRIMARY KEY (`id`)
) engine = InnoDB;

INSERT INTO `SpotifyClone`.`planos` (`plano`, `valor`)
VALUES
  ('gratuito', 0),
  ('familiar', 7.99),
  ('universitário', 5.99);

CREATE TABLE `SpotifyClone`.`artista`(
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `artista` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`)
) engine = InnoDB;

INSERT INTO `SpotifyClone`.`artista` (`artista`)
VALUES
  ('Walter Phoenix'),
  ('Peter Strong'),
  ('Lance Day'),
  ('Freedie Shannon');
  
create table `SpotifyClone`.`usuario`(
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `usuario` VARCHAR(45) NOT NULL,
  `idade` INT NOT NULL,
  `plano_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`plano_id`) REFERENCES `SpotifyClone`.`planos`(`id`)
) engine = InnoDB;

INSERT INTO `SpotifyClone`.`usuario` (`usuario`, `idade`, `plano_id`)
VALUES ('Thati', '23', '1'), ('Cintia', '35', '2'), ('Bill', '20', '3'), ('Roger', '45', '1');

create table `SpotifyClone`.`album`(
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `album` VARCHAR(45) NOT NULL,
  `artista_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`artista_id`) REFERENCES `SpotifyClone`.`artista`(`id`)
);

INSERT INTO `SpotifyClone`.`album` (`album`, `artista_id`)
VALUES
  ('Envious',1),
  ('Exuberant',1),
  ('Hallowed Steam',2),
  ('Incandescent',3),
  ('Temporary Culture',4);

create table `SpotifyClone`.`cancoes`(
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `cancoes` VARCHAR(45) NOT NULL,
  `album_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`album_id`) REFERENCES `SpotifyClone`.`album`(`id`)
);

INSERT INTO `SpotifyClone`.`cancoes`(`cancoes`, `album_id`)
VALUES
  ("Soul For Us",1),
  ("Reflections Of Magic",1),
  ("Dance With Her Own",1),
  ("Troubles Of My Inner Fire",2),
  ("Time Fireworks",2),
  ("Magic Circus",3),
  ("Honey, So Do I",3),
  ("Sweetie, Let's Go Wild",3),
  ("She Knows",3),
  ("Fantasy For Me",4),
  ("Celebration Of More",4),
  ("Rock His Everything",4),
  ("Home Forever",4),
  ("Diamond Power",4),
  ("Honey, Let's Be Silly",4),
  ("Thang Of Thunder",5),
  ("Words Of Her Life",5),
  ("Without My Streets",5);

create table `SpotifyClone`.`historico`(
  `cancoes_id` INT UNSIGNED NOT NULL,
  `usuario_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`cancoes_id`, `usuario_id`),
  FOREIGN KEY (`cancoes_id`) REFERENCES `SpotifyClone`.`cancoes`(`id`),
  FOREIGN KEY (`usuario_id`) REFERENCES `SpotifyClone`.`usuario`(`id`)
);

INSERT INTO `SpotifyClone`.`historico`(`cancoes_id`, `usuario_id`)
VALUES
  (1,1),
  (6,1),
  (14,1),
  (16,1),
  (13,2),
  (17,2),
  (2,2),
  (15,2),
  (4,3),
  (16,3),
  (6,3),
  (3,4),
  (18,4),
  (11,4);

create table `SpotifyClone`.`seguindo`(
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `usuario_id` INT UNSIGNED NOT NULL,
  `artista_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`artista_id`) REFERENCES `SpotifyClone`.`artista`(`id`),
  FOREIGN KEY (`usuario_id`) REFERENCES `SpotifyClone`.`usuario`(`id`)
);

INSERT INTO `SpotifyClone`.`seguindo`(`usuario_id`, `artista_id`)
VALUES
  (1,1),
  (1,4),
  (1,3),
  (2,1),
  (2,3),
  (3,2),
  (3,1),
  (4,4);

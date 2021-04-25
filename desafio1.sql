DROP database if exists SpotifyClone;

CREATE database SpotifyClone;

CREATE SCHEMA IF NOT EXISTS SpotifyClone;

USE SpotifyClone;

CREATE TABLE IF NOT EXISTS plano (
  `plano_id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `plano_nome` VARCHAR(45) NOT NULL,
  `valor_plano` DECIMAL(5, 2) NOT NULL
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS usuario (
  `usuario_id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `usuario_nome` VARCHAR(45) NOT NULL,
  `idade` INT NOT NULL,
  `plano_id` INT NOT NULL,
  FOREIGN KEY (`plano_id`) REFERENCES plano (`plano_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS artista (
  `artista_id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `artista_nome` VARCHAR(45) NOT NULL
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS album (
  `album_id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `album_nome` VARCHAR(45) NOT NULL,
  `artista_id` INT NOT NULL,
  FOREIGN KEY (`artista_id`) REFERENCES artista (`artista_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS musica (
  `musica_id` INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `musica_nome` VARCHAR(45) NOT NULL,
  `artista_id` INT NOT NULL,
  `album_id` INT NOT NULL,
  FOREIGN KEY (`artista_id`) REFERENCES artista (`artista_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  FOREIGN KEY (`album_id`) REFERENCES album (`album_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS historico (
  `usuario_id` INT NOT NULL,
  `musica_id` INT NOT NULL,
  PRIMARY KEY (usuario_id, musica_id),
  FOREIGN KEY (`usuario_id`) REFERENCES usuario (`usuario_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  FOREIGN KEY (`musica_id`) REFERENCES musica (`musica_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS seguindo (
  `usuario_id` INT NOT NULL,
  `artista_id` INT NOT NULL,
  PRIMARY KEY (usuario_id, artista_id),
  FOREIGN KEY (`usuario_id`) REFERENCES usuario (`usuario_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  FOREIGN KEY (`artista_id`) REFERENCES artista (`artista_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE = InnoDB;


INSERT INTO plano (`plano_id`, `plano_nome`, `valor_plano`)
VALUES (DEFAULT, 'gratuito', 0),
  (DEFAULT, 'familiar', 7.99),
  (DEFAULT, 'universitário', 5.99);

INSERT INTO usuario (
    `usuario_id`,
    `usuario_nome`,
    `idade`,
    `plano_id`
  )
VALUES (DEFAULT, 'Thati', 23, 1),
  (DEFAULT, 'Cintia', 35, 2),
  (DEFAULT, 'Bill', 20, 3),
  (DEFAULT, 'Roger', 45, 1);

INSERT INTO artista (`artista_id`, `artista_nome`)
VALUES (DEFAULT, 'Walter Phoenix'),
  (DEFAULT, 'Peter Strong'),
  (DEFAULT, 'Lance Day'),
  (DEFAULT, 'Freedie Shannon');

INSERT INTO album (`album_id`, `album_nome`, `artista_id`)
VALUES (DEFAULT, 'Envious', 1),
  (DEFAULT, 'Exuberant', 1),
  (DEFAULT, 'Hallowed Steam', 2),
  (DEFAULT, 'Incandescent', 3),
  (DEFAULT, 'Temporary Culture', 4);

INSERT INTO musica (
    `musica_id`,
    `musica_nome`,
    `artista_id`,
    `album_id`
  )
VALUES (DEFAULT, "Soul For Us", 1, 1),
  (DEFAULT, "Reflections Of Magic", 1, 1),
  (DEFAULT, "Dance With Her Own", 1, 1),
  (DEFAULT, "Troubles Of My Inner Fire", 1, 2),
  (DEFAULT, "Time Fireworks", 1, 2),
  (DEFAULT, "Magic Circus", 2, 3),
  (DEFAULT, "Honey, So Do I", 2, 3),
  (DEFAULT, "Sweetie, Let's Go Wild", 2, 3),
  (DEFAULT, "She Knows", 2, 3),
  (DEFAULT, "Fantasy For Me", 3, 4),
  (DEFAULT, "Celebration Of More", 3, 4),
  (DEFAULT, "Rock His Everything", 3, 4),
  (DEFAULT, "Home Forever", 3, 4),
  (DEFAULT, "Diamond Power", 3, 4),
  (DEFAULT, "Honey, Let's Be Silly", 3, 4),
  (DEFAULT, "Thang Of Thunder", 4, 5),
  (DEFAULT, "Words Of Her Life", 4, 5),
  (DEFAULT, "Without My Streets", 4, 5);

INSERT INTO historico (`usuario_id`, `musica_id`)
VALUES (1, 1),
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

INSERT INTO seguindo (`usuario_id`, `artista_id`)
VALUES (1, 1),
  (1, 4),
  (1, 3),
  (2, 1),
  (2, 3),
  (3, 2),
  (3, 1),
  (4, 4);

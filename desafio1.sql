DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE `tabela_planos` (
  `id_plano` int NOT NULL AUTO_INCREMENT,
  `plano` varchar(45) NOT NULL,
  `preco` decimal(5,2) NOT NULL,
  PRIMARY KEY (`id_plano`),
  UNIQUE KEY `plano_UNIQUE` (`plano`),
  UNIQUE KEY `preco_UNIQUE` (`preco`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tabela_artistas` (
  `id_artista` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`id_artista`),
  UNIQUE KEY `nome_UNIQUE` (`nome`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tabela_albuns` (
  `id_album` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `id_artista` int NOT NULL,
  PRIMARY KEY (`id_album`),
  KEY `fk_tabela_albuns_tabela_artistas1_idx` (`id_artista`),
  CONSTRAINT `fk_tabela_albuns_tabela_artistas1` FOREIGN KEY (`id_artista`) REFERENCES `tabela_artistas` (`id_artista`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tabela_cancoes` (
  `id_cancao` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `id_album` int NOT NULL,
  `id_artista` int NOT NULL,
  PRIMARY KEY (`id_cancao`),
  KEY `fk_tabela_cancoes_tabela_albuns_idx` (`id_album`),
  KEY `fk_tabela_albuns_tabela_artistas1_idx` (`id_artista`),
  CONSTRAINT `fk_tabela_cancoes_tabela_albuns` FOREIGN KEY (`id_album`) REFERENCES `tabela_albuns` (`id_album`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tabela_cancoes_tabela_artistas1` FOREIGN KEY (`id_artista`) REFERENCES `tabela_artistas` (`id_artista`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tabela_usuario` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  `idade` int NOT NULL,
  `id_plano` int NOT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `usuario_UNIQUE` (`nome`),
  KEY `fk_tabela_usuario_tabela_planos1_idx` (`id_plano`),
  CONSTRAINT `fk_tabela_usuario_tabela_planos1` FOREIGN KEY (`id_plano`) REFERENCES `tabela_planos` (`id_plano`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tabela_seguindo_artistas` (
  `id_usuario` int NOT NULL,
  `id_artista` int NOT NULL,
  PRIMARY KEY (`id_usuario`,`id_artista`),
  KEY `fk_tabela_usuario_has_tabela_artistas_tabela_artistas1_idx` (`id_artista`),
  KEY `fk_tabela_usuario_has_tabela_artistas_tabela_usuario1_idx` (`id_usuario`),
  CONSTRAINT `fk_tabela_usuario_has_tabela_artistas_tabela_artistas1` FOREIGN KEY (`id_artista`) REFERENCES `tabela_artistas` (`id_artista`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tabela_usuario_has_tabela_artistas_tabela_usuario1` FOREIGN KEY (`id_usuario`) REFERENCES `tabela_usuario` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tabela_historico_reproducao` (
  `id_usuario` int NOT NULL,
  `id_cancao` int NOT NULL,
  PRIMARY KEY (`id_usuario`,`id_cancao`),
  KEY `fk_tabela_usuario_has_tabela_cancoes_tabela_cancoes1_idx` (`id_cancao`),
  KEY `fk_tabela_usuario_has_tabela_cancoes_tabela_usuario1_idx` (`id_usuario`),
  CONSTRAINT `fk_tabela_usuario_has_tabela_cancoes_tabela_cancoes1` FOREIGN KEY (`id_cancao`) REFERENCES `tabela_cancoes` (`id_cancao`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_tabela_usuario_has_tabela_cancoes_tabela_usuario1` FOREIGN KEY (`id_usuario`) REFERENCES `tabela_usuario` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO tabela_planos (plano, preco)
VALUES
  ('gratuito', 0),
  ('universitário', 5.99),
  ('familiar', 7.99);
  
INSERT INTO tabela_artistas (nome)
VALUES
  ("Walter Phoenix"),
  ("Peter Strong"),
  ("Lance Day"),
  ("Freedie Shannon");
  
INSERT INTO tabela_albuns (nome, id_artista)
VALUES
  ("Envious", 1),
  ("Exuberant", 1),
  ("Hallowed Steam", 2),
  ("Incandescent", 3),
  ("Temporary Culture", 4);
  
INSERT INTO tabela_cancoes (nome, id_album, id_artista)
VALUES
  ("Soul For Us", 1, 1),
  ("Reflections Of Magic", 1, 1),
  ("Dance With Her Own", 1, 1),
  ("Troubles Of My Inner Fire", 2, 1),
  ("Time Fireworks", 2, 1),
  ("Magic Circus", 3, 2),
  ("Honey, So Do I", 3, 2),
  ("Sweetie, Let's Go Wild", 3, 2),
  ("She Knows", 3, 2),
  ("Fantasy For Me", 4, 3),
  ("Celebration Of More", 4, 3),
  ("Rock His Everything", 4, 3),
  ("Home Forever", 4, 3),
  ("Diamond Power", 4, 3),
  ("Honey, Let's Be Silly", 4, 3),
  ("Thang Of Thunder", 5, 4),
  ("Words Of Her Life", 5, 4),
  ("Without My Streets", 5, 4);

INSERT INTO tabela_usuario (nome, idade, id_plano)
VALUES
  ("Thati", 23, 1),
  ("Cintia", 35, 3),
  ("Bill", 20, 2),
  ("Roger", 45, 1);
  
INSERT INTO tabela_seguindo_artistas (id_usuario, id_artista)
VALUES
  (1, 1),
  (1, 4),
  (1, 3),
  (2, 1),
  (2, 3),  
  (3, 2),
  (3, 1),  
  (4, 4);

INSERT INTO tabela_historico_reproducao (id_usuario, id_cancao)
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

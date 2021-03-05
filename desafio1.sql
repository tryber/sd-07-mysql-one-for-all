DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

-- Tabela Artistas
CREATE TABLE singers(
  singer_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL
) engine = InnoDB;

-- Tabela Albuns
CREATE TABLE albuns(
  album_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  singer_id INT NOT NULL,
  FOREIGN KEY (singer_id) REFERENCES singers (singer_id)
) engine = InnoDB;

-- Tabela Canções
CREATE TABLE songs(
  song_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(100) NOT NULL,
  album_id INT NOT NULL,
  FOREIGN KEY (album_id) REFERENCES albuns (album_id)
) engine = InnoDB;

-- Tabela Planos
CREATE TABLE IF NOT EXISTS subscriptions(
  subscription_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  price DECIMAL(3, 2) NOT NULL
) engine = InnoDB;

-- Tabela Usuários
CREATE TABLE users(
  user_id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(50) NOT NULL,
  age INT NOT NULL,
  subscription_id INT NOT NULL,
  FOREIGN KEY (subscription_id) REFERENCES subscriptions (subscription_id)
) engine = InnoDB;

-- Tabela Histórico
CREATE TABLE history(
  user_id INT NOT NULL,
  song_id INT NOT NULL,
  PRIMARY KEY (user_id, song_id),
  FOREIGN KEY (user_id) REFERENCES users (user_id),
  FOREIGN KEY (song_id) REFERENCES songs (song_id)
) engine = InnoDB;

-- Tabela Seguindo Artistas
CREATE TABLE following(
  user_id INT NOT NULL,
  singer_id INT NOT NULL,
  PRIMARY KEY (user_id, singer_id),
  FOREIGN KEY (user_id) REFERENCES users (user_id),
  FOREIGN KEY (singer_id) REFERENCES singers (singer_id)
) engine = InnoDB;

-- Valores Tabela Artistas
INSERT INTO singers (singer_id, name)
VALUES
  (1, 'Walter Phoenix'),
  (2, 'Peter Strong'),
  (3, 'Lance Day'),
  (4, 'Freedie Shannon');

-- Valores Tabela Albuns
INSERT INTO albuns (album_id, name, singer_id)
VALUES
  (1, 'Envious', 1),
  (2,	'Exuberant', 1),
  (3,	'Hallowed Steam', 2),
  (4,	'Incandescent', 3),
  (5,	'Temporary Culture', 4);

-- Valores Tabela Albuns
INSERT INTO songs (song_id, name, album_id)
VALUES
  (1, 'Soul For Us', 1),
  (2, 'Reflections Of Magic', 1),
  (3, 'Dance With Her Own', 1),
  (4, 'Troubles Of My Inner Fire', 2),
  (5, 'Time Fireworks', 2),
  (6, 'Magic Circus', 3),
  (7, 'Honey, So Do I', 3),
  (8, 'Sweetie, Let\'s Go Wild', 3),
  (9, 'She Knows', 3),
  (10, 'Fantasy For Me', 4),
  (11, 'Celebration Of More', 4),
  (12, 'Rock His Everything', 4),
  (13, 'Home Forever', 4),
  (14, 'Diamond Power', 4),
  (15, 'Honey, Let\'s Be Silly', 4),
  (16, 'Thang Of Thunder', 5),
  (17, 'Words Of Her Life', 5),
  (18, 'Without My Streets', 5);

-- Valores Tabela Planos
INSERT INTO subscriptions (subscription_id, name, price)
VALUES
  (1, 'gratuito', 0),
  (2, 'familiar', 7.99),
  (3, 'universitário', 5.99);

-- Valores Tabela Usuários
INSERT INTO users (user_id, name, age, subscription_id)
VALUES
  (1, 'Thati', 23, 1),
  (2, 'Cintia', 35, 2),
  (3,'Bill', 20, 3),
  (4, 'Roger',45, 1);

-- Valores Tabela Histórico
INSERT INTO history (user_id, song_id)
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

-- Valores Tabela Seguindo Artistas
-- Valores Tabela Histórico
INSERT INTO following (user_id, singer_id)
VALUES
  (1, 1),
  (1, 3),
  (1, 4),
  (2, 1),
  (2, 3),
  (3, 1),
  (3, 2),
  (4, 4);
  
  
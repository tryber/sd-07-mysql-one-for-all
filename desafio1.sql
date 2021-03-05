DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE artistas (
artista_id INT PRIMARY KEY auto_increment,
artista VARCHAR(100) NOT NULL
) ENGINE = InnoDB;

INSERT INTO artistas (artista)
VALUES
('Walter Phoenix'),
('Peter Strong'),
('Lance Day'),
('Freedie Shannon');

CREATE TABLE planos (
plano_id INT PRIMARY KEY auto_increment,
plano VARCHAR(100) NOT NULL,
valor_plano FLOAT NOT NULL
) ENGINE = InnoDB;

INSERT INTO planos (plano, valor_plano)
VALUES
('gratuito', 0),
('familiar', 7.99),
('universitarop', 5.99);

CREATE TABLE usuarios (
usuario_id INT PRIMARY KEY auto_increment,
usuario VARCHAR(100) NOT NULL,
idade INT NOT NULL,
plano_id INT NOT NULL,
FOREIGN KEY (plano_id) REFERENCES planos(plano_id)
) ENGINE = InnoDB;

INSERT INTO usuarios (usuario, idade, plano_id)
VALUES
('Thati', 23, 1),
('Cintia', 35, 2),
('Bill', 20, 3),
('Roger', 45, 1);


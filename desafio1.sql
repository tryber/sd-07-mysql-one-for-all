DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE planos(
id INT PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR(50) NOT NULL,
    valor DECIMAL(5,2) NOT NULL
) engine = InnoDB;

CREATE TABLE usuarios(
id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    idade INT NOT NULL,
    plano_id INT,
    FOREIGN KEY (plano_id) REFERENCES planos (id)
) engine = InnoDB;

CREATE TABLE artistas(
id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL
) engine = InnoDB;

CREATE TABLE albuns(
id INT PRIMARY KEY AUTO_INCREMENT,
    album VARCHAR(50) NOT NULL,
    artista_id INT,
    FOREIGN KEY (artista_id) REFERENCES artistas (id)
) engine = InnoDB;

CREATE TABLE usuario_segue_artista(
id INT PRIMARY KEY AUTO_INCREMENT,
    usuario_id INT NOT NULL,
    artista_id INT,
    FOREIGN KEY (usuario_id) REFERENCES usuarios (id),
    FOREIGN KEY (artista_id) REFERENCES artistas (id)
) engine = InnoDB;

CREATE TABLE cancoes(
id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    artista_id INT,
    album_id INT,
    FOREIGN KEY (artista_id) REFERENCES artistas (id),
    FOREIGN KEY (album_id) REFERENCES albuns (id)
) engine = InnoDB;

CREATE TABLE usuario_ouve_cancao(
id INT PRIMARY KEY AUTO_INCREMENT,
    usuario_id INT NOT NULL,
    cancao_id INT,
    FOREIGN KEY (usuario_id) REFERENCES usuarios (id),
    FOREIGN KEY (cancao_id) REFERENCES cancoes (id)
) engine = InnoDB;

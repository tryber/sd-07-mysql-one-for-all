DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

CREATE TABLE plano(
	plano_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    plano VARCHAR(100) NOT NULL,
    valor_plano INT NOT NULL
) ENGINE=InnoDB;

CREATE TABLE usuario(
	usuario_id INT PRIMARY KEY NOT NULL,
    usuario VARCHAR(100) NOT NULL,
    idade INT NOT NULL,
    plano_id INT NOT NULL,
    FOREIGN KEY (plano_id) REFERENCES plano(plano_id)
) ENGINE=InnoDB;

CREATE TABLE artista(
	artista_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    artista VARCHAR(100) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE album(
	album_id INT PRIMARY KEY NOT NULL,
    album VARCHAR(100) NOT NULL,
    artista_id INT NOT NULL,
    FOREIGN KEY (artista_id) REFERENCES artista(artista_id)
) ENGINE=InnoDB;

CREATE TABLE cancao(
	cancao_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    cancao VARCHAR(100) NOT NULL,
    album_id INT NOT NULL,
    FOREIGN KEY (album_id) REFERENCES album(album_id)
) ENGINE=InnoDB;

CREATE TABLE seguidores(
	seguidores_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    artista_id INT NOT NULL,
    usuario_id INT NOT NULL,
    FOREIGN KEY (artista_id) REFERENCES artista(artista_id),
    FOREIGN KEY (usuario_id) REFERENCES usuario(usuario_id)
) ENGINE=InnoDB;

CREATE TABLE historico_reproducoes(
	historico_reproducoes_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    usuario_id INT NOT NULL,
    cancao_id INT NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES usuario(usuario_id),
    FOREIGN KEY (cancao_id) REFERENCES cancao(cancao_id)
) ENGINE=InnoDB;
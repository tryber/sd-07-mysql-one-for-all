SET FOREIGN_KEY_CHECKS=0;
DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE SpotifyClone;

USE SpotifyClone;

DROP TABLE IF EXISTS Plano;
CREATE TABLE IF NOT EXISTS Plano (
    id INT PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR(50),
    valor DECIMAL(5 , 2 )
)  ENGINE=INNODB;

DROP TABLE IF EXISTS Artista;
CREATE TABLE IF NOT EXISTS Artista (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
)  ENGINE=INNODB;

DROP TABLE IF EXISTS Album;
CREATE TABLE IF NOT EXISTS Album (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    artista_id INT NOT NULL,
    FOREIGN KEY (artista_id)
        REFERENCES Artista (id)
)  ENGINE=INNODB;

DROP TABLE IF EXISTS Usuario;
CREATE TABLE IF NOT EXISTS Usuario (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    idade INT NOT NULL,
    plano_id INT NOT NULL,
    FOREIGN KEY (plano_id)
        REFERENCES Plano (id)
)  ENGINE=INNODB;

DROP TABLE IF EXISTS Seguindo;
CREATE TABLE IF NOT EXISTS Seguindo (
    usuario_id INT NOT NULL,
    artista_id INT NOT NULL,
    PRIMARY KEY (usuario_id , artista_id),
    FOREIGN KEY (usuario_id)
        REFERENCES Usuario (id),
    FOREIGN KEY (artista_id)
        REFERENCES Artista (id)
)  ENGINE=INNODB;

DROP TABLE IF EXISTS Cancao;
CREATE TABLE IF NOT EXISTS Cancao (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    album_id INT NOT NULL,
    FOREIGN KEY (album_id)
        REFERENCES Album (id)
)  ENGINE=INNODB;

DROP TABLE IF EXISTS Historico;
CREATE TABLE IF NOT EXISTS Historico (
    usuario_id INT NOT NULL,
    cancao_id INT NOT NULL,
    PRIMARY KEY (usuario_id , cancao_id),
    FOREIGN KEY (usuario_id)
        REFERENCES Usuario (id),
    FOREIGN KEY (cancao_id)
        REFERENCES Cancao (id)
)  ENGINE=INNODB;

INSERT INTO Plano(tipo, valor)
VALUES('gratuito', 0), ('familiar', 7.99), ('universitário', 5.99);

INSERT INTO Artista(nome)
VALUES('Walter Phoenix'), ('Peter Strong'), ('Lance Day'), ('Freedie Shannon');

INSERT INTO Album(nome, artista_id)
VALUES('Envious', 1), ('Exuberant', 1), ('Hallowed Steam', 2), ('Incandescent', 3), ('Temporary Culture', 4);
    
INSERT INTO Usuario(nome, idade, plano_id )
VALUES('Thati', 23, 1 ), ('Cintia', 35, 2), ('Bill', 20, 3), ('Roger', 45, 1);

INSERT INTO Seguindo(usuario_id, artista_id )
VALUES(1, 1), (1, 3), (1, 4), (2, 1), (2, 3), (3, 1), (3, 2), (4, 4);
    
INSERT INTO Cancao(nome, album_id)
VALUES('Soul For Us', 1 ), ('Reflections Of Magic', 1), ('Dance With Her Own', 1), ('Troubles Of My Inner Fire', 2), ('Time Fireworks', 2), ('Magic Circus', 3), ('Honey, So Do I', 3), ("Sweetie, Let's Go Wild", 3), ('She Knows', 3), ('Fantasy For Me', 4), ('Celebration Of More', 4), ('Rock His Everything', 4), ('Home Forever', 4), ('Diamond Power', 4), ("Honey, Let's Be Silly", 4), ('Thang Of Thunder', 5), ('Words Of Her Life', 5), ('Without My Streets', 5);
        
INSERT INTO Historico(usuario_id, cancao_id)
VALUES(1, 1), (1, 6), (1, 14), (1, 16), (2, 13), (2, 17), (2, 2), (2, 15), (3, 4), (3, 16), (3, 6), (4, 3), (4, 18), (4, 11);

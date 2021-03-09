DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE IF NOT EXISTS SpotifyClone;

USE SpotifyClone;

CREATE TABLE Plano (
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    tipo VARCHAR(50) NOT NULL,
    valor DECIMAL(4 , 2 ) NOT NULL
);

CREATE TABLE Artista (
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nome VARCHAR(50) NOT NULL
);

CREATE TABLE Album (
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nome VARCHAR(50) NOT NULL
);

CREATE TABLE Usuario (
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nome VARCHAR(50) NOT NULL,
    idade INT NOT NULL,
    plano_id INT NOT NULL,
    FOREIGN KEY (plano_id)
        REFERENCES Plano (id)
);

CREATE TABLE Seguindo (
    usuario_id INT NOT NULL,
    artista_id INT NOT NULL,
    PRIMARY KEY (usuario_id , artista_id),
    FOREIGN KEY (usuario_id)
        REFERENCES Usuario (id),
    FOREIGN KEY (artista_id)
        REFERENCES Artista (id)
);

CREATE TABLE Cancao (
    id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    nome VARCHAR(50) NOT NULL,
    album_id INT NOT NULL,
    FOREIGN KEY (album_id)
        REFERENCES Album (id),
    artista_id INT NOT NULL,
    FOREIGN KEY (artista_id)
        REFERENCES Artista (id)
);

CREATE TABLE Historico (
    usuario_id INT NOT NULL,
    cancao_id INT NOT NULL,
    PRIMARY KEY (usuario_id , cancao_id),
    FOREIGN KEY (usuario_id)
        REFERENCES Usuario (id),
    FOREIGN KEY (cancao_id)
        REFERENCES Cancao (id)
);

INSERT INTO Plano(tipo, valor)
VALUES("gratuito", 0), ("familiar", 7.99), ("universitário", 5.99);

INSERT INTO Artista(nome)
VALUES("Walter Phoenix"), ("Peter Strong"), ("Lancy Day"), ("Freedie Shannon");

INSERT INTO Album(nome)
VALUES("Envious"), ("Exuberant"), ("Hallowed Steam"), ("Incandescent"), ("Temporary Culture");
    
INSERT INTO Usuario(nome, idade, plano_id )
VALUES("Thati", 23, 1 ), ("Cintia", 35, 2), ("Bill", 20, 3), ("Roger", 45, 1);

INSERT INTO Seguindo(usuario_id, artista_id )
VALUES(1, 1), (1, 3), (1, 4), (2, 1), (2, 3), (3, 1), (3, 2), (4, 4);
    
INSERT INTO Cancao(nome, album_id, artista_id )
VALUES("Soul For Us", 1, 1 ), ("Reflections Of Magic", 1, 1), ("Dance With Her Own", 1, 1), ("Troubles Of My Inner Fire", 2, 1), ("Time Fireworks", 2, 1), ("Magic Circus", 3, 2), ("Honey, So Do I", 3, 2), ("Sweetie, Let's Go Wild", 3, 2), ("She Knows", 3, 2), ("Fantasy For Me", 4, 3), ("Celebration Of More", 4, 3), ("Rock His Everything", 4, 3), ("Home Forever", 4, 3), ("Diamond Power", 4, 3), ("Honey, Let's Be Silly", 4, 3), ("Thang Of Thunder", 5, 4), ("Words Of Her Life", 5, 4), ("Without My Streets", 5, 4);
    
    
INSERT INTO Historico(usuario_id, cancao_id )
VALUES(1, 1), (1, 6), (1, 14), (1, 16), (2, 13), (2, 17), (2, 2), (2, 15), (3, 4), (3, 16), (3, 6), (4, 3), (4, 18), (4, 11);

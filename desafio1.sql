CREATE DATABASE IF NOT EXISTS SpotifyClone;
USE SpotifyClone;

CREATE TABLE planos (
plano_id INT PRIMARY KEY,
nome_planos VARCHAR(100) NOT NULL,
valor_plano DECIMAL(3, 2) NOT NULL
) ENGINE = InnoDB;

INSERT INTO planos(plano_id, nome_planos, valor_plano) VALUES(1, 'gratuito', 0);
INSERT INTO planos(plano_id, nome_planos, valor_plano) VALUES(2, 'familiar', 7.99);
INSERT INTO planos(plano_id, nome_planos, valor_plano) VALUES(3, 'universitário', 5.97);

CREATE TABLE usuarios (
usuario_id INT PRIMARY KEY,
nome_usuario VARCHAR(100) NOT NULL,
idade INT NOT NULL,
plano_id INT NOT NULL,
foreign key (plano_id) references planos(plano_id)
) ENGINE = InnoDB;

INSERT INTO usuarios(usuario_id, nome_usuario, idade, plano_id) VALUES(1, 'Thati', 23, 1);
INSERT INTO usuarios(usuario_id, nome_usuario, idade, plano_id) VALUES(2, 'Cintia', 35, 2);
INSERT INTO usuarios(usuario_id, nome_usuario, idade, plano_id) VALUES(3, 'Bill', 20, 3);
INSERT INTO usuarios(usuario_id, nome_usuario, idade, plano_id) VALUES(4, 'Roger', 45, 1);

CREATE TABLE artistas(
artista_id INT PRIMARY KEY,
nome_artista VARCHAR(200) NOT NULL
) ENGINE = InnoDB;

INSERT INTO artistas(artista_id, nome_artista) VALUES(1, 'Walter Phoenix');
INSERT INTO artistas(artista_id, nome_artista) VALUES(2, 'Peter Strong');
INSERT INTO artistas(artista_id, nome_artista) VALUES(3, 'Lance Day');
INSERT INTO artistas(artista_id, nome_artista) VALUES(4, 'Freedie Shannon');

CREATE TABLE seguindo(
usuario_id INT NOT NULL,
FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id),
artista_id INT NOT NULL,
FOREIGN KEY (artista_id) REFERENCES artistas(artista_id)
) ENGINE = InnoDB;

INSERT INTO seguindo(usuario_id, artista_id) VALUES(1, 1);
INSERT INTO seguindo(usuario_id, artista_id) VALUES(1, 4);
INSERT INTO seguindo(usuario_id, artista_id) VALUES(1, 3);
INSERT INTO seguindo(usuario_id, artista_id) VALUES(2, 1);
INSERT INTO seguindo(usuario_id, artista_id) VALUES(2, 3);
INSERT INTO seguindo(usuario_id, artista_id) VALUES(3, 2);
INSERT INTO seguindo(usuario_id, artista_id) VALUES(3, 1);
INSERT INTO seguindo(usuario_id, artista_id) VALUES(4, 4);

CREATE TABLE album(
album_id INT PRIMARY KEY,
nome_album VARCHAR(200) NOT NULL,
artista_id INT NOT NULL,
FOREIGN KEY (artista_id) REFERENCES artistas(artista_id)
) ENGINE = InnoDB;

INSERT INTO album(album_id, nome_album, artista_id) VALUES(1, "Envious", 1);
INSERT INTO album(album_id, nome_album, artista_id) VALUES(2, "Exuberant", 1);
INSERT INTO album(album_id, nome_album, artista_id) VALUES(3, "Hallowed Steam", 2);
INSERT INTO album(album_id, nome_album, artista_id) VALUES(4, "Incandescent", 3);
INSERT INTO album(album_id, nome_album, artista_id) VALUES(5, "Temporary Culture", 4);

CREATE TABLE cancoes(
cancao_id INT PRIMARY KEY,
nome_cancao VARCHAR(200) NOT NULL,
artista_id INT NOT NULL,
FOREIGN KEY (artista_id) REFERENCES artistas(artista_id)
) ENGINE = InnoDB;

INSERT INTO cancoes(cancao_id, nome_cancao, artista_id) VALUES(1, "Dance With Her Own", 1);
INSERT INTO cancoes(cancao_id, nome_cancao, artista_id) VALUES(2, "Soul For Us", 1);
INSERT INTO cancoes(cancao_id, nome_cancao, artista_id) VALUES(3,  "Reflections Of Magic", 1);
INSERT INTO cancoes(cancao_id, nome_cancao, artista_id) VALUES(4, "Troubles Of My Inner Fire", 1);
INSERT INTO cancoes(cancao_id, nome_cancao, artista_id) VALUES(5,  "Time Fireworks", 1);
INSERT INTO cancoes(cancao_id, nome_cancao, artista_id) VALUES(6, "Magic Circus", 2);
INSERT INTO cancoes(cancao_id, nome_cancao, artista_id) VALUES(7, "Honey, So Do I", 2);
INSERT INTO cancoes(cancao_id, nome_cancao, artista_id) VALUES(8, "Sweetie, Let's Go Wild", 2);
INSERT INTO cancoes(cancao_id, nome_cancao, artista_id) VALUES(9,  "She Knows", 2);
INSERT INTO cancoes(cancao_id, nome_cancao, artista_id) VALUES(10, "Fantasy For Me", 3);
INSERT INTO cancoes(cancao_id, nome_cancao, artista_id) VALUES(11, "Celebration Of More", 3);
INSERT INTO cancoes(cancao_id, nome_cancao, artista_id) VALUES(12, "Rock His Everything", 3);
INSERT INTO cancoes(cancao_id, nome_cancao, artista_id) VALUES(13,  "Home Forever", 3);
INSERT INTO cancoes(cancao_id, nome_cancao, artista_id) VALUES(14,  "Diamond Power", 3);
INSERT INTO cancoes(cancao_id, nome_cancao, artista_id) VALUES(15,  "Honey, Let's Be Silly", 3);
INSERT INTO cancoes(cancao_id, nome_cancao, artista_id) VALUES(16, "Thang Of Thunder", 4);
INSERT INTO cancoes(cancao_id, nome_cancao, artista_id) VALUES(17, "Words Of Her Life", 4);
INSERT INTO cancoes(cancao_id, nome_cancao, artista_id) VALUES(18, "Without My Streets", 4);

CREATE TABLE historico(
usuario_id INT NOT NULL,
FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id),
cancao_id INT NOT NULL,
FOREIGN KEY (cancao_id) REFERENCES cancoes(cancao_id)
) ENGINE = InnoDB;

INSERT INTO historico(usuario_id, cancao_id) VALUES(1, 16);
INSERT INTO historico(usuario_id, cancao_id) VALUES(1, 2);
INSERT INTO historico(usuario_id, cancao_id) VALUES(1, 6);
INSERT INTO historico(usuario_id, cancao_id) VALUES(1, 14);
INSERT INTO historico(usuario_id, cancao_id) VALUES(1, 15);
INSERT INTO historico(usuario_id, cancao_id) VALUES(2, 13);
INSERT INTO historico(usuario_id, cancao_id) VALUES(2, 17);
INSERT INTO historico(usuario_id, cancao_id) VALUES(2, 3);
INSERT INTO historico(usuario_id, cancao_id) VALUES(2, 4);
INSERT INTO historico(usuario_id, cancao_id) VALUES(3, 16);
INSERT INTO historico(usuario_id, cancao_id) VALUES(3, 6);
INSERT INTO historico(usuario_id, cancao_id) VALUES(4, 1);
INSERT INTO historico(usuario_id, cancao_id) VALUES(4, 18);
INSERT INTO historico(usuario_id, cancao_id) VALUES(4, 11);

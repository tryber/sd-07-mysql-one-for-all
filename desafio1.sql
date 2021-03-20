CREATE DATABASE IF NOT EXISTS SpotifyClone;
USE SpotifyClone;

CREATE TABLE planos(
    plano_id INT primary key auto_increment,
    plano varchar(45) not null,
    valor_plano DECIMAL(5, 2) not null
) engine = InnoDB;

CREATE TABLE users(
    usuario_id INT primary key auto_increment,
    usuario varchar(45) not null,
    idade tinyint not null,
    plano_id INT,
    foreign key (plano_id) references planos (plano_id)
) engine = InnoDB;

CREATE TABLE artistas(
    artista_id INT primary key auto_increment,
    artista varchar(45) not null
) engine = InnoDB;

CREATE TABLE albuns(
    album_id INT primary key auto_increment,
    album varchar(45) not null,
    artista_id INT,
    foreign key (artista_id) references artistas (artista_id)
) engine = InnoDB;

CREATE TABLE songs(
    cancoes_id INT primary key auto_increment,
    cancoes varchar(45) not null,
    artista_id INT NOT NULL,
    album_id INT NOT NULL,
    foreign key (artista_id) references artistas (artista_id),
    foreign key (album_id) references albuns (album_id)
) engine = InnoDB;

CREATE TABLE historico(
    usuario_id INT NOT NULL,
    cancoes_id INT,
    primary key (usuario_id, cancoes_id),
    foreign key (usuario_id) references users (usuario_id) ON DELETE CASCADE,
    foreign key (cancoes_id) references songs (cancoes_id) ON DELETE CASCADE
) engine = InnoDB;

CREATE TABLE seguindo(
    usuario_id INT NOT NULL,
    artista_id INT,
    primary key (usuario_id, artista_id),
    foreign key (usuario_id) references users (usuario_id) ON DELETE CASCADE,
    foreign key (artista_id) references artistas (artista_id) ON DELETE CASCADE
) engine = InnoDB;

INSERT INTO planos (plano, valor_plano)
VALUES
  ("gratuito", 0),
  ("familiar", 7.99),
  ("universitário", 5.99);
  
INSERT INTO users (usuario, idade, plano_id)
VALUES
  ("Thati", 23, 1),
  ("Cintia", 35, 2),
  ("Bill", 20, 3),
  ("Roger", 45, 1); 
  
  INSERT INTO artistas (artista)
VALUES
  ("Walter Phoenix"),
  ("Peter Strong"),
  ("Lance Day"),
  ("Freedie Shannon");

INSERT INTO albuns (album, artista_id)
VALUES
  ("Envious", 1),
  ("Exuberant", 1),
  ("Hallowed Steam", 2),
  ("Incandescent", 3),
  ("Temporary Culture", 4);
  
INSERT INTO songs (cancoes, artista_id, album_id)
VALUES
  ("Soul For Us", 1, 1),
  ("Reflections Of Magic", 1, 1),
  ("Dance With Her Own", 1, 1),
  ("Troubles Of My Inner Fire", 1, 2),
  ("Time Fireworks", 1, 2),
  ("Magic Circus", 2, 3),
  ("Honey, So Do I", 2, 3),
  ("Sweetie, Let's go Wild", 2, 3),
  ("She Knows", 2, 3),
  ("Fantasy For Me", 3, 4),
  ("Celebration Of More", 3, 4),
  ("Rock His Everything", 3, 4),
  ("Home Forever", 3, 4),
  ("Diamond Power", 3, 4),
  ("Honey, Let's Be Silly", 3, 4),
  ("Thang Of Thunder", 4, 5),
  ("Words Of Her Life", 4, 5),
  ("Without My Streets", 4, 5);

INSERT INTO historico (usuario_id, cancoes_id)
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
  
INSERT INTO seguindo (usuario_id, artista_id)
VALUES
  (1, 1),
  (1, 4),
  (1, 3),
  (2, 1),
  (2, 3),
  (3, 2),
  (3, 1),
  (4, 4);

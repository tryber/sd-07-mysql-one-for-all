DROP DATABASE IF EXISTS SpotifyClone;

CREATE DATABASE SpotifyClone;

USE SpotifyClone;

CREATE TABLE plan(
  planID INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  planNAME VARCHAR(50) NOT NULL,
  planVALUE DECIMAL(5,2) NOT NULL
);

CREATE TABLE user(
  userID INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  userNAME VARCHAR(50) NOT NULL,
  userAGE INT NOT NULL,
  planID INT NOT NULL,
  FOREIGN KEY (planID) REFERENCES plan(planID)
); 

CREATE TABLE artist(
  artistID INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  artistFIRSTNAME VARCHAR(50) NOT NULL,
  artistLASTNAME VARCHAR(50) NOT NULL
);

CREATE TABLE user_artist(
  userID INT NOT NULL,
  artistID INT NOT NULL,
  PRIMARY KEY (userID, artistID),
  FOREIGN KEY (userID) REFERENCES user(userID),
  FOREIGN KEY (artistID) REFERENCES artist(artistID)
);

CREATE TABLE album(
  albumID INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  albumNAME VARCHAR(50) NOT NULL,
  artistID INT NOT NULL,
  FOREIGN KEY (artistID) REFERENCES artist(artistID)
); 

CREATE TABLE song(
  songID INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  songNAME VARCHAR(50) NOT NULL,
  albumID INT NOT NULL,
  FOREIGN KEY (albumID) REFERENCES album(albumID)
); 

CREATE TABLE history(
  songID INT NOT NULL,
  userID INT NOT NULL,
  PRIMARY KEY(songID, userID),
  FOREIGN KEY(songID) REFERENCES song(songID),
  FOREIGN KEY(userID) REFERENCES user(userID)
);

INSERT INTO plan (planNAME, planVALUE)
  VALUES ('gratuito', 0), ('familiar', 7.99), ('universitário', 5.99);

INSERT INTO user (userNAME, userAGE, planID)
  VALUES ('Thati', 23, 1), ('Cintia', '35', 2), ('Bill', '20', 3), ('Roger', '45', 1);

INSERT INTO artist (artistFIRSTNAME, artistLASTNAME) 
  VALUES ('Walter', 'Phoenix'), ('Freedie', 'Shannon'), ('Lance', 'Day'), ('Peter', 'Strong');

INSERT INTO user_artist (userID, artistID) 
  VALUES (1,1), (1,2), (1,3), (2,1), (2,3), (3,4), (3,1), (4,2);

INSERT INTO album (albumNAME, artistID) 
  VALUES ('Envious', 1), ('Exuberant', 1), ('Hallowed Steam', 4), ('Incandescent', 3), ('Temporary Culture', 2);

INSERT INTO song (songNAME, albumID)
  VALUES
    ('Soul For Us', 1),
    ('Reflections Of Magic', 1),
    ('Dance With Her Own', 1),
    ('Troubles Of My Inner Fire', 2),
    ('Time Fireworks', 2),
    ('Magic Circus', 3),
    ('Honey, So Do I', 3),
    ("Sweetie, Let's Go Wild", 3),
    ('She Knows', 3),
    ('Fantasy For Me', 4),
    ('Celebration Of More', 4),
    ('Rock His Everything', 4),
    ('Home Forever', 4),
    ('Diamond Power', 4),
    ("Honey, Let's Be Silly", 4),
    ('Thang Of Thunder', 5),
    ('Words Of Her Life', 5),
    ('Without My Streets', 5);

INSERT INTO history (songID, userID)
  VALUES
    (1,1),
    (6,1),
    (14,1),
    (16,1),
    (13,2),
    (17,2),
    (2,2),
    (15,2),
    (4,3),
    (16,3),
    (6,3),
    (3,4),
    (18,4),
    (11,4);

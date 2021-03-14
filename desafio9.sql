USE SpotifyClone;
DELIMITER $$

CREATE PROCEDURE albuns_do_artista(singer_name VARCHAR(30))
BEGIN
  SELECT
  SINGERS.name AS artista,
  ALBUNS.title AS album
  FROM SpotifyClone.singers AS SINGERS
  INNER JOIN SpotifyClone.albuns ALBUNS ON ALBUNS.singer_id = SINGERS.singer_id
  WHERE SINGERS.name = singer_name
  ORDER BY album;
END $$

DELIMITER;


DELIMITER $$
CREATE PROCEDURE albuns_do_artista(IN nome VARCHAR(100))
BEGIN
  SELECT
    SpotifyClone.singers.name AS "artista",
    SpotifyClone.albuns.name AS "album"
  FROM SpotifyClone.singers
  JOIN SpotifyClone.albuns
  ON SpotifyClone.singers.id = SpotifyClone.albuns.artist_id
  WHERE SpotifyClone.singers.name = nome
  ORDER BY album;
END $$
DELIMITER ;

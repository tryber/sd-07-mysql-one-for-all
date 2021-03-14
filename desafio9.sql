DELIMITER $$
CREATE PROCEDURE albuns_do_artista(IN nome VARCHAR(100))
BEGIN
SELECT c.artist_name AS "artista",
a.album_name AS "album"
FROM SpotifyClone.artist AS c
INNER JOIN SpotifyClone.album AS a
ON a.artist_id = c.artist_id
WHERE c.artist_name = nome
ORDER BY a.album_name ASC;
END $$
DELIMITER ;

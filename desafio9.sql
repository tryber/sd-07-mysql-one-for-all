
DELIMITER $$

CREATE PROCEDURE albuns_do_artista(IN nome_do_artista VARCHAR(25))

BEGIN
SELECT a.artist_name AS artista, alb.album_name AS album
FROM artists AS a
INNER JOIN albuns AS alb
ON a.artist_id = alb.artist_id
WHERE a.artist_name = nome_do_artista
ORDER BY album;
END $$
DELIMITER ;

DELIMITER $$
CREATE PROCEDURE albuns_do_artista(IN nome_do_artista VARCHAR(25))
BEGIN
SELECT
art.artist_colum AS artista,
alb.album_colum AS album
FROM artists AS art
INNER JOIN albums AS alb
ON art.artist_id = alb.artist_id
WHERE art.artist_colum = nome_do_artista
ORDER BY album;
END $$
DELIMITER ;

DELIMITER $$

CREATE PROCEDURE albuns_do_artista (IN artista VARCHAR(50)) 
BEGIN
SELECT
art.artista AS artista,
alb.album AS album
FROM SpotifyClone.artistas AS art
JOIN SpotifyClone.albuns AS alb 
ON art.artista_id = alb.artista_id
WHERE art.artista = artista
ORDER BY album;
END $$

DELIMITER ;

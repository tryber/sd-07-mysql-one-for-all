USE SpotifyClone;
DELIMITER $$

CREATE PROCEDURE albuns_do_artista(IN artist VARCHAR(300))
BEGIN
    SELECT a.artista AS artista, alb.album AS album
    FROM artistas AS a
    INNER JOIN albuns AS alb ON a.artista = artist AND a.artista_id = alb.artista_id;
END $$

DELIMITER ;

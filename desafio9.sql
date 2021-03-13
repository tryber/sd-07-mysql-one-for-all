USE SpotifyClone;
DELIMITER $$
CREATE PROCEDURE albuns_do_artista (IN artista VARCHAR(60))
BEGIN
SELECT ar.artista_name AS "artista",
al.album AS "album"
FROM SpotifyClone.artistas AS ar
INNER JOIN SpotifyClone.albuns AS al 
ON ar.artista_id = al.artista_id
WHERE ar.artista_name = artista
ORDER BY 2;
END $$
DELIMITER ;

DELIMITER $$

CREATE PROCEDURE albuns_do_artista(IN nomeArtista VARCHAR(50))
BEGIN
SELECT a.artista AS 'artista', a2.album AS 'album' 
FROM SpotifyClone.artistas AS a
INNER JOIN
SpotifyClone.albuns AS a2 
ON a.artista_id = a2.artista_id 
WHERE nomeArtista = `artista`
GROUP BY `artista`, `album`
ORDER BY `album`;
END $$

DELIMITER ;

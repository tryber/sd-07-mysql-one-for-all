USE SpotifyClone;
DELIMITER $$

CREATE PROCEDURE albuns_do_artista(IN nomeDoArtista VARCHAR(100))
BEGIN
SELECT 
artistas.artista AS artista,
albuns.album AS album
FROM SpotifyClone.artistas AS artistas
INNER JOIN SpotifyClone.albuns AS albuns
ON artistas.artista_id = albuns.artista_id
HAVING artista = nomeDoArtista
ORDER BY album;
END $$

DELIMITER ;

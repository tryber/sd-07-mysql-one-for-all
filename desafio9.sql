USE SpotifyClone;
DELIMITER $$

CREATE PROCEDURE albuns_do_artista(IN artist_name VARCHAR(50))
BEGIN
SELECT artist.artista AS artista,
albuns.album AS album
FROM SpotifyClone.artistas AS artist
INNER JOIN SpotifyClone.albuns AS albuns
ON artist.artista_id = albuns.artista_id
WHERE artist.artista = artist_name
ORDER BY album;
END $$

DELIMITER ;

CALL albuns_do_artista('Walter Phoenix');

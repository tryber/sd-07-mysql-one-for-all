DELIMITER $$

CREATE PROCEDURE albuns_do_artista(IN nome VARCHAR(100))
BEGIN
SELECT artista.artista AS `artista`,
album.album AS `album`
FROM SpotifyClone.artista AS artista
INNER JOIN SpotifyClone.album AS album
ON artista.artista_id = album.artista_id
WHERE artista.artista = nome
ORDER BY album;
END $$

DELIMITER ;
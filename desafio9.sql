USE SpotifyClone;
DELIMITER $$
CREATE PROCEDURE albuns_do_artista(IN nome VARCHAR(45))
BEGIN
SELECT artistas.artista AS artista,
albuns.album AS album
FROM SpotifyClone.artistas
INNER JOIN SpotifyClone.albuns
ON artistas.artista_id = albuns.artista_id
WHERE nome = artistas.artista
ORDER BY album asc;
END $$
DELIMITER ;

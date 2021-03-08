DELIMITER $$
CREATE PROCEDURE albuns_do_artista(IN nome_do_artista VARCHAR(25))
BEGIN
SELECT
art.nome_artista AS artista,
alb.nome_album AS album
FROM SpotifyClone.artista AS art
INNER JOIN SpotifyClone.album AS alb
ON art.artista_id = alb.artista_id
WHERE art.nome_artista = nome_do_artista
ORDER BY album;
END $$
DELIMITER ;

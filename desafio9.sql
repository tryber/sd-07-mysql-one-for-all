DELIMITER $$

CREATE PROCEDURE albuns_do_artista(IN nome VARCHAR(200))
BEGIN
SELECT art.artista AS `artista`,
alb.album AS `album`
FROM SpotifyClone.artistas AS art
INNER JOIN SpotifyClone.albuns AS alb 
ON art.artista_id = alb.artista_id
WHERE art.artista = nome
ORDER BY album;
END $$

DELIMITER ;

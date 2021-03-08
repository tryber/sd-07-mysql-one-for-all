USE SpotifyClone;
DELIMITER $$

CREATE PROCEDURE albuns_do_artista(nome_artista VARCHAR(100))
BEGIN
SELECT 
art.nome AS artista,
alb.nome AS album
FROM artistas AS art
INNER JOIN albuns AS alb
ON alb.artista_id = art.artista_id
WHERE art.nome = nome_artista
ORDER BY alb.nome;
END $$

DELIMITER ;

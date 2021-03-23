USE SpotifyClone;

DELIMITER $$
CREATE PROCEDURE albuns_do_artista (IN nome_artista VARCHAR(100))
BEGIN
SELECT a.nome AS artista,
al.nome AS album
FROM SpotifyClone.albuns AS al
INNER JOIN SpotifyClone.artistas AS a
ON al.artista_id = a.artista_id
WHERE a.nome = nome_artista
ORDER BY al.nome;
END $$

DELIMITER ;

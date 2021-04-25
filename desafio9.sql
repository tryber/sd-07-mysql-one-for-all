DELIMITER $$
CREATE PROCEDURE albuns_do_artista(IN nome_artista VARCHAR(100))
BEGIN
SELECT
a.nome AS artista,
al.nome AS album
FROM
SpotifyClone.artista AS a
INNER JOIN SpotifyClone.album AS al ON a.artista_id = al.artista_id
WHERE a.artista = nome_artista
ORDER BY album ASC;
END;
$$
DELIMITER ;

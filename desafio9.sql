USE SpotifyClone;
DELIMITER $$
CREATE PROCEDURE albuns_do_artista(IN nome_artista VARCHAR(100))
BEGIN
SELECT
t1.nome AS artista, t2.nome AS album
FROM
artista AS t1
INNER JOIN
album AS t2 ON t1.artista_id = t2.artista_id
WHERE
t1.nome = nome_artista
ORDER BY album ASC;
END $$
DELIMITER ;

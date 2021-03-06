DELIMITER $$
CREATE PROCEDURE albuns_do_artista(IN nome_artista VARCHAR(100))
BEGIN
SELECT t1.artista AS 'artista',
t2.album AS 'album'
FROM SpotifyClone.artistas AS t1
INNER JOIN SpotifyClone.albuns AS t2
ON t1.artista_id = t2.artista_id
WHERE t1.artista = nome_artista
ORDER BY 2 ASC;
END $$
DELIMITER ;

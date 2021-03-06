DELIMITER $$
CREATE PROCEDURE albuns_do_artista(IN nome_artista VARCHAR(45))
BEGIN
SELECT 
t1.artista AS artista,
t2.album AS album
FROM SpotifyClone.artistas t1
JOIN SpotifyClone.albuns t2 ON t1.id_artista = t2.id_artista
WHERE t1.artista = nome_artista
ORDER BY t2.album;
END $$

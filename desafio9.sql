DELIMITER $$
CREATE PROCEDURE albuns_do_artista(IN artista VARCHAR(50))
BEGIN
SELECT
a.nome_artista AS artista,
al.nome_album AS album
FROM SpotifyClone.albums AS al
INNER JOIN
SpotifyClone.artists AS a
ON a.artista_id = al.artista_id
WHERE artista = a.nome_artista;
END $$
DELIMITER ;

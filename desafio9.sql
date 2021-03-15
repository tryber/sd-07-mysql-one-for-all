USE SpotifyClone;

DELIMITER $$
CREATE PROCEDURE albuns_do_artista(IN nome_artista VARCHAR(50))
BEGIN
SELECT artista.nome_artista AS artista, album.nome_album AS album
FROM artistas AS artista
INNER JOIN album AS album
  ON album.artista_id = artista.artista_id
WHERE artista.nome_artista = nome_artista
ORDER BY album.nome_album ASC;
END $$
DELIMITER ;

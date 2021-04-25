USE SpotifyClone;
DELIMITER $$
CREATE PROCEDURE albuns_do_artista(IN nomeArtista VARCHAR(100))
BEGIN
SELECT a.artista_nome AS artista, al.album_nome AS album
FROM SpotifyClone.artista AS a
INNER JOIN SpotifyClone.album AS al ON a.artista_id = al.artista_id
WHERE nomeArtista = a.artista_nome;
END $$
DELIMITER ;

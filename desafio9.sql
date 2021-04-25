USE SpotifyClone;
DELIMITER $$

CREATE PROCEDURE albuns_do_artista(IN artista VARCHAR(25))
BEGIN
SELECT a.artista_nome AS 'artista', al.album
FROM SpotifyClone.albuns al
JOIN SpotifyClone.artistas a ON al.artista_id = a.artista_id
WHERE a.artista_nome = artista;
END $$

DELIMITER ;

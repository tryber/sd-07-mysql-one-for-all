USE SpotifyClone
DELIMITER $$

CREATE PROCEDURE albuns_do_artista(
IN nome_do_artista VARCHAR(200))
BEGIN
SELECT ART.nome_artista artista,
ALB.nome_album album
FROM SpotifyClone.artistas ART
INNER JOIN SpotifyClone.album ALB
ON ART.artista_id = ALB.artista_id
WHERE ART.nome_artista = nome_do_artista;
END $$

DELIMITER ;

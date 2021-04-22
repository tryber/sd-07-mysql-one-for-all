DELIMITER $$

CREATE PROCEDURE albuns_do_artista(IN nomeArtista VARCHAR(200))
BEGIN
SELECT ar.nome_do_artista, al.nome_do_album
FROM SpotifyClone.artista ar
INNER JOIN SpotifyClone.album al
ON ar.artista_id = al.artista_id;
END $$

DELIMITER ;

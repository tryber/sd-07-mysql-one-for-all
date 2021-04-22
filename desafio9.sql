DELIMITER $$

CREATE PROCEDURE albuns_do_artista(IN nomeArtista VARCHAR(200))
BEGIN
SELECT ar.nome_do_artista as artista, al.nome_do_album as album
FROM SpotifyClone.artista ar
INNER JOIN SpotifyClone.album al
ON ar.artista_id = al.artista_id
WHERE nomeArtista = ar.nome_do_artista;
END $$

DELIMITER ;

CALL albuns_do_artista('Walter Phoenix');

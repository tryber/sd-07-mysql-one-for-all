DELIMITER $$

CREATE PROCEDURE albuns_do_artista(IN nome VARCHAR(45))
BEGIN
    SELECT
        SpotifyClone.artista.artista as artista,
        SpotifyClone.album.album as album
    FROM SpotifyClone.album
    INNER JOIN SpotifyClone.artista
    ON SpotifyClone.artista.id = SpotifyClone.album.artista_id
    WHERE SpotifyClone.artista.artista = nome
    ORDER BY album ASC;
END $$

DELIMITER ;

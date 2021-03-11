DELIMITER $$

CREATE PROCEDURE albuns_do_artista(IN nameArtista VARCHAR(100))
BEGIN
    SELECT sin.sin_name AS 'artista',
    abl.abl_name AS 'album'
    FROM SpotifyClone.albums AS abl
    INNER JOIN SpotifyClone.artistas AS sin ON sin.idartistas = abl.idartistas
    WHERE sin.name_singer = nameArtista
    ORDER BY album;
END $$

DELIMITER ;
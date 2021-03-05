USE SpotifyClone;
DELIMITER $$

CREATE PROCEDURE albuns_do_artista(IN artista VARCHAR(100))
BEGIN
    SELECT
    ar.artist AS artista,
    al.album AS album
    FROM SpotifyClone.artists ar
    INNER JOIN SpotifyClone.albums al
    ON ar.artist_id = al.artist_id
    WHERE ar.artist = artista
	ORDER BY album;
END $$

DELIMITER ;

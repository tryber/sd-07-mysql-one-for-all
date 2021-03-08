DELIMITER $$

CREATE PROCEDURE albuns_do_artista(IN in_sin_name VARCHAR(100))
BEGIN
    SELECT sin.sin_name AS 'artista',
    abl.abl_name AS 'album'
    FROM SpotifyClone.Albums AS abl
    INNER JOIN SpotifyClone.Singers AS sin ON sin.sin_id = abl.sin_id
    WHERE sin.sin_name = in_sin_name
    ORDER BY album;
END $$

DELIMITER ;

USE SpotifyClone;
DELIMITER $$

CREATE PROCEDURE albuns_do_artista(IN artistin VARCHAR(100))
BEGIN
    SELECT
a.name AS artista,
ab.album_name AS album
FROM artists a
INNER JOIN albums ab ON ab.artist_id = a.artist_id
WHERE name LIKE CONCAT('%', artistin, '%');
END $$

DELIMITER ;

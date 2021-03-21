USE SpotifyClone;
DELIMITER $$

CREATE PROCEDURE albuns_do_artista(IN artist_name VARCHAR(300))
BEGIN
    SELECT CONCAT(art.first_name,' ',art.last_name) AS 'artista',
    alb.`name` AS 'album'
    FROM artist art
    INNER JOIN album alb ON art.artist_id = alb.artist_id AND CONCAT(art.first_name,' ',art.last_name) = artist_name
    ORDER BY 2;
END $$

DELIMITER ;

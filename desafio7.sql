DELIMITER $$
CREATE FUNCTION qty_user_artist(artist_idr INT)
RETURNS INT READS SQL DATA
BEGIN
    DECLARE qty_follows INT;
    SELECT COUNT(ua.artist_id) FROM SpotifyClone.user_artist ua
    WHERE ua.artist_id = artist_idr INTO qty_follows;
    RETURN qty_follows;
END $$

DELIMITER ;

CREATE VIEW perfil_artistas AS
SELECT
CONCAT(art.first_name,' ',art.last_name) AS 'artista', alb.`name` AS 'album',
(SELECT qty_user_artist(art.artist_id)) AS 'seguidores'
FROM artist art
INNER JOIN album alb ON alb.artist_id = art.artist_id
ORDER BY 3 DESC, 1, 2;

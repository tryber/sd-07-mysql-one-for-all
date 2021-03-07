DELIMITER $$

CREATE PROCEDURE albuns_do_artista (IN artist VARCHAR(255))
BEGIN
SELECT
    art.artist_name AS `artista`,
    alb.album_name AS `album`
    FROM 
    SpotifyClone.artist AS `art`
    INNER JOIN SpotifyClone.albums AS `alb`
    ON 
    art.artist_id = alb.artist_id
    WHERE
	artist = art.artist_name
    ORDER BY
    `album` ASC;
END $$
DELIMITER ;

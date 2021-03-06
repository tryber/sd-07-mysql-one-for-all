DELIMITER $$

CREATE PROCEDURE albuns_do_artista(IN art_name VARCHAR(100))
    BEGIN
        SELECT art.name AS `artista`,
            alb.album AS `album`
        FROM SpotifyClone.albums AS alb
            INNER JOIN SpotifyClone.artists AS art
                ON alb.id_artist = art.id_artist
        WHERE art.name = art_name
        ORDER BY `album`;
    END $$

DELIMITER ;
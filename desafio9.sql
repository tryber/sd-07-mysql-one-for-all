DELIMITER $
CREATE PROCEDURE albuns_do_artista(PR_name VARCHAR(30))
BEGIN
    SELECT 
        AR.artist_name AS `artista`,
        AB.album_name AS `album`
    FROM albums AB
        INNER JOIN artists AR
        ON AB.id_artist = AR.id_artist
    WHERE AR.artist_name = PR_name
    ORDER BY `album`;
END
$
DELIMITER ;

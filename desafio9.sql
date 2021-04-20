DELIMITER $$ 
CREATE PROCEDURE SpotifyClone.albuns_do_artista(IN artist_name VARCHAR(100))
  BEGIN
    SELECT 
    a.name AS 'artista', 
    al.name AS 'album'
    FROM SpotifyClone.artists a 
    INNER JOIN SpotifyClone.albums al ON al.artist_id = a.id
    WHERE a.name = artist_name
    ORDER BY al.name ASC;
  END;
$$ DELIMITER ;

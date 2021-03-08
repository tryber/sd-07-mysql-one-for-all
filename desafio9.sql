USE SpotifyClone;
DELIMITER $$

CREATE PROCEDURE albuns_do_artista(IN artistaName VARCHAR(100))
BEGIN
SELECT 
a.artista_name AS `artista`,
al.album_name AS `album`
FROM SpotifyClone.Artistas AS `a`
INNER JOIN SpotifyClone.Albunss AS `al`
ON a.artista_id = al.artista_id
HAVING a.artista_name = artistaName
ORDER BY `album`;
END $$

DELIMITER ;

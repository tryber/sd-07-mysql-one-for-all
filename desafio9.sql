USE SpotifyClone;
DELIMITER $$

CREATE PROCEDURE albuns_do_artista(IN artistaName VARCHAR(100))
BEGIN
SELECT 
a.artista_name AS `artista`,
al.album_name AS `album`
FROM SpotifyClone.Artista AS `a`
INNER JOIN SpotifyClone.Albuns AS `al`
ON a.artista_id = al.artista_id
HAVING `artista` = artistaName
ORDER BY `album`;
END $$

DELIMITER ;

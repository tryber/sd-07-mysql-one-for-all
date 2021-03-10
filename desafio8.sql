USE SpotifyClone;
DELIMITER $$
DROP PROCEDURE IF EXISTS albuns_do_artista;
CREATE PROCEDURE albuns_do_artista(IN name VARCHAR(50))
BEGIN
	SELECT artist AS `artista`, cover AS `album`
	FROM covers
	WHERE artist = name
    ORDER BY `album`;
END $$

DELIMITER ;

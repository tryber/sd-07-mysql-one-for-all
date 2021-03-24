USE SpotifyClone;
DELIMITER $$

CREATE PROCEDURE albuns_do_artista(IN singer VARCHAR(100))
BEGIN
SELECT 
dba.artista AS 'artista',
dbalb.album AS 'album'
FROM SpotifyClone.artists AS dba
INNER JOIN SpotifyClone.albums AS dbalb
ON dba.artista_id = dbalb.artista_id
HAVING artista = singer
ORDER BY `album`;
END $$

DELIMITER ;

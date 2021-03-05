USE SpotifyClone;
DELIMITER $$

CREATE PROCEDURE albuns_do_artista(IN name VARCHAR(100))
BEGIN
SELECT A.name AS 'artista',
CD.name AS 'album'
FROM SpotifyClone.artist AS A
INNER JOIN SpotifyClone.albuns AS CD
ON A.id = CD.artist_id
WHERE A.name = name
ORDER BY 2;
END $$

DELIMITER $$
CALL albuns_do_artista('Walter Phoenix');

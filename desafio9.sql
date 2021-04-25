DROP PROCEDURE IF EXISTS albuns_do_artista;

USE SpotifyClone;
DELIMITER $$
CREATE PROCEDURE albuns_do_artista(IN nome VARCHAR(100))
BEGIN
SELECT AR.artist_name AS artista,
AL.album_name AS album
FROM SpotifyClone.artists AS AR
JOIN SpotifyClone.albums AS AL ON AR.artist_id = AL.artist_id
WHERE nome = AR.artist_name
ORDER BY album;
END $$
DELIMITER ;

CALL albuns_do_artista('Walter Phoenix');

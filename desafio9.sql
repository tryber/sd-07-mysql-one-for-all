USE SpotifyClone;
DELIMITER $$
CREATE PROCEDURE albuns_do_artista(IN nome VARCHAR(100))
BEGIN
SELECT ART.artist_name AS artista,
ALB.album_name AS album
FROM SpotifyClone.artists AS ART
JOIN SpotifyClone.albums AS ALB ON ART.artist_id = ALB.artist_id
WHERE nome = ART.artist_name
ORDER BY album;
END $$
DELIMITER ;
CALL albuns_do_artista('Walter Phoenix');

USE SpotifyClone;
DELIMITER $$
CREATE PROCEDURE albuns_do_artista(IN artist VARCHAR(50))
BEGIN
SELECT a.name AS artista,
ab.album_name AS album
FROM SpotifyClone.artists AS a,
SpotifyClone.albums AS ab
WHERE a.artist_id = ab.artist_id
AND a.name = artist;
END $$

DELIMITER ;

USE SpotifyClone;
DELIMITER $$
CREATE PROCEDURE albuns_do_artista(IN artistName VARCHAR(400))
BEGIN
SELECT art.artist AS artista,
albums.name AS album
FROM SpotifyClone.artists AS art
INNER JOIN SpotifyClone.albums AS albums
ON art.id = album.artist_id
WHERE artistName = art.artists
ORDER BY album;
END $$
DELIMITER ;

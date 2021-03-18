USE SpotifyClone;
DELIMITER $$
CREATE PROCEDURE albuns_do_artista1(IN artistName VARCHAR(50))
BEGIN
SELECT a.artist_name AS artista,
album.album_name AS album
FROM SpotifyClone.artists AS a
INNER JOIN SpotifyClone.albuns AS album ON a.artist_id = album.artist_id
WHERE artistName = a.artist_name
ORDER BY album;
END $$
DELIMITER;

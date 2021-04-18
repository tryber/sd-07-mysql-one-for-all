DELIMITER //
CREATE PROCEDURE albuns_do_artista(IN ARTIST_NAME VARCHAR(100))
BEGIN
SELECT 
artists.ARTIST AS artista,
albums.ALBUM AS album
FROM
SpotifyClone.albums albums,
SpotifyClone.artists artists
WHERE
albums.ARTIST_ID = artists.ARTIST_ID
AND ARTIST_NAME = artists.ARTIST
ORDER BY album;
END //

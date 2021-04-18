DELIMITER //
CREATE PROCEDURE albuns_do_artista(IN ARTIST_NAME VARCHAR(100))
BEGIN
SELECT 
artists.ARTISTNAME AS artista,
albums.ALBUMNAME AS album
FROM
SpotifyClone.albums albums,
SpotifyClone.artists artists
WHERE
albums.ARTIST_ID = artists.ARTIST_ID
AND ARTIST_NAME = artists.ARTISTNAME
ORDER BY album;
END //

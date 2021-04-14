DELIMITER &&

CREATE PROCEDURE albuns_do_artista(IN artistName VARCHAR(50))
BEGIN
SELECT artist_name 'artista', album_title 'album' FROM SpotifyClone.artists artists
RIGHT JOIN SpotifyClone.albums albums
ON artists.artist_id = albums.artist_id
WHERE artist_name = artistName
ORDER BY `album`;
END &&

DELIMITER ;

CREATE VIEW perfil_artistas AS
SELECT
artists.ARTIST AS artista,
albums.ALBUM AS album,
COUNT(*) AS seguidores
FROM
spotifyclone.albums albums,
spotifyclone.artists artists,
spotifyclone.followers followers
WHERE
artists.ARTIST_ID = followers.ARTIST_ID
AND albums.ARTIST_ID = artists.ARTIST_ID
GROUP BY followers.ARTIST_ID, albums.ALBUM_ID
ORDER BY seguidores DESC, artista, album;

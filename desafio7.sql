CREATE VIEW perfil_artistas AS
SELECT
artist_name 'artista',
album_title 'album',
COUNT(favorites.artist_id) 'seguidores'
FROM
SpotifyClone.artists artists
INNER JOIN SpotifyClone.albums albums
ON artists.artist_id = albums.artist_id
INNER JOIN SpotifyClone.favorites favorites
ON favorites.artist_id = artists.artist_id
GROUP BY albums.album_id
ORDER BY `seguidores` DESC, `artista`, `album`;

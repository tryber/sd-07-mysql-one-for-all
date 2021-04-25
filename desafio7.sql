CREATE VIEW SpotifyClone.perfil_artistas AS
SELECT a.artist_name AS artista,
album.album_name AS album,
COUNT(f.artist_id) AS seguidores
FROM SpotifyClone.artists AS a
INNER JOIN SpotifyClone.albuns AS album ON a.artist_id = album.artist_id
INNER JOIN SpotifyClone.followingArtists AS f ON a.artist_id = f.artist_id
GROUP BY album.album_name, artista
ORDER BY seguidores DESC, artista, album;

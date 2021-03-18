CREATE VIEW SpotifyClone.perfil_artistas AS
SELECT artists.artist AS artista,
albums.name AS album, 
COUNT(*) AS seguidores
FROM SpotifyClone.artists AS artists
INNER JOIN SpotifyClone.albums AS albums
ON followers.artist_id = artists.id
INNER JOIN SpotifyClone.followed_artists AS followers
ON artists.id = followers.artist_id
GROUP BY albums.id
ORDER BY 3 DESC, 1;

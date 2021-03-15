CREATE VIEW SpotifyClone.top_3_artistas AS
SELECT artists.artist AS artista,
COUNT(*) AS seguidores
FROM SpotifyClone.artists AS artists
INNER JOIN SpotifyClone.followed_artists AS followers
ON followers.artist_id = artists.id
INNER JOIN SpotifyClone.user AS users
ON followers.artist_id = artists.id
GROUP BY artists.artist
ORDER BY 2 DESC, 1
LIMIT 3;

CREATE VIEW top_3_artistas AS
SELECT a.artist_name AS artista,
COUNT(a.artist_id) AS seguidores
FROM SpotifyClone.artists_following AS af
INNER JOIN SpotifyClone.artists AS a
ON a.artist_id = af.artist_id
GROUP BY artista
ORDER BY seguidores DESC , artista ASC LIMIT 3;

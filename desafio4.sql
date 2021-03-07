CREATE VIEW top_3_artistas AS
SELECT
ar.artist AS artista,
COUNT(ar.artist) AS seguidores
FROM SpotifyClone.folowers as fo
INNER JOIN SpotifyClone.artists AS ar
ON fo.artist_id = ar.artist_id
GROUP BY artista
ORDER BY seguidores DESC, artista ASC
LIMIT 3;

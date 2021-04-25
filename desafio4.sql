CREATE VIEW top_3_artistas AS
SELECT
ar.artist AS artista,
COUNT(f.artist_id) AS seguidores
FROM SpotifyClone.artists ar

INNER JOIN SpotifyClone.followers f
ON ar.artist_id = f.artist_id

GROUP BY f.artist_id
ORDER BY seguidores DESC, artista
LIMIT 3;

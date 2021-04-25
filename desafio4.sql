CREATE VIEW top_3_artistas AS
SELECT
a.name AS artista,
Count(f.user_id) AS seguidores
FROM SpotifyClone.followers f
INNER JOIN SpotifyClone.artists a ON a.artist_id = f.artist_id
GROUP BY 1
ORDER BY
2 DESC,
1 ASC
limit 3;

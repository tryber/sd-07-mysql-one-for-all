CREATE VIEW SpotifyClone.top_3_artistas AS
SELECT
a.name AS artista,
COUNT(f.user_id) AS seguidores
FROM SpotifyClone.artists a
INNER JOIN SpotifyClone.follow f ON a.id = f.artist_id
GROUP BY a.name
ORDER BY seguidores desc, artista
LIMIT 3;

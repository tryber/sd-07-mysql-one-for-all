USE SpotifyClone;
CREATE VIEW top_3_artistas AS
SELECT a.name AS artista, COUNT(f.artist_id) AS seguidores
FROM SpotifyClone.followers AS f
JOIN SpotifyClone.artists AS a ON a.artist_id = f.artist_id
GROUP BY a.name
ORDER BY seguidores DESC
LIMIT 3;

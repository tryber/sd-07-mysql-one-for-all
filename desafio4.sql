CREATE VIEW top_3_artistas AS
SELECT A.name AS 'artista',
COUNT(F.artist_id) AS 'seguidores'
FROM SpotifyClone.artist AS a
INNER JOIN SpotifyClone.artist_followers AS F
ON A.id = F.artist_id
GROUP BY 1
ORDER BY 2 DESC, 1 LIMIT 3;

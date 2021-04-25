CREATE VIEW top_3_artistas AS
SELECT art.artist_name AS artista
COUNT(F.artist_id) AS seguidores
FROM artists AS art
INNER JOIN followers AS F
ON art.artist_id = F.artist_id
GROUP BY artista
ORDER BY seguidores DESC
LIMIT 3;

CREATE VIEW SpotifyClone.top_3_artistas AS
SELECT artistas.artista AS artista,
COUNT(*) AS seguidores
FROM SpotifyClone.artistas
INNER JOIN SpotifyClone.seguindo 
ON seguindo.artista_id = artistas.artista_id
GROUP BY artistas.artista_id
ORDER BY 2 DESC, 1
LIMIT 3;

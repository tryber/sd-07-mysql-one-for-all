CREATE VIEW top_3_artistas AS
SELECT a.artista_nome AS artista, COUNT(a.artista_id) AS seguidores
FROM SpotifyClone.artistas_seguidos as ars
INNER JOIN SpotifyClone.artista AS a ON ars.artista_id = a.artista_id
GROUP BY ars.artista_id
ORDER BY 2 DESC, 1 LIMIT 3;

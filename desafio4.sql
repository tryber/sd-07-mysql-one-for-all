CREATE VIEW top_3_artistas AS
SELECT A.artista AS artista,
COUNT(S.artista_id) AS seguidores
FROM SpotifyClone.seguindo_artistas AS S
INNER JOIN SpotifyClone.artistas AS A
ON A.artista_id = S.artista_id
GROUP BY S.artista_id
ORDER BY 2 DESC, 1
LIMIT 3;

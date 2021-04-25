CREATE VIEW top_3_artistas AS 
SELECT a.nome_artista AS artista,
COUNT(artista_id) AS seguidores
FROM SpotifyClone.artistas_seguidos AS sa
INNER JOIN SpotifyClone.artistas AS a
ON a.id = sa.artista_id
GROUP BY sa.artista_id
ORDER BY seguidores DESC,artista
LIMIT 3;

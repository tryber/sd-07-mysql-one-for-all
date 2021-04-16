CREATE VIEW top_3_artistas AS
SELECT
a.nome AS artista,
COUNT(sa.artista_id) AS seguidores
FROM seguindo_artista sa
INNER JOIN artista a ON a.artista_id = sa.artista_id
GROUP BY sa.artista_id
ORDER BY seguidores DESC, artista LIMIT 3;

CREATE VIEW top_3_artistas AS
SELECT a.nome AS artista, COUNT(sa.usuario_id) AS seguidores
FROM artistas AS a
INNER JOIN seguindo_artistas AS sa
ON a.id = sa.artista_id
INNER JOIN usuarios as u
ON u.id = sa.usuario_id
GROUP BY artista
ORDER BY seguidores DESC, artista
LIMIT 3;

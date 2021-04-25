CREATE VIEW top_3_artistas AS
SELECT a.nome AS artista, COUNT(s.usuario_id) AS seguidores
FROM artistas AS a
INNER JOIN seguindo_artistas AS s
ON a.id = s.artista_id
INNER JOIN usuarios as u
ON u.id = s.usuario_id
GROUP BY artista
ORDER BY seguidores DESC, artista
LIMIT 3;

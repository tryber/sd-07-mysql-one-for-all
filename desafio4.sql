CREATE VIEW top_3_artistas AS
SELECT 
art.nome AS artista,
COUNT(art.nome) AS seguidores
FROM SpotifyClone.seguidores AS seg
INNER JOIN SpotifyClone.artistas AS art
ON art.artista_id = seg.artista_id
GROUP BY art.nome
ORDER BY seguidores DESC, art.nome LIMIT 3;

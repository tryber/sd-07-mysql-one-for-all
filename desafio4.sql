CREATE VIEW top_3_artistas AS
SELECT
art.nome_artista AS artista,
COUNT(seg.usuario_id) AS seguidores
FROM SpotifyClone.artista AS art
INNER JOIN SpotifyClone.seguidor AS seg
ON art.artista_id = seg.artista_id
GROUP BY artista
ORDER BY seguidores DESC
LIMIT 3;

CREATE VIEW top_3_artistas AS
SELECT artistas.artista AS artista,
COUNT(seguidores.usuario_id) AS seguidores
FROM SpotifyClone.artistas AS artistas
INNER JOIN SpotifyClone.seguidores AS seguidores ON artistas.id = seguidores.artista_id
GROUP BY seguidores.artista_id
ORDER BY seguidores DESC, artista
LIMIT 3;

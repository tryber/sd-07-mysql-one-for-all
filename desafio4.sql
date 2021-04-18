CREATE VIEW SpotifyClone.top_3_artistas AS
SELECT artista.artista AS `artista`,
COUNT(seguidores.usuario_id) AS `seguidores`
FROM SpotifyClone.artista AS artista
INNER JOIN SpotifyClone.seguidores AS seguidores
ON artista.artista_id = seguidores.artista_id
GROUP BY artista
ORDER BY seguidores DESC, artista LIMIT 3;

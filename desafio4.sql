CREATE VIEW top_3_artistas AS
SELECT t1.artista AS 'artista',
COUNT(t2.usuario_id) AS 'seguidores'
FROM SpotifyClone.artistas AS t1
INNER JOIN SpotifyClone.usuarios_artistas AS t2
ON t1.artista_id = t2.artista_id
GROUP BY t1.artista
ORDER BY 2 DESC, 1 ASC
LIMIT 3;

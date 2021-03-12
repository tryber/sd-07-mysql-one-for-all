/*referencia: Rodrigo Sudário*/
CREATE VIEW top_3_artistas AS
SELECT
a.artista AS artista,
COUNT(u.usuario) AS seguidores
FROM SpotifyClone.seguidores AS s
INNER JOIN SpotifyClone.artistas AS a ON s.artista_id = a.artista_id
INNER JOIN SpotifyClone.usuarios AS u ON s.usuario_id = u.usuario_id
GROUP BY artista
ORDER BY seguidores DESC, artista
LIMIT 3;

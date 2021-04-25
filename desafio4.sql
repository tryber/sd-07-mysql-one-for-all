CREATE VIEW top_3_artistas AS
SELECT a.artista, COUNT(ua.usuario_id) AS seguidores
FROM SpotifyClone.usuario_artista AS ua
INNER JOIN SpotifyClone.artistas AS a ON ua.artista_id = a.artista_id
GROUP BY a.artista_id
ORDER BY seguidores DESC, a.artista
LIMIT 3;

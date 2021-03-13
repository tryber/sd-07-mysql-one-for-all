CREATE VIEW top_3_artistas AS
SELECT
a.artista AS artista,
COUNT(s.usuario_id) AS seguidores
FROM
SpotifyClone.artista AS a
INNER JOIN SpotifyClone.seguindo AS s ON a.artista_id = s.artista_id
INNER JOIN SpotifyClone.usuario AS u ON s.usuario_id = u.usuario_id
GROUP BY artista
ORDER BY seguidores DESC
LIMIT 3;

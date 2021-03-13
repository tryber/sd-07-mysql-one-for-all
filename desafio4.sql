CREATE VIEW top_3_artistas AS
SELECT
a.artista AS "artista",
COUNT(u.usuario_id) AS "seguidores"
FROM SpotifyClone.artistas AS a
INNER JOIN SpotifyClone.seguindo_artistas AS u ON a.artista_id = u.artista_id
GROUP BY artista
ORDER BY seguidores DESC, artista
LIMIT 3;

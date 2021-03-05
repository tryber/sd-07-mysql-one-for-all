CREATE VIEW top_3_artistas AS
SELECT
a.nome_artista AS artista,
COUNT(f.usuario_id) AS seguidores
FROM
SpotifyClone.follow AS f
INNER JOIN
SpotifyClone.artists as a
ON
f.artista_id = a.artista_id
GROUP BY f.artista_id
ORDER BY seguidores DESC, artista
LIMIT 3;

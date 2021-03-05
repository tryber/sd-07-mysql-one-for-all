CREATE VIEW perfil_artistas AS
SELECT  a.nome_artista AS artista,
ab.nome_album AS album,
COUNT(sa.artista_id) AS seguidores
FROM SpotifyClone.albuns AS ab
INNER JOIN SpotifyClone.artistas_seguidos AS sa
ON sa.artista_id = ab.artista_id
INNER JOIN SpotifyClone.artistas AS a
ON a.id = sa.artista_id
GROUP BY ab.id
ORDER BY seguidores DESC,artista,album;

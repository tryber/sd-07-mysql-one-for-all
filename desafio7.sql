CREATE VIEW perfil_artistas AS
SELECT
a.artista AS artista,
alb.album AS album,
COUNT(s.usuario_id) AS seguidores
FROM SpotifyClone.seguidores AS s
INNER JOIN SpotifyClone.artistas AS a ON s.artista_id = a.artista_id
INNER JOIN SpotifyClone.albuns AS alb ON a.artista_id = alb.artista_id
GROUP BY artista, album
ORDER BY seguidores DESC, artista, album;

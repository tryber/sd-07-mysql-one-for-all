CREATE VIEW perfil_artistas AS
SELECT t1.artista AS 'artista',
t2.album AS 'album',
COUNT(t3.usuario_id) AS 'seguidores'
FROM SpotifyClone.artistas AS t1
INNER JOIN SpotifyClone.albuns AS t2
ON t1.artista_id = t2.artista_id
INNER JOIN SpotifyClone.usuarios_artistas AS t3
ON t2.artista_id = t3.artista_id
GROUP BY t1.artista, t2.album
ORDER BY 3 DESC, 1 ASC, 2 ASC;

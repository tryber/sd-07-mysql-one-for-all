CREATE VIEW perfil_artistas AS
SELECT
t1.nome AS 'artista',
t2.album AS 'album',
COUNT(t3.usuario_id) AS 'seguidores'
FROM
SpotifyClone.artistas AS t1
INNER JOIN
SpotifyClone.album AS t2 ON t1.artista_id = t2.artista_id
INNER JOIN
SpotifyClone.seguindo_artistas AS t3 ON t1.artista_id = t3.artista_id
GROUP BY `album`, `artista`
ORDER BY `seguidores` DESC , `artista`, `album`;

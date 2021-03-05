USE SpotifyClone;

CREATE VIEW perfil_artistas AS
SELECT
a.nome_artista AS artista,
al.nome_album AS album,
COUNT(f.usuario_id) AS seguidores
FROM
SpotifyClone.artists AS a
INNER JOIN
SpotifyClone.albums AS al
ON a.artista_id = al.artista_id
INNER JOIN
SpotifyClone.follow AS f
ON a.artista_id = f.artista_id
GROUP BY al.album_id
ORDER BY 3 DESC, 1, 2;

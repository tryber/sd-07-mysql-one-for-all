CREATE VIEW perfil_artistas AS
SELECT a.artista_nome AS artista, al.album_nome AS album, COUNT(a.artista_id) AS seguidores
FROM SpotifyClone.artistas_seguidos as ars
INNER JOIN SpotifyClone.artista AS a ON ars.artista_id = a.artista_id
INNER JOIN SpotifyClone.album AS al ON ars.artista_id = al.artista_id
GROUP BY al.album_id
ORDER BY 3 DESC, 1, 2;

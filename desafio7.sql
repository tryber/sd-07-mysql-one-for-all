CREATE VIEW SpotifyClone.perfil_artistas AS
SELECT artista.artista AS artista,
album.album AS album,
COUNT(seguidores.seguidores_id) AS seguidores
FROM SpotifyClone.artista AS artista
INNER JOIN SpotifyClone.album AS album
ON artista.artista_id = album.artista_id
INNER JOIN SpotifyClone.seguidores AS seguidores
ON artista.artista_id = seguidores.artista_id
GROUP BY album.album_id
ORDER BY 3 DESC, artista.artista, album.album;

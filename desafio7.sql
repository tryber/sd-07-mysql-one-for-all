CREATE VIEW SpotifyClone.perfil_artistas AS
SELECT artista.artista AS `artista`,
album.album AS `album`,
COUNT(seguidores.artista_id) AS `seguidores`
FROM SpotifyClone.artista AS artista
INNER JOIN SpotifyClone.album AS album
ON artista.artista_id = album.artista_id
INNER JOIN SpotifyClone.seguidores AS seguidores
ON artista.artista_id = seguidores.artista_id
GROUP BY artista, album
ORDER BY seguidores DESC, artista, album;

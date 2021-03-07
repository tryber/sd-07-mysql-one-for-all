CREATE VIEW perfil_artistas AS
SELECT
art.nome_artista AS artista,
alb.nome_album AS album,
COUNT(seg.artista_id) AS seguidores
FROM SpotifyClone.artista AS art
INNER JOIN SpotifyClone.album AS alb
ON art.artista_id = alb.artista_id
INNER JOIN SpotifyClone.seguidor as seg
ON art.artista_id = seg.artista_id
GROUP BY alb.album_id
ORDER BY seguidores DESC, artista, album;

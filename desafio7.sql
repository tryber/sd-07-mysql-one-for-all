CREATE VIEW perfil_artistas AS
SELECT
art.artista AS artista,
alb.album AS album,
COUNT(*) AS seguidores
FROM SpotifyClone.artistas AS art
JOIN albuns AS alb
ON alb.artista_id = art.artista_id
JOIN seguidores AS seg
ON seg.artista_id = art.artista_id
JOIN usuarios AS usr
ON usr.usuario_id = seg.usuario_id
GROUP BY artista, album
ORDER BY
seguidores DESC,
artista,
album;

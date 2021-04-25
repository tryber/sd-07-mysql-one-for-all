CREATE VIEW perfil_artistas AS
SELECT
art.nome AS artista,
alb.album AS album,
COUNT(i.artista_id) AS seguidores
FROM SpotifyClone.artistas AS art
INNER JOIN SpotifyClone.albuns AS alb ON art.artista_id = alb.artista_id
INNER JOIN SpotifyClone.inscricoes AS i ON i.artista_id = art.artista_id
GROUP BY album, artista
ORDER BY seguidores DESC, artista, album;

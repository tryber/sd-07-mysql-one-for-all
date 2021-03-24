CREATE VIEW perfil_artistas AS
SELECT 
art.nome AS artista,
alb.nome AS album,
COUNT(seg.artista_id) AS seguidores
FROM SpotifyClone.artistas AS art
INNER JOIN SpotifyClone.seguidores AS seg
ON art.artista_id = seg.artista_id
INNER JOIN SpotifyClone.albuns AS alb
ON art.artista_id = alb.artista_id
GROUP BY seg.artista_id, alb.nome
ORDER BY seguidores DESC, artista, album;

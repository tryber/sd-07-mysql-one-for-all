CREATE VIEW perfil_artistas AS 
SELECT 
art.artista, alb.album, COUNT(sa.usuario_id) AS seguidores
FROM SpotifyClone.seguindo_artistas AS sa
INNER JOIN SpotifyClone.artistas AS art ON art.artista_id = sa.artista_id
INNER JOIN SpotifyClone.albuns AS alb ON alb.artista_id = sa.artista_id
GROUP BY art.artista, alb.album ORDER BY seguidores DESC, artista, album;

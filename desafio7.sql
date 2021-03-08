CREATE VIEW perfil_artistas AS
SELECT ART.nome AS artista, ALB.album AS album,  COUNT(S.usuario_id) AS seguidores 
FROM SpotifyClone.artistas ART
INNER JOIN SpotifyClone.albuns ALB
ON ART.artista_id = ALB.artista_id
INNER JOIN SpotifyClone.seguindo S
ON ALB.artista_id = S.artista_id
GROUP BY 2
ORDER BY 3 DESC, 1, 2;

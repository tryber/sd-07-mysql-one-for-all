CREATE VIEW perfil_artistas AS
SELECT ART.nome_artista artista,
ALB.nome_album album,
COUNT(SEG.artista_id) seguidores
FROM SpotifyClone.artistas ART
INNER JOIN SpotifyClone.seguindo SEG
ON ART.artista_id = SEG.artista_id
INNER JOIN SpotifyClone.album ALB
ON ART.artista_id = ALB.artista_id
GROUP BY ART.nome_artista, ALB.nome_album
ORDER BY COUNT(SEG.artista_id) DESC, ART.nome_artista;

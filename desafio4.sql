CREATE VIEW top_3_artistas AS

SELECT ART.nome_artista artista,
COUNT(SEG.usuario_id) seguidores
FROM SpotifyClone.artistas ART
INNER JOIN SpotifyClone.seguindo SEG
ON ART.artista_id = SEG.artista_id
GROUP BY ART.nome_artista
ORDER BY COUNT(SEG.usuario_id) DESC, ART.nome_artista
LIMIT 3;

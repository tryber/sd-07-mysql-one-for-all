CREATE VIEW top_3_artistas AS
SELECT 
artistas.artista AS artista,
COUNT(usuario_id) AS seguidores
FROM SpotifyClone.artistas AS artistas
INNER JOIN SpotifyClone.artistas_seguidos AS artistas_seguidos
ON artistas.artista_id = artistas_seguidos.artista_id
GROUP BY artista
ORDER BY seguidores DESC, artista
LIMIT 3;

CREATE VIEW top_3_artistas AS
SELECT 
art.artista AS artista,
COUNT(*) AS seguidores
FROM SpotifyClone.artistas AS art
JOIN SpotifyClone.seguidores AS seg
ON seg.artista_id = art.artista_id
GROUP BY artista
ORDER BY seguidores DESC,
artista
LIMIT 3;

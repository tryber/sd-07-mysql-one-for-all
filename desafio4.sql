CREATE VIEW top_3_artistas AS 
SELECT a.nome_do_artista as artista, COUNT(s.artista_id) as seguidores
FROM SpotifyClone.artista as a
INNER JOIN SpotifyClone.seguidores as s
ON a.artista_id = s.artista_id
GROUP BY a.nome_do_artista
ORDER BY 2 DESC, 1 LIMIT 3;

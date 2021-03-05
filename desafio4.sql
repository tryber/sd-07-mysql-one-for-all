CREATE VIEW top_3_artistas AS
SELECT a.nome AS artista, COUNT(i.artista_id) AS seguidores
FROM SpotifyClone.artistas AS a
INNER JOIN SpotifyClone.inscricoes AS i ON a.artista_id = i.artista_id
GROUP BY artista
ORDER BY seguidores DESC, artista
LIMIT 3;

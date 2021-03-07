CREATE VIEW top_3_artistas AS
SELECT A.artista_nome AS artista, 
COUNT(S.fk_artista_id) AS seguidores
FROM Artistas as A
INNER JOIN Artistas_Seguidores As S
ON S.fk_artista_id = A.artista_id
GROUP BY artista
ORDER BY seguidores DESC, artista ASC
LIMIT 3;

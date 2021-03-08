CREATE VIEW top_3_artistas AS
SELECT A.nome AS artista, COUNT(S.usuario_id) AS seguidores FROM SpotifyClone.artistas A
INNER JOIN SpotifyClone.seguindo S
ON A.artista_id = S.artista_id
GROUP BY A.nome
ORDER BY 2 DESC, 1 LIMIT 3;

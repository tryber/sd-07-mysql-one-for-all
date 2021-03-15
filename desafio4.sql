CREATE VIEW top_3_artistas AS
SELECT A.artista_nome AS artista, COUNT(S.usuario_id) AS seguidores FROM SpotifyClone.artistas AS A
INNER JOIN SpotifyClone.seguindo AS S
ON A.artista_id = S.artista_id
GROUP BY A.artista_nome
ORDER BY 2 DESC, 1 LIMIT 3;

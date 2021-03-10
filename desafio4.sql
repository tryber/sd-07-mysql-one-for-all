CREATE VIEW top_3_artistas AS
SELECT A.nome as artista,
COUNT(UA.usuario_id) AS seguidores
FROM SpotifyClone.usuarios_artistas AS UA
INNER JOIN SpotifyClone.artistas AS A ON UA.artista_id = A.artista_id
GROUP BY UA.artista_id
HAVING seguidores >= 2
ORDER BY seguidores DESC;

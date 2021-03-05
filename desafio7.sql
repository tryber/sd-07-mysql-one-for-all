CREATE VIEW perfil_artistas AS
SELECT
a.nome AS artista,
al.nome AS album,
COUNT(sa.artista_id) AS seguidores
FROM seguindo_artista sa
INNER JOIN artista a ON a.artista_id = sa.artista_id
INNER JOIN album al ON al.artista_id = a.artista_id
GROUP BY al.album_id
ORDER BY seguidores DESC, artista, album;

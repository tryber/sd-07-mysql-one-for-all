CREATE VIEW perfil_artistas AS
SELECT a.nome AS artista,
al.nome AS album,
COUNT(sa.artista_id) AS seguidores
FROM SpotifyClone.seguindo_artistas AS sa
INNER JOIN SpotifyClone.artistas AS a
ON sa.artista_id = a.artista_id
INNER JOIN SpotifyClone.albuns AS al
ON al.artista_id = a.artista_id
GROUP BY sa.artista_id, al.nome
ORDER BY seguidores DESC, artista, album;

CREATE VIEW perfil_artistas AS
SELECT a.nome AS artista, albuns.nome AS album, COUNT(sa.usuario_id) AS seguidores
FROM artistas AS a
INNER JOIN albums as albuns
ON albuns.artista_id = a.id
INNER JOIN seguindo_artistas AS sa
ON a.id = sa.artista_id
INNER JOIN usuarios as u
ON u.id = sa.usuario_id
GROUP BY artista, album
ORDER BY seguidores DESC, artista, album;

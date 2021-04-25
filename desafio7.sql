CREATE VIEW perfil_artistas AS
SELECT a.nome AS artista, al.nome AS album, COUNT(s.usuario_id) AS seguidores
FROM artistas AS a
INNER JOIN albums as al
ON al.artista_id = a.id
INNER JOIN seguindo_artistas AS s
ON a.id = s.artista_id
INNER JOIN usuarios as u
ON u.id = s.usuario_id
GROUP BY artista, album
ORDER BY seguidores DESC, artista, album;

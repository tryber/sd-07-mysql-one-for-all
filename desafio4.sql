CREATE VIEW top_3_artistas AS
SELECT CONCAT(A.nome, ' ', A.sobrenome) artista, COUNT(B.usuario_id) seguidores
FROM SpotifyClone.artistas A, SpotifyClone.seguindo_artistas B
WHERE A.artista_id=B.artista_id
GROUP BY B.artista_id
ORDER BY seguidores DESC
LIMIT 3;

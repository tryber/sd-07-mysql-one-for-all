CREATE VIEW perfil_artistas AS
SELECT CONCAT(A.nome, ' ', A.sobrenome) artista,
B.album album, COUNT(C.usuario_id) seguidores
FROM SpotifyClone.artistas A, SpotifyClone.albuns B, SpotifyClone.seguindo_artistas C
WHERE A.artista_id=B.artista_id AND C.artista_id=A.artista_id
GROUP BY A.artista_id, B.album_id
ORDER BY seguidores DESC, artista, album;

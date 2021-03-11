CREATE VIEW perfil_artistas AS
SELECT A.nome AS artista,
AL.titulo AS album,
COUNT(UA.usuario_id) AS seguidores
FROM SpotifyClone.artistas AS A
INNER JOIN SpotifyClone.usuarios_artistas AS UA ON A.artista_id = UA.artista_id
INNER JOIN SpotifyClone.albuns AS AL ON A.artista_id = AL.artista_id
GROUP BY UA.artista_id, AL.titulo
ORDER BY seguidores DESC, artista, album;

CREATE VIEW perfil_artistas AS
SELECT artistas.artista AS artista,
albuns.album AS album,
COUNT(seguidores.usuario_id) AS seguidores
FROM SpotifyClone.artistas AS artistas
INNER JOIN SpotifyClone.albuns AS albuns ON artistas.id = albuns.artista_id
INNER JOIN SpotifyClone.seguidores AS seguidores ON seguidores.artista_id = artistas.id
GROUP BY seguidores.artista_id, albuns.album
ORDER BY `seguidores` DESC, `artista`, `album`;

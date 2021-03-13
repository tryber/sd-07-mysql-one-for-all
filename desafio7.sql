CREATE VIEW perfil_artistas AS
SELECT ar.artista_name AS "artista",
album AS "album",
COUNT(sa.usuario_id) AS "seguidores"
FROM SpotifyClone.artistas AS ar
INNER JOIN SpotifyClone.albuns AS al
ON ar.artista_id = al.artista_id
INNER JOIN SpotifyClone.seguindo_artistas AS sa
ON ar.artista_id = sa.artista_id
GROUP BY 2, 1
ORDER BY 3 DESC, 1, 2;

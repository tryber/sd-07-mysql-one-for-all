CREATE VIEW perfil_artistas AS
SELECT
artistas.artista AS artista,
albuns.album AS album,
COUNT(seguindo.usuario_id) AS seguidores
FROM SpotifyClone.artistas AS artistas
INNER JOIN SpotifyClone.albuns AS albuns
ON artistas.artista_id = albuns.artista_id
INNER JOIN SpotifyClone.artistas_seguidos AS seguindo
ON seguindo.artista_id = artistas.artista_id
GROUP BY artistas.artista_id, albuns.album_id
ORDER BY seguidores DESC, artista, album;

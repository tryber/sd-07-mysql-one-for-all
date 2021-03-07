CREATE VIEW perfil_artistas AS
SELECT
ar.artist AS artista,
al.album AS album,
(SELECT COUNT(fo.artist_id) FROM SpotifyClone.folowers AS fo WHERE fo.artist_id = ar.artist_id) AS seguidores
FROM SpotifyClone.albuns AS al
INNER JOIN SpotifyClone.artists AS ar ON al.artist_id = ar.artist_id
ORDER BY seguidores DESC, artista, album;

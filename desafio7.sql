CREATE VIEW perfil_artistas AS
SELECT
ar.artist AS artista,
al.album AS album,
COUNT(f.artist_id) AS seguidores
FROM SpotifyClone.artists ar

INNER JOIN SpotifyClone.albums al
ON al.artist_id = ar.artist_id

INNER JOIN SpotifyClone.followers f
ON f.artist_id = ar.artist_id

INNER JOIN SpotifyClone.users u
ON u.user_id = f.user_id

GROUP BY f.artist_id, album
ORDER BY seguidores DESC, artista, album;

CREATE VIEW perfil_artistas AS
SELECT c.artist_name AS "artista",
a.album_name AS "album",
COUNT(DISTINCT(f.user_id)) AS "seguidores"
FROM SpotifyClone.artist AS c
INNER JOIN SpotifyClone.following_artists AS f
ON f.artist_id = c.artist_id
INNER JOIN SpotifyClone.album AS a
ON a.artist_id = c.artist_id
GROUP BY a.album_id
ORDER BY COUNT(DISTINCT(f.user_id)) DESC, c.artist_name ASC, a.album_name ASC;

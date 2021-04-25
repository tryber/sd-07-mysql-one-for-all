CREATE VIEW top_3_artistas AS
SELECT a.artist_name AS "artista",
COUNT(f.user_id) AS "seguidores"
FROM SpotifyClone.artist AS a
INNER JOIN SpotifyClone.following_artists AS f
ON f.artist_id = a.artist_id
GROUP BY a.artist_id
ORDER BY COUNT(f.user_id) DESC, a.artist_name ASC
LIMIT 3;

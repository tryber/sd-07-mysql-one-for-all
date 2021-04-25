CREATE VIEW top_3_artistas AS
SELECT art.name_artists AS "artista",
COUNT(follow.user_id) AS "seguidores"
FROM SpotifyClone.artists AS art
INNER JOIN SpotifyClone.follow AS follow
ON art.artist_id = follow.artist_id
GROUP BY `artista`
ORDER BY `seguidores` DESC, `artista`
LIMIT 3;

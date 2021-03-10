CREATE VIEW top_3_artistas AS
SELECT artists.name AS "artista",
COUNT(following.artist_id) AS `seguidores`
FROM SpotifyClone.artists AS artists
INNER JOIN SpotifyClone.following AS following 
ON following.artist_id = artists.id
GROUP BY artists.name
ORDER BY `seguidores` DESC
LIMIT 3;

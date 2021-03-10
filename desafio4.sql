CREATE VIEW top_3_artistas AS
SELECT artists.name AS "artistas",
COUNT(following.artist_id) AS `seguidores`
FROM spotifyclone.artists AS artists
INNER JOIN spotifyclone.following AS following 
ON following.artist_id = artists.id
GROUP BY artists.name
ORDER BY `seguidores` DESC
LIMIT 3;
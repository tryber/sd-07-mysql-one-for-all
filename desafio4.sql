CREATE VIEW top_3_artistas AS
SELECT CONCAT(art.first_name,' ', art.last_name) AS 'artista', COUNT(u.user_id) AS 'seguidores'
FROM artist art
INNER JOIN user_artist ua ON ua.artist_id = art.artist_id
INNER JOIN user u ON u.user_id = ua.user_id
GROUP BY art.artist_id
ORDER BY 2 DESC
LIMIT 3;

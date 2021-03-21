CREATE VIEW perfil_artistas AS;
SELECT
CONCAT(art.first_name,' ',art.last_name) AS 'artista', alb.`name` AS 'album',
COUNT(ua.artist_id) AS 'seguidores'
FROM artist art
INNER JOIN album alb ON alb.artist_id = art.artist_id
INNER JOIN user_artist ua ON ua.artist_id = art.artist_id
GROUP BY 2, 1
ORDER BY 3 DESC, 1, 2;

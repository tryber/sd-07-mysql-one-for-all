CREATE VIEW top_3_artistas AS 
SELECT ARTISTA.artist_name AS 'artista', 
COUNT(SEGUIDORES.user_id) AS 'seguidores' 
FROM SpotifyClone.artist AS ARTISTA
INNER JOIN SpotifyClone.follewed_artist AS SEGUIDORES
ON SEGUIDORES.artist_id = ARTISTA.id
GROUP BY ARTISTA.id
ORDER BY COUNT(SEGUIDORES.user_id) DESC,  ARTISTA.artist_name limit 3;

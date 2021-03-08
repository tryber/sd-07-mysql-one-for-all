CREATE VIEW top_3_artistas AS 
SELECT ART.artist_name AS artista,
COUNT(UF.user_id) AS seguidores
FROM SpotifyClone.artists AS ART
JOIN SpotifyClone.users_follow_artists AS UF ON ART.artist_id = UF.artist_id
GROUP BY ART.artist_id
ORDER BY seguidores DESC, artista
LIMIT 3;

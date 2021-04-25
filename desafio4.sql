CREATE VIEW top_3_artistas AS
SELECT A.artist_name AS artista,
COUNT(UA.user_id) AS seguidores
FROM SpotifyClone.artists AS A
JOIN SpotifyClone.users_follow_artists AS UA ON A.artist_id = UA.artist_id
GROUP BY A.artist_id
ORDER BY seguidores DESC, artista
LIMIT 3;

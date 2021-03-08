CREATE VIEW perfil_artistas AS 
SELECT ART.artist_name AS artista,
ALB.album_name AS album,
COUNT(ALB.album_id)AS seguidores
FROM SpotifyClone.albums ALB
JOIN SpotifyClone.artists ART ON ALB.artist_id = ART.artist_id
JOIN SpotifyClone.users_follow_artists UFA ON UFA.artist_id = ALB.artist_id
GROUP BY ALB.album_id
ORDER BY seguidores DESC, artista, album;

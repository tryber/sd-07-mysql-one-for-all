CREATE VIEW perfil_artistas AS
SELECT AR.artist_name AS artista,
AL.album_name as album,
COUNT(AL.album_id) AS seguidores
FROM SpotifyClone.albums AL
JOIN SpotifyClone.artists AR ON AL.artist_id = AR.artist_id
JOIN SpotifyClone.users_follow_artists FA ON FA.artist_id = AL.artist_id
GROUP BY AL.album_id
ORDER BY seguidores DESC, artista, album;

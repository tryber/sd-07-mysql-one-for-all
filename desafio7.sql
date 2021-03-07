CREATE VIEW perfil_artistas AS
SELECT a.name AS artista, ab.album_name AS album,
COUNT(f.artist_id) AS seguidores
FROM SpotifyClone.followers AS f
JOIN SpotifyClone.artists AS a ON a.artist_id = f.artist_id
JOIN SpotifyClone.albums AS ab ON ab.artist_id = a.artist_id
GROUP BY a.name, ab.album_name
ORDER BY seguidores DESC;

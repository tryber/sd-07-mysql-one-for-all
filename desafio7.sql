CREATE VIEW perfil_artistas AS 
SELECT ARTISTA.artist_name AS 'artista', 
ALBUM.album_title AS 'album',
COUNT(ALBUM.id) AS 'seguidores'
FROM SpotifyClone.artist AS ARTISTA
INNER JOIN SpotifyClone.album AS ALBUM
ON ALBUM.artist_id = ARTISTA.id
INNER JOIN SpotifyClone.follewed_artist AS SEGUIDORES
ON SEGUIDORES.artist_id = ARTISTA.id
GROUP BY ALBUM.id
ORDER BY COUNT(ALBUM.id) DESC, ARTISTA.artist_name;

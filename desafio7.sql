CREATE VIEW SpotifyClone.perfil_artistas AS
SELECT 
a.name AS 'artista',
al.name AS 'album',
COUNT(al.id) AS 'seguidores'
FROM SpotifyClone.artists a
INNER JOIN SpotifyClone.albums al ON al.artist_id = a.id
INNER JOIN SpotifyClone.follow f ON f.artist_id = a.id
GROUP BY al.id
ORDER BY  seguidores DESC, artista, album;

CREATE VIEW perfil_artistas AS
SELECT A.name AS 'artista',
CD.name AS 'album',
COUNT(CD.id) AS 'seguidores'
FROM SpotifyClone.albuns AS CD
INNER JOIN SpotifyClone.artist AS A
ON CD.artist_id = A.id
INNER JOIN SpotifyClone.artist_followers AS F
ON F.artist_id = CD.artist_id
GROUP BY CD.id
ORDER BY 3 DESC, 1, 2

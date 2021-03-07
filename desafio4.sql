CREATE VIEW top_3_artistas
AS SELECT sin.sin_name AS 'artista',
COUNT(fol.sin_id) AS 'seguidores'
FROM SpotifyClone.Followings AS fol
INNER JOIN SpotifyClone.Singers AS sin ON sin.sin_id = fol.sin_id
GROUP BY artista
ORDER BY seguidores DESC, artista
LIMIT 3;

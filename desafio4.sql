CREATE VIEW top_3_artistas AS
SELECT
A.artista AS 'artista',
COUNT(S.artista_id) AS 'seguidores'
FROM SpotifyClone.artistas AS A
INNER JOIN SpotifyClone.seguindo AS S
ON A.artista_id = S.artista_id
GROUP BY A.artista
ORDER BY `seguidores` DESC, `artista` DESC
LIMIT 3;

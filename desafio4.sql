CREATE VIEW top_3_artistas AS
SELECT artist.artista AS artista,
COUNT(following.artista_id) AS seguidores
FROM SpotifyClone.seguindo AS `following`
INNER JOIN SpotifyClone.artistas AS artist
ON following.artista_id = artist.artista_id
GROUP BY following.artista_id
ORDER BY seguidores DESC, artista
LIMIT 3;

CREATE VIEW top_3_artistas AS 
SELECT
a.artista_name AS `artista`,
COUNT(s.usuario_id) AS `seguidores`
FROM SpotifyClone.Artista AS `a`
INNER JOIN SpotifyClone.Artista_Seguidos AS `s`
ON a.artista_id = s.artista_id
GROUP BY `artista`
ORDER BY `seguidores` DESC, `artista`;

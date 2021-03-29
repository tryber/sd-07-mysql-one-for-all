CREATE VIEW `top_3_artistas` AS SELECT
A.artista AS `artista`,
COUNT(S.artista_id) AS `seguidores`
FROM SpotifyClone.artistas as A
INNER JOIN SpotifyClone.seguidores As S ON S.artista_id = A.artista_id
GROUP BY `artista`
ORDER BY `seguidores` DESC, `artista` ASC
LIMIT 3;

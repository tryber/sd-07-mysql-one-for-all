CREATE VIEW top_3_artistas AS 
SELECT t1.name AS `artista`, COUNT(t2.following) AS `seguidores`
FROM artists AS t1
INNER JOIN following AS t2
WHERE t1.name = t2.following
GROUP BY `artista`
ORDER BY `seguidores` DESC, `artista`
LIMIT 3;

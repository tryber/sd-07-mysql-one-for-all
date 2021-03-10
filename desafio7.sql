-- CREATE VIEW faturamento_atual AS 
SELECT t1.artist AS `artist`, t1.cover AS `album`, COUNT(t2.following) AS `seguidores`
FROM covers AS t1
INNER JOIN following as t2
ON t1.artist = t2.following
GROUP BY `album`
ORDER BY `seguidores` DESC, `artist`, `album`;

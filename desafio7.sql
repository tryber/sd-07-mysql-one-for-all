DROP VIEW IF EXISTS perfil_artistas;
CREATE VIEW perfil_artistas AS SELECT t1.artist AS `artista`, t1.cover AS `album`, COUNT(t2.following) AS `seguidores`
FROM covers AS t1
INNER JOIN following as t2
ON t1.artist = t2.following
GROUP BY `album`
ORDER BY `seguidores` DESC, `artista`, `album`;

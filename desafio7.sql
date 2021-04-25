CREATE VIEW perfil_artistas AS 
SELECT
a.artista_name AS `artista`,
al.album_name AS `album`,
COUNT(s.usuario_id) AS `seguidores`
FROM SpotifyClone.Artista AS `a`
INNER JOIN SpotifyClone.Albuns AS `al`
ON a.artista_id = al.artista_id
INNER JOIN SpotifyClone.Artista_Seguidos AS `s`
ON a.artista_id = s.artista_id
GROUP BY  `artista`, `album`
ORDER BY `seguidores` DESC, `artista`, `album`;

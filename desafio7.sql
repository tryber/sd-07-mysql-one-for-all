CREATE VIEW `perfil_artistas` AS SELECT
ART.artista AS `artista`,
ALB.album AS `album`,
COUNT(SEG.usuario_id) AS `seguidores`
FROM SpotifyClone.artistas AS ART
INNER JOIN SpotifyClone.seguidores AS SEG ON SEG.artista_id = ART.artista_id
INNER JOIN SpotifyClone.albuns AS ALB ON ALB.artista_id =  SEG.artista_id
GROUP BY `artista`, `album`
ORDER BY `seguidores` DESC, `artista` ASC, `album` ASC;

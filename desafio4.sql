CREATE VIEW top_3_artistas AS 
SELECT a.nome "artista", COUNT(ua.seguindo_artista) "seguidores" FROM SpotifyClone.artistas AS a
INNER JOIN SpotifyClone.usuario_artista AS ua ON ua.seguindo_artista = a.artista_id
GROUP BY a.nome
ORDER BY `seguidores` DESC, `artista`
LIMIT 3;
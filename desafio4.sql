CREATE VIEW top_3_artistas AS
SELECT AR.nome_artista AS 'artista',
COUNT(S.id_usuario) AS 'seguidores'
FROM SpotifyClone.artistas AS AR
INNER JOIN SpotifyClone.seguidores AS S ON S.id_artista = AR.id_artista
GROUP BY `artista`
ORDER BY `seguidores` DESC, `artista`
LIMIT 3;

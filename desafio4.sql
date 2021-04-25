CREATE VIEW top_3_artistas AS
SELECT AR.nome_artista AS `artista`,
COUNT(S.id_artista) AS `seguidores`
FROM SpotifyClone.artista AS AR,
SpotifyClone.seguidores AS S
WHERE AR.id_artista = S.id_artista
GROUP BY `artista`
ORDER BY `seguidores` DESC, `artista`
LIMIT 3;

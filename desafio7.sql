CREATE VIEW perfil_artistas AS
SELECT AR.nome_artista AS `artista`,
AL.nome_album AS `album`,
COUNT(S.id_artista) AS `seguidores`
FROM SpotifyClone.artista AS AR
INNER JOIN SpotifyClone.seguidores AS S ON AR.id_artista = S.id_artista
INNER JOIN SpotifyClone.album AS AL ON AL.id_artista = AR.id_artista
GROUP BY `album`, S.id_artista
ORDER BY `seguidores` DESC, `artista`, `album`;

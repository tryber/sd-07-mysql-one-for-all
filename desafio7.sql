CREATE VIEW perfil_artistas AS
SELECT AR.nome_artista AS 'artista',
AB.nome_album AS 'album',
COUNT(S.id_usuario) AS 'seguidores'
FROM SpotifyClone.artistas AS AR
INNER JOIN SpotifyClone.albuns AS AB ON AB.id_artista = AR.id_artista
INNER JOIN SpotifyClone.seguidores AS S ON S.id_artista = AR.id_artista
GROUP BY AB.id_album
ORDER BY `seguidores` DESC, `artista`, `album`;

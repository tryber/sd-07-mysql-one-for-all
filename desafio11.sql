CREATE VIEW cancoes_premium AS
SELECT
	M.name_song AS 'nome',
    COUNT(UM.usuario_idusuario) AS 'reproducoes'
FROM SpotifyClone.usuario_musicas UM
JOIN SpotifyClone.musicas M ON UM.musicas_idmusicas = M.idmusicas
JOIN SpotifyClone.usuario U ON U.idusuario =  UM.usuario_idusuario
WHERE U.planos_idplanos >= 2
GROUP BY M.name_song
ORDER BY M.name_song;
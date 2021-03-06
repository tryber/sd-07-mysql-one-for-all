CREATE VIEW perfil_artistas AS
SELECT
	AR.name_singer AS `artista`,
    AL.name_album AS `album`,
    COUNT(UA.usuario_idusuario) AS 'seguidores'
FROM SpotifyClone.usario_artistas UA
JOIN SpotifyClone.artistas AR ON AR.idartistas = UA.artistas_idartistas
JOIN SpotifyClone.album AL ON AL.artistas_idartistas = AR.idartistas
GROUP BY `artista`, `album`
ORDER BY COUNT(UA.usuario_idusuario) DESC, AR.name_singer, AL.name_album;
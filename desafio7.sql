CREATE VIEW perfil_artistas AS
SELECT art.name_artists AS "artista",
alb.name_album AS "album",
COUNT(alb.album_id) AS "seguidores"
FROM SpotifyClone.artists AS art
INNER JOIN SpotifyClone.albums AS alb
ON art.artist_id = alb.artist_id
INNER JOIN SpotifyClone.follow AS fol
ON art.artist_id = fol.artist_id
GROUP BY alb.album_id
ORDER BY `seguidores` DESC, `artista`, `album`;

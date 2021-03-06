CREATE VIEW perfil_artistas AS
SELECT sin.name_singer AS artista, 
a.name_album AS album,
COUNT(a.album_id) AS seguidores
FROM SpotifyClone.singers AS sin
INNER JOIN SpotifyClone.album AS a
ON a.singer_id = sin.singer_id
INNER JOIN SpotifyClone.following_artist AS f
ON f.singer_id = sin.singer_id
GROUP BY a.album_id
ORDER BY `seguidores` DESC, `artista`, `album`;

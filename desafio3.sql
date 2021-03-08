CREATE VIEW historico_reproducao_usuarios AS
SELECT us.name_users AS "usuario",
song.name_songs AS "nome"
FROM SpotifyClone.users AS us
INNER JOIN SpotifyClone.reproductions AS hist
ON us.user_id = hist.user_id
INNER JOIN SpotifyClone.songs AS song
ON hist.songs_id = song.songs_id
ORDER BY `usuario`, `nome`;

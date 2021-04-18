CREATE VIEW historico_reproducao_usuarios AS
SELECT u.`name` AS `usuario`,
s.song as `nome`
FROM SpotifyClone.users u
INNER JOIN SpotifyClone.`history` h ON u.user_id = h.user_id
INNER JOIN SpotifyClone.songs s ON h.song_id = s.song_id
order by `usuario`, `nome`;
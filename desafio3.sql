CREATE VIEW historico_reproducao_usuarios AS
SELECT
u.uname AS `usuario`,
s.song AS `nome`
FROM SpotifyClone.histories AS h
INNER JOIN SpotifyClone.users AS u
ON h.user_id = u.user_id
INNER JOIN SpotifyClone.songs AS s
ON h.song_id = s.song_id
ORDER BY `usuario` ASC,`nome` ASC;

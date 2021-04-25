CREATE VIEW historico_reproducao_usuarios AS
SELECT
u.user_name AS usuario,
s.song AS nome
FROM SpotifyClone.users u

INNER JOIN SpotifyClone.playbacks p
ON u.user_id = p.user_id

INNER JOIN SpotifyClone.songs s
ON p.song_id = s.song_id

ORDER BY usuario, nome;

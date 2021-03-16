CREATE VIEW historico_reproducao_usuarios AS
SELECT
u.user_name AS usuario,
s.song_title AS nome
FROM SpotifyClone.plays p
INNER JOIN SpotifyClone.users u ON u.user_id = p.user_id
INNER JOIN SpotifyClone.songs s ON s.song_id = p.song_id
order by 1,2;
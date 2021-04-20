CREATE VIEW SpotifyClone.historico_reproducao_usuarios AS
SELECT
u.name AS usuario,
s.name AS nome
FROM SpotifyClone.users u
INNER JOIN SpotifyClone.history h ON u.id = h.user_id
INNER JOIN SpotifyClone.songs s ON h.song_id = s.id
ORDER BY u.name, s.name;

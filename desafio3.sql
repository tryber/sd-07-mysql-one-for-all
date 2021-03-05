USE SpotifyClone;
CREATE VIEW historico_reproducao_usuarios AS
SELECT u.name AS usuario, s.song_name AS nome
FROM SpotifyClone.users AS u,
SpotifyClone.songs AS s,
SpotifyClone.reproduction_history AS h
WHERE u.user_id = h.user_id
AND s.song_id = h.song_id
ORDER BY u.name, s.song_name;

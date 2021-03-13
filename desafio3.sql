CREATE VIEW historico_reproducao_usuarios AS
SELECT u.user_name AS "usuario",
s.song_name AS "nome"
FROM SpotifyClone.user AS u
INNER JOIN SpotifyClone.reproduction_history AS h
ON h.user_id = u.user_id
INNER JOIN SpotifyClone.song AS s
ON h.song_id = s.song_id
ORDER BY u.user_name ASC, s.song_name ASC;

CREATE VIEW SpotifyClone.historico_reproducao_usuarios AS
SELECT user.name AS usuario,
songs.name AS nome
FROM SpotifyClone.user AS user
INNER JOIN SpotifyClone.rep_history AS hist
ON hist.user_id = user.id
INNER JOIN SpotifyClone.songs AS songs
ON songs.id = hist.song_id
ORDER BY 1, 2;

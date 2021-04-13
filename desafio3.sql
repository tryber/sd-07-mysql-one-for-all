CREATE VIEW historico_reproducao_usuarios AS
SELECT
users.user_name 'usuario', songs.song_title 'nome'
FROM SpotifyClone.play_history p_history
LEFT JOIN SpotifyClone.users users
ON p_history.user_id = users.user_id
LEFT JOIN SpotifyClone.songs songs
ON p_history.song_id = songs.song_id
ORDER BY users.user_name, songs.song_title;

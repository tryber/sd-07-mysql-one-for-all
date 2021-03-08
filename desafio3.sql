CREATE VIEW historico_reproducao_usuarios AS 
SELECT user_name AS usuario, song_name AS nome
FROM SpotifyClone.users_history_songs AS HIS
JOIN SpotifyClone.users US ON HIS.user_id = US.user_id
JOIN SpotifyClone.songs SON ON HIS.song_id = SON.song_id
ORDER BY usuario, nome;

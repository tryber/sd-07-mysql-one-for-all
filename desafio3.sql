CREATE VIEW historico_reproducao_usuarios AS
SELECT U.user_name AS usuario, S.song_name AS nome
FROM SpotifyClone.users_history_songs H
JOIN SpotifyClone.songs S ON H.song_id = S.song_id
JOIN SpotifyClone.users U ON H.user_id = U.user_id
ORDER BY usuario, nome;

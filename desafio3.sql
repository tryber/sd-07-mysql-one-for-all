CREATE VIEW historico_reproducao_usuarios AS
SELECT
USERS.name AS usuario,
SONGS.title AS nome

FROM SpotifyClone.users AS USERS
INNER JOIN SpotifyClone.users_history HISTORY ON HISTORY.user_history_id = USERS.user_id
INNER JOIN SpotifyClone.songs SONGS ON SONGS.song_id = HISTORY.song_history_id
ORDER BY usuario ASC, nome ASC;

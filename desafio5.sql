CREATE VIEW top_2_hits_do_momento AS
SELECT
SONGS.title AS cancao,
COUNT(HISTORY.user_history_id) AS reproducoes

FROM SpotifyClone.songs AS SONGS
INNER JOIN SpotifyClone.users_history AS HISTORY ON HISTORY.song_history_id = SONGS.song_id
GROUP BY HISTORY.song_history_id
ORDER BY reproducoes DESC, cancao ASC
LIMIT 2;

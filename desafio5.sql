CREATE VIEW top_2_hits_do_momento AS 
SELECT SONG.song_name AS cancao,
COUNT(UHS.song_id) AS reproducoes
FROM SpotifyClone.users_history_songs AS UHS
JOIN SpotifyClone.songs SONG ON SONG.song_id = UHS.song_id 
GROUP BY SONG.song_id
ORDER BY reproducoes DESC, cancao
LIMIT 2;

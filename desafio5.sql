CREATE VIEW top_2_hits_do_momento AS
SELECT S.songs_name as cancao,
COUNT(H.song_id) AS reproducoes
FROM SpotifyClone.users_history_songs H
JOIN SpotifyClone.songsS ON S.song_id = H.song_id
GROUP BY S.song_id
ORDER BY reproducoes DESC, cancao
LIMIT 2;

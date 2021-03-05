CREATE VIEW top_2_hits_do_momento AS 
SELECT
  musical_track.name AS "cancao",
  COUNT(user_history_songs.songs_id) AS reproducoes
FROM SpotifyClone.musical_track
JOIN SpotifyClone.user_history_songs
ON user_history_songs.songs_id = musical_track.id
GROUP BY user_history_songs.songs_id
ORDER BY reproducoes DESC, cancao LIMIT 2;

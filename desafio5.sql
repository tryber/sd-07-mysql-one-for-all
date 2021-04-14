CREATE VIEW top_2_hits_do_momento AS
SELECT
songs.song_title 'cancao', COUNT(p_history.song_id) 'reproducoes'
FROM
SpotifyClone.play_history p_history
INNER JOIN SpotifyClone.songs songs
ON p_history.song_id = songs.song_id
GROUP BY p_history.song_id
ORDER BY `reproducoes` DESC, `cancao`
LIMIT 2;

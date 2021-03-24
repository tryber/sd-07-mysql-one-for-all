CREATE VIEW top_2_hits_do_momento AS
SELECT S.name AS 'cancao',
COUNT(H.song_id) AS 'reproducoes'
FROM SpotifyClone.songs AS S
INNER JOIN SpotifyClone.music_play_history AS H
ON S.id = H.song_id
GROUP BY H.song_id
ORDER BY 2 DESC, 1 LIMIT 2;

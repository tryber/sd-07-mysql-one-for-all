CREATE VIEW top_2_hits_do_momento AS 
SELECT s.`name` AS 'cancao', COUNT(usr.song_id) AS 'reproducoes'
FROM songs s
INNER JOIN user_songs_reproduction usr ON usr.song_id = s.song_id
GROUP BY usr.song_id
ORDER BY 2 DESC, 1
LIMIT 2;

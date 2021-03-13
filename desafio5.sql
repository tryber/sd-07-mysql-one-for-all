CREATE VIEW top_2_hits_do_momento AS
SELECT s.song_name AS "cancao",
COUNT(h.user_id) AS "reproducoes"
FROM SpotifyClone.song AS s
INNER JOIN SpotifyClone.reproduction_history AS h
ON h.song_id = s.song_id
GROUP BY s.song_name
ORDER BY COUNT(h.user_id) DESC, s.song_name ASC
LIMIT 2;

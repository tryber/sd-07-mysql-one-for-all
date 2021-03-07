CREATE VIEW top_2_hits_do_momento AS
SELECT s.song_name AS cancao, COUNT(rh.song_id) AS reproducoes
FROM SpotifyClone.reproduction_history AS rh
JOIN SpotifyClone.songs AS s ON s.song_id = rh.song_id
GROUP BY s.song_name
ORDER BY reproducoes DESC, s.song_name
LIMIT 2;

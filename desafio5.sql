CREATE VIEW top_2_hits_do_momento AS
SELECT
s.song AS canção,
COUNT(p.song_id) AS reproducoes

FROM SpotifyClone.songs s

INNER JOIN SpotifyClone.playbacks p
ON s.song_id = p.song_id

GROUP BY p.song_id
ORDER BY reproducoes DESC, canção
LIMIT 2;

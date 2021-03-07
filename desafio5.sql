CREATE VIEW top_2_hits_do_momento AS
SELECT
s.song AS cancao,
COUNT(s.song) AS reproducoes
FROM SpotifyClone.histories AS h
INNER JOIN SpotifyClone.songs AS s
ON s.song_id = h.song_id
GROUP BY cancao
ORDER BY reproducoes DESC, cancao ASC
LIMIT 2;

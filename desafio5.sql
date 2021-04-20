CREATE VIEW SpotifyClone.top_2_hits_do_momento AS
SELECT
s.name AS cancao,
COUNT(h.song_id) AS reproducoes
FROM SpotifyClone.songs s
INNER JOIN SpotifyClone.history h ON s.id = h.song_id
GROUP BY s.name
ORDER BY reproducoes desc, cancao
LIMIT 2;

CREATE VIEW top_2_hits_do_momento AS
SELECT
s.song_title AS cancao,
count(p.user_id) AS reproducoes
FROM SpotifyClone.plays p
INNER JOIN SpotifyClone.songs s ON s.song_id = p.song_id
GROUP BY 1
ORDER BY
2 DESC,
1 ASC
limit 2;

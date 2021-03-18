CREATE VIEW SpotifyClone.top_2_hits_do_momento AS
SELECT s.song_name AS cancao,
COUNT(h.song_id) AS reproducoes
FROM SpotifyClone.songs AS s
INNER JOIN SpotifyClone.playedMusicHistory AS h ON s.song_id = h.song_id
GROUP BY cancao
ORDER BY reproducoes DESC, cancao
LIMIT 2;

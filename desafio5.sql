CREATE VIEW SpotifyClone.top_2_hits_do_momento AS
SELECT songs.name AS cancao,
COUNT(*) AS reproducoes
FROM SpotifyClone.songs AS songs
INNER JOIN SpotifyClone.rep_history AS hist
ON songs.id = hist.song_id
GROUP BY songs.id
ORDER BY 2 DESC, 1
LIMIT 2;

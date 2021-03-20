USE SpotifyClone;
CREATE VIEW cancoes_premium AS
SELECT songs.name AS nome,
COUNT(*) AS reproducoes
FROM songs
INNER JOIN rep_history AS hist
ON songs.id = hist.song_id
INNER JOIN user
ON user.id = hist.user_id
WHERE user.plan_id IN (2, 3)
GROUP BY nome
ORDER BY 1;

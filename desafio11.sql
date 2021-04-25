CREATE VIEW cancoes_premium AS
SELECT son.name AS nome, COUNT(h.song_id) AS reproducoes
FROM SpotifyClone.songs AS son
INNER JOIN SpotifyClone.user_history_songs AS h
ON h.song_id = son.song_id
INNER JOIN SpotifyClone.users AS u
ON u.user_id = h.user_id
WHERE u.plan_id IN(1,2)
GROUP BY son.name
ORDER BY son.name;

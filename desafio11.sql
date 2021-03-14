CREATE VIEW cancoes_premium AS
SELECT s.song_name AS "nome",
COUNT(h.user_id) AS "reproducoes"
FROM SpotifyClone.song AS s
INNER JOIN SpotifyClone.reproduction_history AS h
ON h.song_id = s.song_id
INNER JOIN SpotifyClone.user AS u
ON u.user_id = h.user_id
WHERE u.plan_id = 2 OR u.plan_id = 3
GROUP BY s.song_name
ORDER BY s.song_name ASC;

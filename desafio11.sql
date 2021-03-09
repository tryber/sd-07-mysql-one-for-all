CREATE VIEW cancoes_premium AS
SELECT
s.song AS nome,
COUNT(s.song) AS reproducoes
FROM SpotifyClone.histories AS h
INNER JOIN SpotifyClone.songs AS s
ON s.song_id = h.song_id
INNER JOIN SpotifyClone.users AS u
ON u.user_id = h.user_id
AND (u.plan_id = 2 OR u.plan_id = 3)
GROUP BY nome
ORDER BY nome ASC;

CREATE VIEW cancoes_premium AS
SELECT
s.song AS nome,
COUNT(p.song_id) AS reproducoes

FROM SpotifyClone.songs s

INNER JOIN SpotifyClone.playbacks p
ON p.song_id = s.song_id

INNER JOIN SpotifyClone.users u
ON p.user_id = u.user_id

WHERE u.plan_id in (2, 3)

GROUP BY p.song_id
ORDER BY nome;

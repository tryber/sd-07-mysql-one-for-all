CREATE VIEW SpotifyClone.cancoes_premium AS
SELECT 
s.name AS 'nome',
COUNT(h.song_id) AS 'reproducoes'
FROM SpotifyClone.songs s
INNER JOIN SpotifyClone.history h ON h.song_id = s.id
INNER JOIN SpotifyClone.users u ON h.user_id = u.id
INNER JOIN SpotifyClone.plans p ON p.id = u.plan_id
WHERE p.name IN ('familiar', 'universitário')
GROUP BY s.name 
ORDER BY nome;

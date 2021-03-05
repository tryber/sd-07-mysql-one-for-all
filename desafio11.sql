USE SpotifyClone;
CREATE VIEW cancoes_premium AS
SELECT s.song_name AS nome, COUNT(rh.song_id) AS reproducoes
FROM SpotifyClone.reproduction_history AS rh
JOIN SpotifyClone.songs AS s ON s.song_id = rh.song_id
JOIN SpotifyClone.users AS u ON u.user_id = rh.user_id
AND u.plan_id IN (2, 3)
GROUP BY s.song_name
ORDER BY s.song_name;

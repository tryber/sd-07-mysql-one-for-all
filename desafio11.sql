CREATE VIEW cancoes_premium AS

SELECT s.`name` AS 'nome', COUNT(usr.song_id) AS 'reproducoes'
FROM songs s
INNER JOIN user_songs_reproduction usr ON usr.song_id = s.song_id
INNER JOIN `user` u ON u.user_id = usr.user_id
INNER JOIN plan p ON p.plan_id = u.plan_id AND (p.`type` = 'familiar' OR p.`type` = 'universitário')
GROUP BY s.`name`
ORDER BY 1;

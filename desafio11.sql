CREATE VIEW cancoes_premium AS
SELECT musics.title AS "nome",
COUNT(music_history.user_id) AS "reproducoes"
FROM SpotifyClone.musics AS musics
INNER JOIN SpotifyClone.music_history AS music_history
ON musics.id = music_history.music_id
INNER JOIN SpotifyClone.users AS users
ON music_history.user_id = users.id
WHERE users.plan_id <> 1
GROUP BY musics.title
ORDER BY musics.title;

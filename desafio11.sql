CREATE VIEW cancoes_premium AS
SELECT musics.title AS "nome",
COUNT(music_history.user_id) AS "reproducoes"
FROM SpotifyClone.musics AS musics
INNER JOIN SpotifyClone.music_history AS music_history
ON musics.id = music_history.music_id
GROUP BY musics.title
ORDER BY musics.title;

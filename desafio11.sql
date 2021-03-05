CREATE VIEW cancoes_premium AS
SELECT S.name AS 'nome',
COUNT(H.song_id) AS 'reproducoes'
FROM SpotifyClone.songs AS S
INNER JOIN SpotifyClone.music_play_history AS H
ON H.song_id = S.id
INNER JOIN SpotifyClone.user AS U
ON H.user_id = U.id
WHERE U.plan_id <> 1
GROUP BY 1
ORDER BY 1

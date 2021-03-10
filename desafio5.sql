SELECT musics.title AS `cancao`,
COUNT(music_history.music_id) AS `reproducoes`
FROM SpotifyClone.musics AS musics
INNER JOIN SpotifyClone.music_history AS music_history
ON musics.id = music_history.music_id
GROUP BY musics.title
ORDER BY `reproducoes` DESC, `cancao`
LIMIT 2;

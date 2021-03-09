CREATE VIEW top_2_hits_do_momento AS
SELECT songs.name_songs AS "cancao",
COUNT(rep.user_id) AS "reproducoes"
FROM SpotifyClone.songs AS songs
INNER JOIN SpotifyClone.reproductions AS rep
ON songs.songs_id = rep.songs_id
GROUP BY `cancao`
ORDER BY `reproducoes` DESC, `cancao`
LIMIT 2;

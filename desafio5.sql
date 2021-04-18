CREATE VIEW top_2_hits_do_momento AS
SELECT s.`song` AS `cancao`,
count(h.user_id)  as `reproducoes`
FROM SpotifyClone.songs s
INNER JOIN SpotifyClone.`history` h ON s.song_id = h.song_id
group by `cancao`
order by `reproducoes` desc, `cancao`
limit 2;

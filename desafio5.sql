CREATE VIEW top_2_hits_do_momento AS
SELECT 
    SNG.song_name AS `cancao`,
    COUNT(*) AS `reproducoes`
FROM historic HIS
    INNER JOIN songs SNG
    ON HIS.id_song = SNG.id_song
GROUP BY HIS.id_song
ORDER BY `reproducoes` DESC, `cancao` LIMIT 2;

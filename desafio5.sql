CREATE VIEW top_2_hits_do_momento AS 
SELECT t1.song AS `cancao`, COUNT(t2.reproductions) AS `reproducoes`
FROM songs AS t1
INNER JOIN history_reproductions AS t2
WHERE t1.song = t2.reproductions
GROUP BY `cancao`
ORDER BY `reproducoes` DESC, `cancao`
LIMIT 2;

CREATE VIEW top_2_hits_do_momento AS (
  SELECT sng.songNAME AS `cancao`, COUNT(hst.songID) AS `reproducoes`
    FROM song AS `sng`
  INNER JOIN history AS `hst` 
    ON sng.songID = hst.songID
  GROUP BY sng.songNAME ORDER BY `reproducoes` DESC, `cancao` LIMIT 2
);

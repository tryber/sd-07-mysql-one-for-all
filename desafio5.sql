CREATE VIEW top_2_hits_do_momento AS 
SELECT
c.cancao_name AS `cancao`,
COUNT(r.cancao_id) AS `reproducoes`
FROM SpotifyClone.Cancao AS `c`
INNER JOIN SpotifyClone.HistoricoReproducao AS `r`
ON c.cancao_id = r.cancao_id
GROUP BY `cancao`
ORDER BY `reproducoes` DESC, `cancao`;

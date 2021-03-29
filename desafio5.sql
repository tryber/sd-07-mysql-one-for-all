CREATE VIEW `top_2_hits_do_momento` AS SELECT
C.cancao as `cancao`,
COUNT(H.cancao_id) as `reproducoes`
FROM SpotifyClone.cancoes AS C
INNER JOIN SpotifyClone.historico AS H ON H.cancao_id = C.cancao_id
GROUP BY `cancao`
ORDER BY `reproducoes` DESC, `cancao` ASC
LIMIT 2;

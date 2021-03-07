CREATE VIEW SpotifyClone.top_2_hits_do_momento AS
SELECT can.cancao AS `cancao`,
COUNT(can.cancao_id) AS `reproducoes`
FROM SpotifyClone.cancoes AS can
INNER JOIN SpotifyClone.historico_de_reproducoes AS his
ON his.cancao_id = can.cancao_id
GROUP BY can.cancao_id
ORDER BY reproducoes DESC, cancao
LIMIT 2;

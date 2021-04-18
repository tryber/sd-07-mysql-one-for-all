CREATE VIEW SpotifyClone.top_2_hits_do_momento AS
SELECT cancao.cancao AS `cancao`,
COUNT(hist.cancao_id) AS `reproducoes`
FROM SpotifyClone.cancao AS cancao
INNER JOIN SpotifyClone.historico_reproducoes AS hist
ON cancao.cancao_id = hist.cancao_id
GROUP BY cancao
ORDER BY reproducoes DESC, cancao LIMIT 2;

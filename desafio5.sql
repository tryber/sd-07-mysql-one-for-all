CREATE VIEW top_2_hits_do_momento AS
SELECT 
can.cancao AS cancao,
COUNT(*) AS reproducoes
FROM SpotifyClone.cancoes AS can
JOIN SpotifyClone.historicos AS his
ON his.cancao_id = can.cancao_id
GROUP BY cancao
ORDER BY reproducoes DESC,
cancao
LIMIT 2;

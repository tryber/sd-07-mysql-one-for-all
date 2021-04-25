CREATE VIEW top_2_hits_do_momento AS
SELECT CAN.nome_cancao cancao,
COUNT(HIS.cancao_id) reproducoes
FROM SpotifyClone.cancoes CAN
INNER JOIN SpotifyClone.historico HIS
ON CAN.cancao_id = HIS.cancao_id
GROUP BY CAN.nome_cancao
ORDER BY COUNT(HIS.cancao_id) DESC, CAN.nome_cancao
LIMIT 2;

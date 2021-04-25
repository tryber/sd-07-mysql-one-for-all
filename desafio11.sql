CREATE VIEW cancoes_premium AS
SELECT CAN.nome_cancao nome,
COUNT(PLA.plano_id) reproducoes
FROM SpotifyClone.cancoes CAN
INNER JOIN SpotifyClone.historico HIS
ON CAN.cancao_id = HIS.cancao_id
INNER JOIN SpotifyClone.usuarios USU
ON USU.usuario_id = HIS.usuario_id
INNER JOIN SpotifyClone.planos PLA
ON USU.plano_id = PLA.plano_id
WHERE PLA.nome_planos = "universitário" OR PLA.nome_planos = "familiar"
GROUP BY CAN.nome_cancao
ORDER BY CAN.nome_cancao;

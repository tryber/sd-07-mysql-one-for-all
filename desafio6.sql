CREATE VIEW faturamento_atual AS
SELECT ROUND(MIN(PLA.valor_plano), 2) faturamento_minimo,
ROUND(MAX(PLA.valor_plano), 2) faturamento_maximo,
ROUND(AVG(PLA.valor_plano), 2) faturamento_medio,
ROUND(SUM(PLA.valor_plano), 2) faturamento_total
FROM SpotifyClone.usuarios USU
INNER JOIN SpotifyClone.planos PLA
ON USU.plano_id = PLA.plano_id;

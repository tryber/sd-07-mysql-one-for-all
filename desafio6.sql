CREATE VIEW faturamento_atual AS
SELECT 
ROUND(MIN(valor_do_plano), 2) as faturamento_minimo,
ROUND(MAX(valor_do_plano), 2) as faturamento_maximo,
ROUND(AVG(valor_do_plano), 2) as faturamento_medio,
ROUND(SUM(valor_do_plano), 2) as faturamento_total
FROM SpotifyClone.plano p
INNER JOIN SpotifyClone.usuario u
ON p.plano_id = u.plano_id;

CREATE VIEW faturamento_atual AS
SELECT 
MIN(p.valor_do_plano) as faturamento_minimo,
ROUND(MAX(p.valor_do_plano), 2) as faturamento_maximo,
ROUND(AVG(p.valor_do_plano), 2) as faturamento_medio,
ROUND(SUM(p.valor_do_plano), 2) as faturamento_total
FROM SpotifyClone.plano p
INNER JOIN SpotifyClone.usuario u
ON p.plano_id = u.plano_id;

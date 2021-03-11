CREATE VIEW faturamento_atual AS
SELECT MIN(plan.valor_plano) AS faturamento_minimo,
MAX(plan.valor_plano) AS faturamento_maximo,
CAST(AVG(plan.valor_plano) AS DECIMAL(10,2)) AS faturamento_medio,
SUM(plan.valor_plano) AS faturamento_total
FROM SpotifyClone.usuarios AS users
INNER JOIN SpotifyClone.planos AS plan
ON users.plano_id = plan.plano_id;

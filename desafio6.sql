CREATE VIEW faturamento_atual AS

SELECT CAST(MIN(p.cost) AS DECIMAL(36,2)) AS 'faturamento_minimo',
CAST(MAX(p.cost) AS DECIMAL(36,2)) AS 'faturamento_maximo',
CAST(ROUND(AVG(p.cost), 2) AS DECIMAL(36,2)) AS 'faturamento_medio',
CAST(SUM(p.cost) AS DECIMAL(36,2)) AS 'faturamento_total' FROM plan p
INNER JOIN `user` u ON u.plan_id = p.plan_id;

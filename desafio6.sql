CREATE VIEW faturamento_atual AS 
SELECT CAST(ROUND(MIN(t1.value), 2) AS DECIMAL(5, 2)) AS `faturamento_minimo`,
CAST(ROUND(MAX(t1.value), 2) AS DECIMAL(5, 2)) AS `faturamento_maximo`,
CAST(ROUND(AVG(t1.value), 2) AS DECIMAL(5, 2)) AS `faturamento_medio`,
CAST(ROUND(SUM(t1.value), 2) AS DECIMAL(5,2)) AS `faturamento_total`
FROM plans AS t1
INNER JOIN users as t2
WHERE t1.plan = t2.plan;

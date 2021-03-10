CREATE VIEW faturamento_atual AS 
SELECT MIN(t1.value) AS `faturamento_minimo`, MAX(t1.value) AS `faturamento_maximo`, ROUND(AVG(t1.value), 2) AS `faturamento_medio`, SUM(t1.value) AS `faturamento_total`
FROM plans AS t1
INNER JOIN users as t2
WHERE t1.plan = t2.plan;

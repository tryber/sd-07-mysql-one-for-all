DROP VIEW IF EXISTS faturamento_atual;
CREATE VIEW faturamento_atual AS SELECT ROUND(MIN(t1.value), 2) AS `faturamento_minimo`, ROUND(MAX(t1.value), 2) AS `faturamento_maximo`, ROUND(AVG(t1.value), 2) AS `faturamento_medio`, ROUND(SUM(t1.value), 2) AS `faturamento_total`
FROM plans AS t1
INNER JOIN users as t2
WHERE t1.plan = t2.plan;

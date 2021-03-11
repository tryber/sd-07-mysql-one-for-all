create view faturamento_atual as SELECT
CAST(ANY_VALUE(MIN(P.plan_price)) AS DECIMAL(4,2)) AS "faturamento_minimo", 
CAST(ANY_VALUE(MAX(P.plan_price)) AS DECIMAL(4,2)) AS "faturamento_maximo",
CAST(ROUND(ANY_VALUE(SUM(P.plan_price)/4), 2)AS DECIMAL (4,2)) AS "faturamento_medio", 
CAST(ANY_VALUE(SUM(P.plan_price)) AS DECIMAL(4,2)) AS "faturamento_total" 
FROM plans AS P
GROUP BY "faturamento_minimo", "faturamento_maximo","faturmaneto_medio","faturamento_total";
CREATE VIEW faturamento_atual AS 
SELECT ROUND(MIN(PLAN.plan_value),2) AS faturamento_minimo,
ROUND(MAX(PLAN.plan_value),2)AS faturamento_maximo,
ROUND(AVG(PLAN.plan_value),2)AS faturamento_medio,
ROUND(SUM(PLAN.plan_value),2)AS faturamento_total
FROM SpotifyClone.plans AS PLAN
JOIN SpotifyClone.users US ON PLAN.plan_id = US.plan_id;

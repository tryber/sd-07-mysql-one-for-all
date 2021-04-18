CREATE VIEW faturamento_atual AS
SELECT
MIN(plans.PLAN_VALUE) AS faturamento_minimo,
MAX(plans.PLAN_VALUE) AS faturamento_maximo,
ROUND(AVG(plans.PLAN_VALUE), 2) AS faturamento_medio,
SUM(plans.PLAN_VALUE) AS faturamento_total
FROM
spotifyclone.plans plans,
spotifyclone.users users
WHERE
plans.PLAN_ID = users.PLAN_ID;

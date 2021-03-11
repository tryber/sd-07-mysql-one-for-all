CREATE VIEW faturamento_atual AS
SELECT ROUND(MIN(price), 2) AS "faturamento_minimo",
ROUND(MAX(plans.price), 2) AS "faturamento_maximo",
ROUND(AVG(plans.price), 2) AS "faturamento_medio",
ROUND(SUM(plans.price), 2) AS "faturamento_total"
FROM SpotifyClone.users AS users
INNER JOIN SpotifyClone.plans AS plans
ON users.plans_id = plans.plans_id;

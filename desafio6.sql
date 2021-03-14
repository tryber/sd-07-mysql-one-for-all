CREATE VIEW faturamento_atual AS
SELECT
ROUND(MIN(PLANS.price), 2) AS "faturamento_minimo",
ROUND(MAX(PLANS.price), 2) AS "faturamento_maximo",
ROUND(AVG(PLANS.price), 2) AS "faturamento_medio",
ROUND(SUM(PLANS.price), 2) AS "faturamento_total"

FROM
SpotifyClone.users AS USERS
INNER JOIN SpotifyClone.plans PLANS ON PLANS.plan_id = USERS.plan_id;

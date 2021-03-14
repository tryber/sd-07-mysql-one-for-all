CREATE VIEW faturamento_atual AS
SELECT
MIN(PLANS.price) AS "faturamento_minimo",
MAX(PLANS.price) AS "faturamento_maximo",
ROUND(AVG(PLANS.price), 2) AS "faturamento_medio",
SUM(PLANS.price) AS "faturamento_total"

FROM
SpotifyClone.users AS USERS
INNER JOIN SpotifyClone.plans PLANS ON PLANS.plan_id = USERS.plan_id;

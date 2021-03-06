CREATE VIEW faturamento_atual AS
SELECT
MIN(p.plan_value) AS faturamento_minimo,
MAX(p.plan_value) AS faturamento_maximo,

( SELECT
ROUND(AVG(p.plan_value), 2)
) AS faturamento_medio,

( SELECT
SUM(p.plan_value)
) AS faturamento_total

FROM SpotifyClone.plans p

INNER JOIN SpotifyClone.users u
ON u.plan_id = p.plan_id;

CREATE VIEW faturamento_atual AS
SELECT MIN(p.plan_value) AS "faturamento_minimo",
MAX(p.plan_value) AS "faturamento_maximo",
ROUND(AVG(p.plan_value), 2) AS "faturamento_medio",
SUM(p.plan_value) AS "faturamento_total"
FROM SpotifyClone.plan AS p
INNER JOIN SpotifyClone.user AS u
ON u.plan_id = p.plan_id;

CREATE VIEW faturamento_atual AS
SELECT
MIN(p.planValue) AS faturamento_minimo,
MAX(p.planValue) AS faturamento_maximo,
(SELECT ROUND(AVG(p.planValue), 2) FROM SpotifyClone.users AS u INNER JOIN SpotifyClone.plans AS p ON u.plan_id = p.plan_id) AS faturamento_medio,
(SELECT SUM(p.planValue) FROM SpotifyClone.users AS u INNER JOIN SpotifyClone.plans AS p ON u.plan_id = p.plan_id) AS faturamento_total
FROM SpotifyClone.plans AS p;

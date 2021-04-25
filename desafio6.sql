CREATE VIEW faturamento_atual AS
SELECT MIN(price) AS faturamento_minimo,
MAX(price) AS faturamento_maximo,
(SELECT ROUND(AVG(p.price), 2) FROM SpotifyClone.users AS u,
SpotifyClone.plans AS p
WHERE p.plan_id = u.plan_id) AS faturamento_medio,
(SELECT SUM(p.price) FROM SpotifyClone.users AS u,
SpotifyClone.plans AS p
WHERE p.plan_id = u.plan_id) AS faturamento_total
FROM SpotifyClone.plans;

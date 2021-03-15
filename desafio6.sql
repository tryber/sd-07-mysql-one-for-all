CREATE VIEW SpotifyClone.faturamento_atual AS
SELECT MIN(sub.price) AS faturamento_minimo,
MAX(sub.price) AS faturamento_maximo,
ROUND(AVG(sub.price), 2) AS faturamento_medio,
SUM(sub.price) AS faturamento_total
FROM SpotifyClone.subscriptions AS sub
INNER JOIN SpotifyClone.user AS user
ON sub.id = user.plan_id;

CREATE VIEW faturamento_atual AS
SELECT
MIN(plans.value) 'faturamento_minimo',
MAX(plans.value) 'faturamento_maximo',
ROUND(AVG(plans.value), 2) 'faturamento_medio',
SUM(plans.value) 'faturamento_total'
FROM
SpotifyClone.plans plans
RIGHT JOIN SpotifyClone.users users
ON plans.category_id = users.category_id;

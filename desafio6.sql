CREATE VIEW SpotifyClone.faturamento_atual AS
SELECT ROUND(MIN(mp.plan_value), 2) AS 'faturamento_minimo',
ROUND(MAX(mp.plan_value), 2) AS 'faturamento_maximo',
ROUND(SUM(mp.plan_value) / COUNT(u.user_id), 2) AS 'faturamento_medio',
ROUND(SUM(mp.plan_value),2) AS 'faturamento_total'
FROM SpotifyClone.monthlyPlans AS mp
INNER JOIN SpotifyClone.users AS u ON mp.plan_id = u.plan_id;

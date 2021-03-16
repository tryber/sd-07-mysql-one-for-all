CREATE VIEW faturamento_atual AS
SELECT
min(s.sub_value) AS faturamento_minimo,
max(s.sub_value) AS faturamento_maximo,
round(avg(s.sub_value),2) AS faturamento_medio,
sum(s.sub_value) AS faturamento_total
FROM SpotifyClone.subscriptions s
INNER JOIN SpotifyClone.users u on u.subscription_id = s.sub_id;

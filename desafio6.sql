CREATE VIEW faturamento_atual AS
SELECT
MIN(S.subscription_price) AS faturamento_minimo,
MAX(S.subscription_price) AS faturamento_maximo,
ROUND(AVG(S.subscription_price), 2) AS faturamento_medio,
SUM(S.subscription_price) AS faturamento_total
FROM
User AS U
JOIN Subscription AS S ON U.subscription_ID = S.subscription_ID;

CREATE VIEW faturamento_atual AS
SELECT
ROUND(MIN(P.price), 2) AS 'faturamento_minimo',
ROUND(MAX(P.price), 2) AS 'faturamento_maximo',
ROUND(AVG(P.price), 2) AS 'faturamento_medio',
ROUND(SUM(P.PRICE), 2) AS 'faturamento_total'
FROM SpotifyClone.plan AS P
INNER JOIN SpotifyClone.user AS U
ON P.id = U.plan_id

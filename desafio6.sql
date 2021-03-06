CREATE VIEW faturamento_atual AS
SELECT
(MIN(P.price), 2) AS 'faturamento_minimo',
(MAX(P.price), 2) AS 'faturamento_maximo',
ROUND(AVG(P.price), 2) AS 'faturamento_medio',
(SUM(P.PRICE), 2) AS 'faturamento_total'
FROM SpotifyClone.plan AS P
INNER JOIN SpotifyClone.user AS U
ON P.id = U.plan_id

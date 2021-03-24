CREATE VIEW faturamento_atual AS
SELECT
FORMAT(MIN(P.price), 2) AS 'faturamento_minimo',
FORMAT(MAX(P.price), 2) AS 'faturamento_maximo',
FORMAT(ROUND(AVG(P.price), 2), 2) AS 'faturamento_medio',
FORMAT(SUM(P.PRICE), 2) AS 'faturamento_total'
FROM SpotifyClone.plan AS P
INNER JOIN SpotifyClone.user AS U
ON P.id = U.plan_id

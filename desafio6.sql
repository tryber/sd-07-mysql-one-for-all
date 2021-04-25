CREATE VIEW faturamento_atual AS 
SELECT ROUND(MIN(PLANO.price), 2) AS 'faturamento_minimo', 
ROUND(MAX(PLANO.price),2) AS 'faturamento_maximo',
ROUND(AVG(PLANO.price),2) AS 'faturamento_medio',
ROUND(SUM(PLANO.PRICE),2) AS 'faturamento_total'
FROM SpotifyClone.plan AS PLANO
INNER JOIN SpotifyClone.users AS USUARIO
ON USUARIO.plan_id = PLANO.id;

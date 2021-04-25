CREATE VIEW faturamento_atual AS
SELECT MIN(P1.price) AS "faturamento_minimo" ,
MAX(P1.price) AS "faturamento_maximo",
ROUND((SUM(P1.price)/
(SELECT COUNT(users.id))),2) AS "faturamento_medio",
SUM(P1.price) AS "faturamento_total"
FROM SpotifyClone.plans AS P1
INNER JOIN SpotifyClone.users AS users
ON P1.id = users.plan_id;

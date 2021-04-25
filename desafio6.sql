CREATE VIEW faturamento_atual AS SELECT
(SELECT ROUND(MIN(plano_valor),2) FROM Planos AS P 
INNER JOIN Usuarios AS U
ON U.fk_plano_id = P.plano_id) AS faturamento_minimo,
(SELECT ROUND(MAX(plano_valor),2) FROM Planos AS P 
INNER JOIN Usuarios AS U
ON U.fk_plano_id = P.plano_id) AS faturamento_maximo,
(SELECT ROUND(AVG(plano_valor),2) FROM Planos AS P 
INNER JOIN Usuarios AS U
ON U.fk_plano_id = P.plano_id) AS faturamento_medio,
(SELECT ROUND(SUM(plano_valor),2) FROM Planos AS P 
INNER JOIN Usuarios AS U
ON U.fk_plano_id = P.plano_id) AS faturamento_total;

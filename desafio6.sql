CREATE VIEW faturamento_atual AS
SELECT FORMAT(MIN(P.valor_plano), 2) AS faturamento_minimo,
FORMAT(MAX(P.valor_plano), 2) AS faturamento_maximo,
FORMAT(ROUND(AVG(P.valor_plano), 2),2) AS faturamento_medio,
FORMAT(ROUND(SUM(P.valor_plano), 2), 2) AS faturamento_total
FROM SpotifyClone.plano AS P
INNER JOIN SpotifyClone.usuarios AS U
ON U.plano = P.plano_id;

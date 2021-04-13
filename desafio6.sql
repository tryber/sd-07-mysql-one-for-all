CREATE VIEW faturamento_atual AS
SELECT MIN(p.valor_plano) AS "faturamento_minimo" ,
MAX(p.valor_plano) AS "faturamento_maximo",
round(AVG(p.valor_plano), 2) AS "faturamento_medio",
round(SUM(p.valor_plano), 2) AS "faturamento_total"
FROM SpotifyClone.planos AS p
INNER JOIN SpotifyClone.usuarios AS u
ON u.plano_id = p.plano_id;

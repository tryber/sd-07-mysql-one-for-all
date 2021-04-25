CREATE VIEW faturamento_atual AS
SELECT ROUND(MIN(p.preco), 2) AS faturamento_minimo,
ROUND(AVG(p.preco), 2) AS faturamento_medio,
ROUND(MAX(p.preco), 2) AS faturamento_maximo,
ROUND(SUM(p.preco), 2) AS faturamento_total
FROM planos AS p
INNER JOIN usuarios AS u
ON p.id = u.plano_id;

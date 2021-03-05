CREATE VIEW faturamento_atual AS
SELECT MIN(preco) AS faturamento_minimo, 
MAX(preco) AS faturamento_maximo, 
ROUND(AVG(preco - 1.16),2 ) AS faturamento_medio,
SUM(preco) AS faturamento_total
FROM planos;

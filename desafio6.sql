CREATE VIEW faturamento_atual AS
SELECT
MIN(p.preco) AS faturamento_minimo,
ROUND(MAX(p.preco), 2) AS faturamento_maximo,
ROUND(AVG(p.preco), 2) AS faturamento_medio,
ROUND(SUM(p.preco), 2) AS faturamento_total
FROM SpotifyClone.usuarios AS u
INNER JOIN SpotifyClone.planos AS p ON u.plano_id = p.plano_id;

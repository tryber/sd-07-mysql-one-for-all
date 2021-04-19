CREATE VIEW SpotifyClone.faturamento_atual AS
SELECT
ROUND(MIN(t2.valor), 2) AS faturamento_minimo,
ROUND(MAX(t2.valor), 2) AS faturamento_maximo,
ROUND(AVG(t2.valor), 2) AS faturamento_medio,
ROUND(SUM(t2.valor), 2) AS faturamento_total
FROM SpotifyClone.Usuario AS t1
INNER JOIN SpotifyClone.Plano AS t2 ON t1.plano_id = t2.id;

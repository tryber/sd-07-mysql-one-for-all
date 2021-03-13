CREATE VIEW faturamento_atual AS
SELECT
ROUND(MIN(valor), 2) AS faturamento_minimo,
ROUND(MAX(valor), 2) AS faturamento_maximo,
ROUND(AVG(valor), 2) AS faturamento_medio,
ROUND(SUM(valor), 2) AS faturamento_total
FROM SpotifyClone.planos AS planos
INNER JOIN SpotifyClone.usuarios AS usuarios ON usuarios.plano_id = planos.id;

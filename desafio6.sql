CREATE VIEW faturamento_atual AS
SELECT 
MIN(plano.valor_plano) AS faturamento_minimo,
MAX(plano.valor_plano) AS faturamento_maximo,
ROUND(AVG(plano.valor_plano), 2) AS faturamento_medio,
SUM(plano.valor_plano) AS faturamento_total
FROM SpotifyClone.planos AS plano
JOIN SpotifyClone.usuarios AS usr
ON usr.plano_id = plano.plano_id;

CREATE VIEW faturamento_atual AS
SELECT
MIN(t1.valor_plano) AS 'faturamento_minimo',
MAX(t1.valor_plano) AS 'faturamento_maximo',
ROUND(SUM(t1.valor_plano) / COUNT(t2.usuario_id), 2) AS 'faturamento_medio',
SUM(t1.valor_plano) AS 'faturamento_total'
FROM SpotifyClone.planos AS t1
INNER JOIN SpotifyClone.usuarios AS t2
ON t1.plano_id = t2.plano_id;

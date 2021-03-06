CREATE VIEW SpotifyClone.faturamento_atual AS
SELECT
MIN(valor_do_plano) AS 'faturamento_minimo',
MAX(valor_do_plano) AS 'faturamento_maximo',
ROUND(AVG(valor_do_plano), 2) AS 'faturamento_medio',
SUM(valor_do_plano) AS 'faturamento_total'
FROM SpotifyClone.usuarios u
JOIN SpotifyClone.planos p ON u.plano_id = p.plano_id;

CREATE VIEW SpotifyClone.faturamento_atual AS
SELECT MIN(valor_plano) AS faturamento_minimo,
ROUND(MAX(valor_plano), 2) AS faturamento_maximo,
ROUND(AVG(valor_plano), 2) AS faturamento_medio,
ROUND(SUM(valor_plano), 2) AS faturamento_total
FROM SpotifyClone.planos
INNER JOIN SpotifyClone.users
ON planos.plano_id = users.plano_id;

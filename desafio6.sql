CREATE VIEW faturamento_atual AS
SELECT FORMAT(MIN(dbs.valor_plano), 2) as faturamento_minimo,
FORMAT(MAX(dbs.valor_plano), 2) as faturamento_maximo,
FORMAT(ROUND(SUM(dbs.valor_plano) / COUNT(dbu.plano_id), 2), 2) as faturamento_medio,
FORMAT(SUM(dbs.valor_plano), 2) as faturamento_total 
FROM SpotifyClone.subscriptions as dbs
INNER JOIN SpotifyClone.users as dbu
ON dbu.plano_id = dbs.plano_id;

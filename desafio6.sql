CREATE VIEW faturamento_atual AS
SELECT MIN(dbs.valor_plano) as faturamento_minimo,
MAX(dbs.valor_plano) as faturamento_maximo,
FORMAT(ROUND(SUM(dbs.valor_plano) / COUNT(dbu.plano_id), 2), 2) as faturamento_medio,
SUM(dbs.valor_plano) as faturamento_total 
FROM SpotifyClone.subscriptions as dbs
INNER JOIN SpotifyClone.users as dbu
ON dbu.plano_id = dbs.plano_id;

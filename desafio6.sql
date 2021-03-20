CREATE VIEW faturamento_atual AS
SELECT MIN(dbs.valor_plano) as faturamento_minimo,
MAX(dbs.valor_plano) as faturamento_maximo,
AVG(dbs.valor_plano) as faturamento_medio,
SUM(dbs.valor_plano) as faturamento_total 
FROM SpotifyClone.subscriptions as dbs;

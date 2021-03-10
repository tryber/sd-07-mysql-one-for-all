CREATE VIEW faturamento_atual
AS SELECT ROUND(MIN(pla.pla_value), 2) AS 'faturamento_minimo',
ROUND(MAX(pla.pla_value), 2) AS 'faturamento_maximo',
ROUND(AVG(pla.pla_value), 2) AS 'faturamento_medio',
ROUND(SUM(pla.pla_value), 2) AS 'faturamento_total'
FROM SpotifyClone.Users AS usr
INNER JOIN SpotifyClone.Plans AS pla ON pla.pla_id = usr.pla_id;

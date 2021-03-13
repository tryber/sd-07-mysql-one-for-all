CREATE VIEW faturamento_atual AS
SELECT MIN(pl.valor_plano) AS "faturamento_minimo" , MAX(pl.valor_plano) AS "faturamento_maximo",
round(AVG(pl.valor_plano), 2) AS "faturamento_medio", round(SUM(pl.valor_plano), 2) AS "faturamento_total"
FROM SpotifyClone.planos AS pl
INNER JOIN SpotifyClone.users AS us
ON pl.plano_id = us.plano_id;

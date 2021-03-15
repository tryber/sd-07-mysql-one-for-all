CREATE VIEW SpotifyClone.faturamento_atual AS 
SELECT MIN(pla.preco) AS "faturamento_minimo",
ROUND(MAX(pla.preco), 2) AS "faturamento_maximo",
ROUND(AVG(pla.preco), 2) AS "faturamento_medio",
ROUND(SUM(pla.preco), 2) AS "faturamento_total"
FROM SpotifyClone.plano AS pla
INNER JOIN SpotifyClone.usuario AS usu
ON usu.plano_id = pla.plano_id;

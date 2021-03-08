CREATE VIEW faturamento_atual AS
SELECT 
MIN(pla.preco) AS faturamento_minimo,
MAX(pla.preco) AS faturamento_maximo,
ROUND(AVG(pla.preco),2) AS faturamento_medio, 
SUM(pla.preco) AS faturamento_total
FROM SpotifyClone.planos AS pla
INNER JOIN SpotifyClone.usuarios AS usr
ON usr.plano_id = pla.plano_id;

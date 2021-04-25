CREATE VIEW faturamento_atual AS
SELECT
MIN(pla.preco_plano) AS `faturamento_minimo`,
MAX(pla.preco_plano) AS `faturamento_maximo`,
ROUND(AVG(pla.preco_plano), 2) AS `faturamento_medio`,
SUM(pla.preco_plano) AS `faturamento_total`
FROM SpotifyClone.usuario AS `use`
INNER JOIN SpotifyClone.plano AS pla
ON `use`.plano_id = pla.plano_id;

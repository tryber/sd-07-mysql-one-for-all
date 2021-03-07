CREATE VIEW SpotifyClone.faturamento_atual AS
SELECT ROUND(MIN(p.valor), 2) AS `faturamento_minimo`,
  ROUND(MAX(p.valor), 2) AS `faturamento_maximo`,
  ROUND(AVG(p.valor), 2) AS `faturamento_medio`,
  SUM(p.valor) AS `faturamento_total`
FROM SpotifyClone.planos AS p
  INNER JOIN SpotifyClone.usuarios AS u ON u.plano_id = p.plano_id;
CREATE VIEW faturamento_atual AS
  SELECT CONCAT(MIN(p.preço)) AS 'faturamento_minimo',
  CONCAT(MAX(p.preço)) AS 'faturamento_maximo',
  concat(round(AVG(p.preço), 2)) AS 'faturamento_medio',
  CONCAT(SUM(p.preço)) AS 'faturamento_total'
  FROM SpotifyClone.usuarios AS u
  INNER JOIN SpotifyClone.planos AS p
  ON p.plano_id = u.plano_id;

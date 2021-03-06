CREATE VIEW faturamento_atual AS
  SELECT MIN(p.preço) AS 'faturamento_minimo',
  MAX(p.preço) AS 'faturamento_maximo',
  concat(round(AVG(p.preço), 2), 0) AS 'faturamento_medio',
  SUM(p.preço) AS 'faturamento_total'
  FROM SpotifyClone.usuarios AS u
  INNER JOIN SpotifyClone.planos AS p
  ON p.plano_id = u.plano_id;

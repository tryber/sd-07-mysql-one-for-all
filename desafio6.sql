CREATE VIEW faturamento_atual AS
  SELECT MIN(p.preço) AS 'faturamento_minimo',
  MAX(p.preço) AS 'faturamento_maximo',
  convert(round(AVG(p.preço), 2), char) AS 'faturamento_medio',
  convert(SUM(p.preço), char) AS 'faturamento_total'
  FROM SpotifyClone.usuarios AS u
  INNER JOIN SpotifyClone.planos AS p
  ON p.plano_id = u.plano_id;

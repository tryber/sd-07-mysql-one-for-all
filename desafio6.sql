CREATE VIEW faturamento_atual AS
  SELECT ROUND(MIN(planos.valor),2) AS faturamento_minimo,
  ROUND(MAX(planos.valor),2) AS faturamento_maximo,
  ROUND(AVG(planos.valor),2) AS faturamento_medio,
  ROUND(SUM(planos.valor),2) AS faturamento_total
  FROM SpotifyClone.plano AS planos
    INNER JOIN SpotifyClone.usuario AS usuario
      ON planos.plano_id = usuario.plano_id;

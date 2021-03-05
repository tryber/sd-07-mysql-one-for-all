  CREATE VIEW faturamento_atual AS
  SELECT 
  ROUND(MIN(value_plan),2) AS faturamento_minimo,
  ROUND(MAX(value_plan),2) AS faturamento_maximo,
  ROUND(SUM(value_plan) / 4, 2) AS faturamento_medio,
  ROUND(SUM(value_plan),2) AS faturamento_total
  FROM SpotifyClone.plan;

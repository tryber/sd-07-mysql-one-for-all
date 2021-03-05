  CREATE VIEW faturamento_atual AS
  SELECT 
  MIN(p.value_plan) AS faturamento_minimo,
  MAX(p.value_plan) AS faturamento_maximo,
  ROUND(SUM(p.value_plan) / COUNT(u.name), 2) AS faturamento_medio,
  SUM(p.value_plan) AS faturamento_total
  FROM SpotifyClone.plan AS p
  INNER JOIN SpotifyClone.users AS u 
  ON u.plan_id = p.plan_id;

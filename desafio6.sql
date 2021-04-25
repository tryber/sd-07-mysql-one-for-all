CREATE VIEW `faturamento_atual` AS
SELECT 
  MIN(plan_price) AS `faturamento_minimo`,
  MAX(plan_price) AS `faturamento_maximo`,
  ROUND(AVG(plan_price),2)AS `faturamento_medio`,
  SUM(plan_price) AS `faturamento_total`
FROM 
SpotifyClone.plan AS `pla`
INNER JOIN SpotifyClone.user AS `usr`
ON
usr.user_plan = pla.plan_id 
;

  CREATE VIEW faturamento_atual AS
  SELECT 
	convert(MIN(p.value_plan), char) AS faturamento_minimo,
	convert(MAX(p.value_plan), char) AS faturamento_maximo,
	convert(ROUND(SUM(p.value_plan) / COUNT(u.name), 2), char) AS faturamento_medio,
	convert(SUM(p.value_plan), char) AS faturamento_total
  FROM SpotifyClone.plan AS p
	INNER JOIN SpotifyClone.users AS u 
	ON u.plan_id = p.plan_id;


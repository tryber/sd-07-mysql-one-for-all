CREATE VIEW faturamento_atual AS
SELECT round(min(p.price), 2) AS `faturamento_minimo`,
round(max(p.price), 2) as `faturamento_maximo`,
round(avg(p.price), 2) as `faturamento_medio`,
round(sum(p.price), 2) as `faturamento_total`
FROM SpotifyClone.plans p
INNER JOIN SpotifyClone.users u ON p.plan_id = u.plan_id;

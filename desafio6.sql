CREATE VIEW faturamento_atual AS
SELECT cast(min(p.price) AS DECIMAL(28,2)) AS `faturamento_minimo`,
cast(max(p.price) AS DECIMAL(28,2)) as `faturamento_maximo`,
cast(avg(p.price) AS DECIMAL(28,2)) as `faturamento_medio`,
cast(sum(p.price) AS DECIMAL(28,2)) as `faturamento_total`
FROM SpotifyClone.plans p
INNER JOIN SpotifyClone.users u ON p.plan_id = u.plan_id;

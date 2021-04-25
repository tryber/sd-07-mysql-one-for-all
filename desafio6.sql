CREATE VIEW faturamento_atual AS 
SELECT
FORMAT(MIN(p.valor_plano), 2) AS `faturamento_minimo`,
FORMAT(MAX(p.valor_plano), 2) AS `faturamento_maximo`,
FORMAT(ROUND(SUM(p.valor_plano)/COUNT(u.usuario_id), 2), 2) AS `faturamento_medio`,
FORMAT(SUM(p.valor_plano), 2) AS `faturamento_total`
FROM SpotifyClone.Plano AS `p`
INNER JOIN SpotifyClone.Usuario AS `u`
ON p.plano_id = u.plano_id;

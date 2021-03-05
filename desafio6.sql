CREATE VIEW faturamento_atual AS
SELECT
FORMAT(MIN(planos.valor_plano), 2) AS faturamento_minimo,
FORMAT(MAX(planos.valor_plano), 2) AS faturamento_maximo,
FORMAT(ROUND(SUM(planos.valor_plano)/COUNT(users.usuario_id), 2), 2) AS faturamento_medio,
FORMAT(SUM(planos.valor_plano),2) AS faturamento_total
FROM SpotifyClone.planos AS planos
INNER JOIN SpotifyClone.users AS users
ON users.plano_id = planos.plano_id;

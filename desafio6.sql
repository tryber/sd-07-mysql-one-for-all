CREATE VIEW faturamento_atual AS
    SELECT 
        ROUND(MIN(plano.valor), 2) AS faturamento_minimo,
        ROUND(MAX(plano.valor), 2) AS faturamento_maximo,
        (SELECT 
                ROUND((AVG(plan.valor)), 2)
            FROM
                SpotifyClone.Plano AS plan
                    INNER JOIN
                SpotifyClone.Usuario usuario ON usuario.plano_id = plan.id) AS faturamento_medio,
        ROUND(SUM(plano.valor), 2) AS faturamento_total
    FROM
        SpotifyClone.Plano AS plano;

CREATE VIEW cancoes_premium AS
    SELECT 
        hr.historico_de_reproducoes AS nome, COUNT(*) AS reproducoes
    FROM
        historico_reproducao hr
            INNER JOIN
        usuarios u ON hr.usuario_id = u.usuario_id
    WHERE
        u.plano IN ('familiar' , 'universitário')
    GROUP BY nome
    ORDER BY nome;

CREATE VIEW historico_reproducao_usuarios AS
    SELECT 
        u.usuario, hr.historico_de_reproducoes AS nome
    FROM
        historico_reproducao hr
            INNER JOIN
        usuarios u ON hr.usuario_id = u.usuario_id
    ORDER BY u.usuario , hr.historico_de_reproducoes;

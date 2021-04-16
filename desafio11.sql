CREATE VIEW cancoes_premium AS
    SELECT 
        t1.nome, COUNT(t2.usuario_id) AS reproducoes
    FROM
        SpotifyClone.cancoes AS t1
            INNER JOIN
        SpotifyClone.historico_reproducoes AS t2 ON t1.cancoes_id = t2.cancoes_id
            INNER JOIN
        SpotifyClone.usuario AS t3 ON t2.usuario_id = t3.usuario_id
            INNER JOIN
        SpotifyClone.plano AS t4 ON t3.plano_id = t4.plano_id
    WHERE
        tipo IN ('familiar' , 'universitario')
    GROUP BY nome
    ORDER BY nome ASC;

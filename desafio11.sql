CREATE VIEW cancoes_premium AS
    SELECT 
        c.cancao_nome AS nome, COUNT(h.usuario_id) AS reproducoes
    FROM
        SpotifyClone.cancao AS c
            JOIN
        SpotifyClone.historico_de_reproducoes AS h ON c.cancao_id = h.cancao_id
            JOIN
        SpotifyClone.usuario AS u ON h.usuario_id = u.usuario_id
            JOIN
        SpotifyClone.plano AS p ON u.plano_id = p.plano_id
    WHERE
        p.plano_nome = 'familiar'
            OR p.plano_nome = 'universitário'
    GROUP BY nome
    ORDER BY nome;

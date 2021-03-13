CREATE VIEW historico_reproducao_usuarios AS
    SELECT 
        u.usuario_nome AS usuario, c.cancao_nome AS nome
    FROM
        spotifyclone.historico_de_reproducoes AS h
            JOIN
        spotifyclone.usuario AS u ON h.usuario_id = u.usuario_id
            JOIN
        spotifyclone.cancao AS c ON h.cancao_id = c.cancao_id
    ORDER BY u.usuario_nome , c.cancao_nome;

CREATE VIEW top_2_hits_do_momento AS
    SELECT 
        c.cancao_nome AS cancao, COUNT(h.usuario_id) AS reproducoes
    FROM
        spotifyclone.historico_de_reproducoes AS h
            JOIN
        spotifyclone.cancao AS c ON h.cancao_id = c.cancao_id
    GROUP BY cancao
    ORDER BY reproducoes DESC , cancao
    LIMIT 2;

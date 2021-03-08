CREATE VIEW top_2_hits_do_momento AS
    SELECT 
        t1.nome AS cancao, COUNT(t2.usuario_id) AS reproducoes
    FROM
        SpotifyClone.cancoes AS t1
            INNER JOIN
        SpotifyClone.historico_reproducoes AS t2 ON t1.cancoes_id = t2.cancoes_id
    GROUP BY cancao
    ORDER BY reproducoes DESC , cancao ASC
    LIMIT 2;

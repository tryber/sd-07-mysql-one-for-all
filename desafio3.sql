CREATE VIEW historico_reproducao_usuarios AS
    SELECT 
        t1.nome AS usuario, t3.nome AS nome
    FROM
        SpotifyClone.usuario AS t1
            INNER JOIN
        SpotifyClone.historico_reproducoes AS t2 ON t1.usuario_id = t2.usuario_id
            INNER JOIN
        SpotifyClone.cancoes AS t3 ON t2.cancoes_id = t3.cancoes_id
    ORDER BY usuario ASC , nome ASC;

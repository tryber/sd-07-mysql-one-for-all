CREATE VIEW top_2_hits_do_momento AS
    SELECT 
        cancoes.nome AS cancao, COUNT(usuario.id) AS reproducoes
    FROM
        SpotifyClone.Historico AS historico
            INNER JOIN
        SpotifyClone.Cancao AS cancoes ON historico.cancao_id = cancoes.id
            INNER JOIN
        SpotifyClone.Usuario AS usuario ON historico.usuario_id = usuario.id
    GROUP BY cancao
    ORDER BY reproducoes DESC , cancao
    LIMIT 2;

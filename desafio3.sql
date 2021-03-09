USE SpotifyClone;
DROP VIEW IF EXISTS historico_reproducao_usuarios;
CREATE VIEW historico_reproducao_usuarios AS
    SELECT 
        users.nome AS usuario, cancao.nome AS nome
    FROM
        SpotifyClone.Historico AS historico
            INNER JOIN
        SpotifyClone.Cancao AS cancao ON historico.cancao_id = cancao.id
            INNER JOIN
        SpotifyClone.Usuario AS users ON historico.usuario_id = users.id
    ORDER BY usuario , nome;

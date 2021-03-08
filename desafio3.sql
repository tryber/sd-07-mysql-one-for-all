CREATE VIEW historico_reproducao_usuarios AS
    SELECT 
        u.usuario AS 'usuario', m.musica AS 'nome'
    FROM
        SpotifyClone.historico AS h
            INNER JOIN
        SpotifyClone.usuarios AS u ON h.usuario_id = u.usuario_id
            INNER JOIN
        SpotifyClone.musicas AS m ON m.musica_id = h.musica_id
    ORDER BY `usuario` , `nome`;
    
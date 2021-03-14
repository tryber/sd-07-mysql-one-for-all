CREATE VIEW historico_reproducao_usuarios AS
	SELECT
        t1.nome AS 'usuario',
        t3.nome AS 'nome'
    FROM
        SpotifyClone.usuarios AS t1
            INNER JOIN
        SpotifyClone.historico_de_reproducoes AS t2 ON t1.usuario_id = t2.usuario_id
            INNER JOIN
        SpotifyClone.cancoes AS t3 ON t2.cancao_id = t3.cancao_id
ORDER BY t1.nome, t3.nome;
 
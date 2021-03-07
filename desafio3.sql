CREATE VIEW SpotifyClone.historico_reproducao_usuarios AS
SELECT
    t1.nome AS usuario,
    t3.title AS nome
FROM SpotifyClone.Usuario AS t1
    INNER JOIN SpotifyClone.HistoricoReproducao AS t2 ON t1.id = t2.usuario_id
    INNER JOIN SpotifyClone.Cancao AS t3 ON t2.cancao_id = t3.id
ORDER BY t1.nome, t3.title;
